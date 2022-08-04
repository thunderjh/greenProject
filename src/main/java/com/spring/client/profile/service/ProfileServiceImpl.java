package com.spring.client.profile.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Service;

import com.spring.client.profile.dao.ProfileDAO;
import com.spring.client.profile.vo.ProfileVO;

@Service // service bean으로 등록
public class ProfileServiceImpl implements ProfileService {

	@Inject
	ProfileDAO profileDAO;
	
	//로그인 구현
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

	@Override
	public ProfileVO MyPage(String userId) {
		return profileDAO.MyPage(userId);
	}
	
	
	
	
	// 01. 전체 회원 목록 조회
    @Override
    public List<ProfileVO> profileList() {
        return profileDAO.profileList();
    }
    
    // 02. 회원 등록
    
    public void insertProfile(ProfileVO pvo) {
        profileDAO.insertProfile(pvo);
    }
    // 03. 회원 정보 상세 조회 
    
    public ProfileVO profileView(String userId) {
        return profileDAO.profileView(userId);
    }
 
    
    public void deleteProfile(String userId) {        
    }
 
    
    public void updateProfile(ProfileVO pvo) {        
    }
}