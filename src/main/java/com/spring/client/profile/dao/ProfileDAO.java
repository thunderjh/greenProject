package com.spring.client.profile.dao;

import java.util.List;

import com.spring.client.profile.vo.ProfileVO;

public interface ProfileDAO {
	public String loginCheck(ProfileVO pvo);
	public ProfileVO MyPage(String userId);
	public List<ProfileVO> profileList();
	void insertProfile(ProfileVO pvo);
	ProfileVO profileView(String userId);
	void deleteProfile(String userId);
	void updateProfile(ProfileVO pvo);
}
