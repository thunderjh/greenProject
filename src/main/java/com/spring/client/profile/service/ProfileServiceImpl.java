package com.spring.client.profile.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Service;

import com.spring.client.profile.dao.ProfileDAO;
import com.spring.client.profile.vo.ProfileVO;

@Service // service bean���� ���
public class ProfileServiceImpl implements ProfileService {

	@Inject
	ProfileDAO profileDAO;
	
	//�α��� ����
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

	@Override
	public ProfileVO MyPage(String userId) {
		return profileDAO.MyPage(userId);
	}
	
	
	
	
	// 01. ��ü ȸ�� ��� ��ȸ
    @Override
    public List<ProfileVO> profileList() {
        return profileDAO.profileList();
    }
    
    // 02. ȸ�� ���
    
    public void insertProfile(ProfileVO pvo) {
        profileDAO.insertProfile(pvo);
    }
    // 03. ȸ�� ���� �� ��ȸ 
    
    public ProfileVO profileView(String userId) {
        return profileDAO.profileView(userId);
    }
 
    
    public void deleteProfile(String userId) {        
    }
 
    
    public void updateProfile(ProfileVO pvo) {        
    }
}