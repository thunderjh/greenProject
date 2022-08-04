package com.spring.client.profile.service;

import java.util.List;

import javax.servlet.http.HttpSession;
import com.spring.client.profile.vo.ProfileVO;

public interface ProfileService {
	public String loginCheck(ProfileVO pvo, HttpSession session);
	public void logout(HttpSession session);
	public ProfileVO MyPage(String userId);
	public List<ProfileVO> profileList();
	public Object profileView(String userId);
	public void insertProfile(ProfileVO pvo);
	void deleteProfile(String userId);
	void updateProfile(ProfileVO pvo);
	
}