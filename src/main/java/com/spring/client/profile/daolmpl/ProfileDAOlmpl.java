package com.spring.client.profile.daolmpl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.client.profile.dao.ProfileDAO;
import com.spring.client.profile.vo.ProfileVO;

@Repository // ���� Ŭ������ dao bean���� ���
public class ProfileDAOlmpl implements ProfileDAO{
	
	@Inject
	private SqlSession sqlSession; // SqlSession �������� ����

	@Override
	public String loginCheck(ProfileVO pvo) {
	return sqlSession.selectOne("profile.loginCheck", pvo);
	}

	@Override
	public ProfileVO MyPage(String userId) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	// 01. ��ü ȸ�� ��� ��ȸ
    @Override
    public List<ProfileVO> profileList() {
        return sqlSession.selectList("profile.profileList");
    }
    // 02. ȸ�� ���
    @Override
    public void insertProfile(ProfileVO pvo) {
        sqlSession.insert("profile.insertProfile", pvo);
    }
    // 03. ȸ�� ���� �� ��ȸ
    @Override
    public ProfileVO profileView(String userId) {
        return sqlSession.selectOne("profile.viewProfile", userId);
    }
 
    @Override
    public void deleteProfile(String userId) {
 
    }
 
    @Override
    public void updateProfile(ProfileVO pvo) {
 
    }
}
