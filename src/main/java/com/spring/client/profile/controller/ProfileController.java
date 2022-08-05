package com.spring.client.profile.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.client.profile.service.ProfileService;
import com.spring.client.profile.service.ProfileServiceImpl;
import com.spring.client.profile.vo.ProfileVO;
import com.spring.client.user.controller.UserController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequestMapping("/profile/*")
@AllArgsConstructor
public class ProfileController {

	@Inject
	private ProfileService profileService;
	@Autowired
	private ProfileServiceImpl service;

	
	/***********************************
	 마이페이지 (페이지 처리 목록 조회)
	 요청 URL
	 ************************************/
	@RequestMapping(value = "/MyPage", method = RequestMethod.GET)	
	public String MyPage(@ModelAttribute("data") String userId, Model model) {
		log.info("MyPage 호출 성공");	
		model.addAttribute("userId", userId);		
		return "profile/MyPage";
	}
	
	/***********************************
	 마이페이지 상세 정보 (페이지 처리 목록 조회)
	 요청 URL
	 ************************************/
	@RequestMapping(value = "/MyPage2", method = RequestMethod.GET)
	public String MyPage2() throws Exception{
		return "profile/MyPage2";
	}
	
	// 아이디 중복 검사(AJAX)
	@RequestMapping(value = "/check_id", method = RequestMethod.POST)
	public void check_id(@RequestParam("id") String id, HttpServletResponse response) throws Exception{
		service.check_id(id, response);
	}
		
	// 이메일 중복 검사(AJAX)
	@RequestMapping(value = "/check_email", method = RequestMethod.POST)
	public void check_email(@RequestParam("email") String email, HttpServletResponse response) throws Exception{
		service.check_email(email, response);
	}
		
	// 회원 가입
	@RequestMapping(value = "/join_member", method = RequestMethod.GET)
	public String join_member(@ModelAttribute ProfileVO pvo, RedirectAttributes rttr, HttpServletResponse response) throws Exception{
		log.info("MyPage 호출 성공");	
		rttr.addFlashAttribute("result", service.join_member(pvo, response));
		return "redircet:profile/join_member";
	}
	
	
	
	
	
	
	
	
	
	

    
	
}

