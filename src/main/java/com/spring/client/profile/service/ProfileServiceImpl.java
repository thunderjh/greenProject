package com.spring.client.profile.service;

import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
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
	public String loginCheck(ProfileVO pvo, HttpSession session) {
		String name = profileDAO.loginCheck(pvo);
		if (name != null) { // 세션 변수 저장
		session.setAttribute("id", pvo.getId());
		session.setAttribute("name", name);
	}
	 return name; 
	}

	@Override
	public void logout(HttpSession session) {
		session.invalidate(); // 세션 초기화
	}
	
	// 마이페이지 메인화면
	@Override
	public ProfileVO MyPage(String userId) {
		return profileDAO.MyPage(userId);
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
			profileDAO.join_member(pvo);
			return 1;
		}
	}
	
	
	// 회원정보 수정
	@Override
	public ProfileVO update_mypage(ProfileVO pvo) throws Exception {
		profileDAO.update_mypage(pvo);
		return pvo;
	}
		
	// 비밀번호 변경
	@Override
	public ProfileVO update_pw(ProfileVO pvo, String old_pw, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

			return pvo;
		
	}	

}