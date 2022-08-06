package com.spring.client.profile.daolmpl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.spring.client.profile.dao.ProfileDAO;
import com.spring.client.profile.vo.ProfileVO;

@Repository // 현재 클래스를 dao bean으로 등록
public class ProfileDAOlmpl implements ProfileDAO{
	
	@Autowired
	@Inject
	private SqlSession sqlSession; // SqlSession 의존관계 주입

	@Override
	public String loginCheck(ProfileVO pvo) {
	return sqlSession.selectOne("profile.loginCheck", pvo);
	}

	@Override
	public ProfileVO MyPage(String userId) {
		return null;
	}
	
	// 아이디 중복 검사
	public int check_id(String id) throws Exception{
		return sqlSession.selectOne("profile.check_id", id);
	}
		
	// 이메일 중복 검사
	public int check_email(String email) throws Exception{
		return sqlSession.selectOne("profile.check_email", email);
	}
		
	// 회원가입 
	@Transactional
	public int join_member(ProfileVO pvo) throws Exception{
		return sqlSession.insert("profile.join_member", pvo);
	}
	
	@Override
	public void update_pw(ProfileVO pvo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update_mypage(ProfileVO pvo) {
		// TODO Auto-generated method stub
		
	}


	

	
}
