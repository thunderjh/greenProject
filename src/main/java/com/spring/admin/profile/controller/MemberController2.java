package com.spring.admin.profile.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.admin.profile.service.MemberService;
import com.spring.client.profile.vo.ProfileVO;

@Controller
public class MemberController2 { 
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController2.class);
	
    @Inject
    MemberService memberService;
    
    // 01 회원 목록
    // url pattern mapping
    @RequestMapping("admin/memberList")
    public String memberList(Model model){
    // controller => service => dao 요청
        List<ProfileVO> list = memberService.memberList();
        model.addAttribute("list", list);
        return "admin/memberList";
    }
    
    
    // 02-1 회원 등록 페이지로 이동
    @RequestMapping("admin/member_write")
    public String memberWrite(){
        
        return "admin/member_write";
    }
    
    
    // 02-2 회원 등록 처리 후 ==> 회원목록으로 리다이렉트
    @RequestMapping("admin/member_insert")
    public String memberInsert(@ModelAttribute ProfileVO pvo){
        // 테이블에 레코드 입력
        memberService.insertMember(pvo);
        return "redirect:/admin/member_list";
    }
    
    // 03 회원 상세정보 조회
    @RequestMapping("admin/member_view")
    public String memberView(String id, Model model){
        // 회원 정보를 model에 저장
        model.addAttribute("dto", memberService.viewMember(id));
        logger.info("클릭한 아이디 : "+id);
        return "admin/member_view";
    }    
    
    
    
    
    
    
    
    
    
    
    
}
 