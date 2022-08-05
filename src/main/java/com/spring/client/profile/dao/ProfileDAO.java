package com.spring.client.profile.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.spring.client.profile.vo.ProfileVO;


public interface ProfileDAO {
	public String loginCheck(ProfileVO pvo);
	public ProfileVO MyPage(String userId);

	public int check_id(String id) throws Exception;
	public int check_email(String email) throws Exception;
	public int join_member(ProfileVO pvo) throws Exception;
	
	public void update_pw(ProfileVO pvo);
	public void update_mypage(ProfileVO pvo);
	
	
	
	
}
