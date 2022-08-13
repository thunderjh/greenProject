package com.spring.client.profile.dao;

import com.spring.client.profile.vo.ProfileVO;

 
public interface ProfileDAO {
	
	public ProfileVO loginCheck(String id) throws Exception;
	
	public int check_id(String id) throws Exception;
	public int check_email(String email) throws Exception;
	public int join_member(ProfileVO pvo) throws Exception;
	public int approval_member(ProfileVO pvo) throws Exception;
	
	public int update_mypage(ProfileVO pvo) throws Exception;
	public int update_pw(ProfileVO pvo) throws Exception;
	
	public int withdrawal(ProfileVO pvo) throws Exception;

	public String find_id(String email) throws Exception;
	public int find_pw(ProfileVO pvo) throws Exception;
	


	
	
	
	
}
