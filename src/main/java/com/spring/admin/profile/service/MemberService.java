package com.spring.admin.profile.service;

import java.util.List;

import com.spring.client.profile.vo.ProfileVO;

public interface MemberService {
    // 회원 목록  
    public List<ProfileVO> memberList();
    // 회원 입력
    public void insertMember(ProfileVO pvo);
    // 회원 정보 상세보기
    public ProfileVO viewMember(String id);
    // 회원삭제
    public void deleteMember(String userId);
    // 회원정보 수정
    public void updateMember(ProfileVO pvo);
}
 
