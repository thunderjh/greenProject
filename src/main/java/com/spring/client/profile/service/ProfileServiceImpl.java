package com.spring.client.profile.service;

import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Service;

import com.spring.client.profile.dao.ProfileDAO;
import com.spring.client.profile.vo.ProfileVO;

@Service // service bean���� ���
public class ProfileServiceImpl implements ProfileService {

	@Inject
	ProfileDAO profileDAO;
	
	//�α��� üũ
	@Override
	public String loginCheck(ProfileVO pvo, HttpSession session) {
		String name = profileDAO.loginCheck(pvo);
		if (name != null) { // ���� ���� ����
		session.setAttribute("id", pvo.getId());
		session.setAttribute("name", name);
	}
	 return name; 
	}

	@Override
	public void logout(HttpSession session) {
		session.invalidate(); // ���� �ʱ�ȭ
	}
	
	// ���������� ����ȭ��
	@Override
	public ProfileVO MyPage(String userId) {
		return profileDAO.MyPage(userId);
	}
	
	// ���̵� �ߺ� �˻�(AJAX)
	@Override
	public void check_id(String id, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.println(profileDAO.check_id(id));
		out.close();
	}

	// �̸��� �ߺ� �˻�(AJAX)
	@Override
	public void check_email(String email, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.println(profileDAO.check_email(email));
		out.close();
	}

	// ȸ������
	@Override
	public int join_member(ProfileVO pvo, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		if (profileDAO.check_id(pvo.getId()) == 1) {
			out.println("<script>");
			out.println("alert('������ ���̵� �ֽ��ϴ�.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return 0;
		} else if (profileDAO.check_email(pvo.getEmail()) == 1) {
			out.println("<script>");
			out.println("alert('������ �̸����� �ֽ��ϴ�.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return 0;
		} else {
			profileDAO.join_member(pvo);
			return 1;
		}
	}
	
	
	// ȸ������ ����
	@Override
	public ProfileVO update_mypage(ProfileVO pvo) throws Exception {
		profileDAO.update_mypage(pvo);
		return pvo;
	}
		
	// ��й�ȣ ����
	@Override
	public ProfileVO update_pw(ProfileVO pvo, String old_pw, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

			return pvo;
		
	}	

}