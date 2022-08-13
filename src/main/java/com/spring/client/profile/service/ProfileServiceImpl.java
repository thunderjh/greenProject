package com.spring.client.profile.service;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Properties;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.spring.client.profile.dao.ProfileDAO;
import com.spring.client.profile.vo.ProfileVO;

@Service // service bean으로 등록 
public class ProfileServiceImpl implements ProfileService {

	@Inject
	ProfileDAO profileDAO;
	
	//로그인 체크
	@Override
	public ProfileVO loginCheck(ProfileVO pvo, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 등록된 아이디가 없으면
		if(profileDAO.check_id(pvo.getId()) == 0) {
			out.println("<script>");
			out.println("alert('등록된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			String passwd = pvo.getPasswd();
			pvo = profileDAO.loginCheck(pvo.getId());
			// 비밀번호가 다를 경우
			if(!pvo.getPasswd().equals(passwd)) {
				out.println("<script>");
				out.println("alert('비밀번호가 다릅니다.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
				return null;
			/* 이메일 인증을 하지 않은 경우
			}else if(!pvo.getApproval_status().equals("true")) {
				out.println("<script>");
				out.println("alert('이메일 인증 후 로그인 하세요.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
				return null;	*/
			}
		}	
		return pvo;
	}
	
	// 로그아웃
	@Override
	public void logout(HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("location.href=document.referrer;");
		out.println("</script>");
		out.close();
	}
	
	// 아이디 중복 검사(AJAX)
	@Override
	public void check_id(String id, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.println(profileDAO.check_id(id));
		out.close();
	}

	// 이메일 중복 검사(AJAX)
	@Override
	public void check_email(String email, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.println(profileDAO.check_email(email));
		out.close();
	}

	// 회원가입
	@Override
	public int join_member(ProfileVO pvo, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		if (profileDAO.check_id(pvo.getId()) == 1) {
			out.println("<script>");
			out.println("alert('동일한 아이디가 있습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return 0;
		} else if (profileDAO.check_email(pvo.getEmail()) == 1) {
			out.println("<script>");
			out.println("alert('동일한 이메일이 있습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return 0;
		} else {
			//인증키 set
			pvo.setApproval_key(create_key());
			profileDAO.join_member(pvo);
			//인증메일 전송
			send_mail(pvo);
			return 1;
		}
	}
	
	// 인증키 생성
	@Override
	public String create_key() throws Exception {
		String key = "";
		Random rd = new Random();

		for (int i = 0; i < 8; i++) {
			key += rd.nextInt(10);
		}
		return key;
	}	
	

	
	// 회원 인증
	@Override
	public void approval_member(ProfileVO pvo, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if (profileDAO.approval_member(pvo) == 0) { // 이메일 인증에 실패하였을 경우
			out.println("<script>");
			out.println("alert('잘못된 접근입니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		} else { // 이메일 인증을 성공하였을 경우
			out.println("<script>");
			out.println("alert('인증이 완료되었습니다. 로그인 후 이용하세요.');");
			out.println("location.href='../login.jsp';");
			out.println("</script>");
			out.close();
		}
	}	
	
	
	
	// 회원정보 수정
	@Override
	public ProfileVO update_mypage(ProfileVO pvo) throws Exception {
		profileDAO.update_mypage(pvo);
		return profileDAO.loginCheck(pvo.getId());
	}
	
	// 비밀번호 변경
	@Override
	public ProfileVO update_pw(ProfileVO pvo, String old_pw, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if(!old_pw.equals(profileDAO.loginCheck(pvo.getId()).getPasswd())) {
			out.println("<script>");
			out.println("alert('기존 비밀번호가 다릅니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		}else { 
			profileDAO.update_pw(pvo);
			return profileDAO.loginCheck(pvo.getId());
		}
	}

	
	
	// 아이디 찾기
	@Override
	public String find_id(HttpServletResponse response, String email) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String id = profileDAO.find_id(email);
		
		if (id == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return id;
		}
	}	
	
	// 비밀번호 찾기 
	@Override
	public void find_pw(HttpServletResponse response, ProfileVO pvo) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 아이디가 없으면
		if(profileDAO.check_id(pvo.getId()) == 0) {
			out.print("아이디가 없습니다.");
			out.close();
		}
		// 가입에 사용한 이메일이 아니면
		else if(!pvo.getEmail().equals(profileDAO.loginCheck(pvo.getId()).getEmail())) {
			out.print("잘못된 이메일 입니다.");
			out.close();
		}else {	
			// 임시 비밀번호 생성
			String passwd = "";
			for (int i = 0; i < 12; i++) {
				passwd += (char) ((Math.random() * 26) + 97);
			}
			pvo.setPasswd(passwd);
			// 비밀번호 변경
			profileDAO.update_pw(pvo);
			// 임시 비밀번호 알림
			out.print(passwd);
			out.close();
		}
	}	

		
	
	
	
	// 회원탈퇴
	@Override
	public boolean withdrawal(ProfileVO pvo, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if(profileDAO.withdrawal(pvo) != 1) {
			out.println("<script>");
			out.println("alert('회원탈퇴 실패');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return false;
		}else {
			return true;
		}
	}

	@Override
	public void send_mail(ProfileVO pvo) throws Exception {
	}


}