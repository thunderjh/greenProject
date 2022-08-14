package com.spring.admin.profile.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.admin.profile.dao.MemberDAOImpl;
import com.spring.client.profile.vo.ProfileVO;

@Service
public class MemberServiceImpl implements MemberService { 
    
    // MemberDAOImpl 객체를 스프링에서 생성하여 주입시킴
    @Inject
    MemberDAOImpl memberDao;
    
    // 전체 회원 목록 조회
    @Override
    public List<ProfileVO> memberList() {
        return memberDao.memberList();
    }
    
    // 회원 등록
    @Override
    public void insertMember(ProfileVO pvo) {
    	memberDao.insertMember(pvo);
    }
    
    // 회원정보 상세 조회 
    @Override
    public ProfileVO viewMember(String id) {
    	return memberDao.viewMember(id);
    }
    // 회원 삭제
    @Override
    public void deleteMember(String id) {
        
    }
    // 회원 정보 수정
    @Override
    public void updateMember(ProfileVO pvo) {
        
    }
 
}
 