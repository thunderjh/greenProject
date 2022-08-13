package com.spring.client.profile.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.spring.client.profile.vo.ProfileVO;
 
@Repository // 현재 클래스를 dao bean으로 등록
public class ProfileDAOlmpl implements ProfileDAO{
	
	@Autowired
	@Inject
	private SqlSession sqlSession; // SqlSession 의존관계 주입

	// 로그인 검사
	@Override
	public ProfileVO loginCheck(String id) throws Exception{
		return sqlSession.selectOne("profile.loginCheck", id);
	}	
	
	// 마이페이지 업데이트
	@Transactional
	public int update_mypage(ProfileVO pvo) throws Exception{
		return sqlSession.update("profile.update_mypage", pvo);
	}
	
	// 비밀번호 수정
	@Override
	public int update_pw(ProfileVO pvo) throws Exception{
		return sqlSession.update("profile.update_pw", pvo);
	}
	
	// 아이디 중복 검사
	@Override
	public int check_id(String id) throws Exception{
		return sqlSession.selectOne("profile.check_id", id);
	}
		
	// 이메일 중복 검사
	@Override
	public int check_email(String email) throws Exception{
		return sqlSession.selectOne("profile.check_email", email);
	}
		
	// 회원가입 
	@Override
	@Transactional
	public int join_member(ProfileVO pvo) throws Exception{
		return sqlSession.insert("profile.join_member", pvo);
	}

	// 이메일 인증
	@Override
	public int approval_member(ProfileVO pvo) throws Exception{
		return sqlSession.update("profile.approval_member", pvo);
	}

	// 아이디 찾기
	@Override
	public String find_id(String email) throws Exception{
		return sqlSession.selectOne("profile.find_id", email);
	}	
	
	// 비밀번호 찾기
	@Override
	public int find_pw(ProfileVO pvo) throws Exception {
		return sqlSession.selectOne("profile.find_pw", pvo);
	}	
	
	
	
	
	
	
	
	
	
	// 회원탈퇴
	@Transactional
	public int withdrawal(ProfileVO pvo) throws Exception{
		return sqlSession.delete("profile.withdrawal", pvo);
	}

	

}
