package com.spring.admin.profile.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.client.profile.vo.ProfileVO;

@Repository
public class MemberDAOImpl implements MemberDAO { 
    
    @Inject
    SqlSession sqlSession;
    
    // 회원목록 조회
    @Override
    public List<ProfileVO> memberList() {
        return sqlSession.selectList("com.spring.admin.profile.dao.MemberDAO.memberList");
    }
    
    // 회원 등록
    @Override
    public void insertMember(ProfileVO pvo) {
    	sqlSession.insert("profile.insertMember", pvo);
    }
 
    // 회원정보 상세 조회
    @Override
    public ProfileVO viewMember(String id) {
        return sqlSession.selectOne("profile.viewMember", id);
    }
    
    // 회원 삭제
    @Override
    public void deleteMember(String id) {
    }
    
    // 회원정보 수정
    @Override
    public void updateMember(ProfileVO pvo) {
    }
 
}
 