package com.spring.client.profile.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.client.profile.dao.ProfileDAO;
import com.spring.client.profile.service.ProfileServiceImpl;
import com.spring.client.profile.vo.ProfileVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

 
@Controller
@Log4j
@AllArgsConstructor
public class MemberController {

	@Inject
	ProfileDAO profileDAO;
	@Autowired
	private ProfileServiceImpl service;
	
	/***********************************
	 회원 가입 폼 이동
	 ************************************/
	@RequestMapping(value = "profile/memberJoinForm", method = RequestMethod.GET)
	public String memberJoinForm() throws Exception{
		log.info("memberJoinForm 호출 성공");	
		return "profile/memberJoinForm";
	}
	
	
	/***********************************
	 회원가입
	 ************************************/
	@RequestMapping(value = "profile/join_member", method = {RequestMethod.POST,RequestMethod.GET})
	public String join_member(@ModelAttribute ProfileVO pvo, RedirectAttributes rttr, HttpServletResponse response) throws Exception{
		log.info("join_member 호출 성공");	
		rttr.addFlashAttribute("result", service.join_member(pvo, response));
		return "mainPage";
	}
	
	
	/***********************************
	 이메일 인증
	 ************************************
	@RequestMapping(value = "/approval_member", method = RequestMethod.POST)
	public void approval_member(@ModelAttribute  ProfileVO pvo, HttpServletResponse response) throws Exception{
		service.approval_member(pvo, response);
	}*/	
	
	
	/***********************************
	 아이디 중복 검사(AJAX)
	 ************************************/
	@RequestMapping(value = "profile/check_id", method = RequestMethod.POST)
	public void check_id(@RequestParam("id") String id, HttpServletResponse response) throws Exception{
		service.check_id(id, response);
	}
	
	
	/***********************************
	 이메일 중복 검사(AJAX)
	 ************************************/
	@RequestMapping(value = "profile/check_email", method = RequestMethod.POST)
	public void check_email(@RequestParam("email") String email, HttpServletResponse response) throws Exception{
		service.check_email(email, response);
	}	
	
}

