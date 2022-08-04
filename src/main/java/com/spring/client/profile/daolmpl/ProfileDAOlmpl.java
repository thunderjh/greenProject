package com.spring.client.profile.daolmpl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.client.profile.dao.ProfileDAO;
import com.spring.client.profile.vo.ProfileVO;

@Repository // 현재 클래스를 dao bean으로 등록
public class ProfileDAOlmpl implements ProfileDAO{
	
	@Inject
	private SqlSession sqlSession; // SqlSession 의존관계 주입

	@Override
	public String loginCheck(ProfileVO pvo) {
	return sqlSession.selectOne("profile.loginCheck", pvo);
	}

	@Override
	public ProfileVO MyPage(String userId) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	// 01. 전체 회원 목록 조회
    @Override
    public List<ProfileVO> profileList() {
        return sqlSession.selectList("profile.profileList");
    }
    // 02. 회원 등록
    @Override
    public void insertProfile(ProfileVO pvo) {
        sqlSession.insert("profile.insertProfile", pvo);
    }
    // 03. 회원 정보 상세 조회
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
