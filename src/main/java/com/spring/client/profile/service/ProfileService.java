package com.spring.client.profile.service;

import javax.servlet.http.HttpServletResponse;
import com.spring.client.profile.vo.ProfileVO;
 
public interface ProfileService {

	public void check_id(String id, HttpServletResponse response) throws Exception;
	public void check_email(String email, HttpServletResponse response) throws Exception;

	public int join_member(ProfileVO pvo, HttpServletResponse response) throws Exception;
	public String create_key() throws Exception;
	public void send_mail(ProfileVO pvo) throws Exception;
	public void approval_member(ProfileVO pvo, HttpServletResponse response) throws Exception;

	public ProfileVO loginCheck(ProfileVO pvo, HttpServletResponse response) throws Exception;
	public void logout(HttpServletResponse response) throws Exception;

	public ProfileVO update_mypage(ProfileVO pvo) throws Exception;
	public ProfileVO update_pw(ProfileVO pvo, String old_pw, HttpServletResponse response) throws Exception;
	
	public String find_id(HttpServletResponse response, String email) throws Exception;
	public void find_pw(HttpServletResponse response, ProfileVO pvo) throws Exception;
	
	public boolean withdrawal(ProfileVO pvo, HttpServletResponse response) throws Exception;
	
	
	
}