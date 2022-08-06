package com.spring.client.profile.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.spring.client.profile.vo.ProfileVO;

public interface ProfileService {
	public String loginCheck(ProfileVO pvo, HttpSession session);
	public void logout(HttpSession session);
	
	public ProfileVO MyPage(String userId);
	
	public void check_id(String id, HttpServletResponse response) throws Exception;
	public void check_email(String email, HttpServletResponse response) throws Exception;
	public int join_member(ProfileVO pvo, HttpServletResponse response) throws Exception;
	ProfileVO update_mypage(ProfileVO pvo) throws Exception;
	ProfileVO update_pw(ProfileVO pvo, String old_pw, HttpServletResponse response) throws Exception;
	
}