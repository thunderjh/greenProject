package com.spring.client.profile.controller;

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

import com.spring.client.profile.service.ProfileService;
import com.spring.client.profile.vo.ProfileVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
 

@Controller
@Log4j
@AllArgsConstructor
public class loginController{

	@Inject
	@Autowired
	private ProfileService service;
	
	/***********************************
	 메인 페이지 
	 ************************************/
	@RequestMapping(value = "/greenProject")	
	public String mainMypage() {
		log.info("greenProject 호출 성공");		
		return "greenProject";
	}
	
	/************************************
	 * 로그인 폼 이동
	 ************************************/
	@RequestMapping(value = "/profile/login")
	public String login() throws Exception{
		log.info("login 호출 성공");
		return "profile/login";
	}
	
	
	/************************************
	 * 로그인 체크
	 ************************************/		
	@RequestMapping(value = "/profile/loginCheck", method = RequestMethod.POST)
	public String loginCheck(@ModelAttribute ProfileVO pvo, HttpSession session, HttpServletResponse response) throws Exception{
		log.info("loginCheck 호출 성공");
		pvo = service.loginCheck(pvo, response);	//**
		session.setAttribute("pvo", pvo);	//**
		return "redirect:/greenProject";
	}	
	
	
	/************************************
	 * 로그아웃
	 ************************************/	   
	@RequestMapping(value = "profile/logout", method = RequestMethod.GET)
	public void logout(HttpSession session, HttpServletResponse response) throws Exception{
		session.invalidate();
		//session.removeAttribute("pvo");
		service.logout(response);
	}
	
	
	/************************************
	 * 아이디 찾기 폼 이동
	 ************************************/
	@RequestMapping(value = "profile/find_id_form")
	public String find_id_form() throws Exception{
		return "profile/find_id_form";
	}
	
	
	/************************************
	 * 아이디 찾기
	 ************************************/
	@RequestMapping(value = "profile/find_id", method = RequestMethod.POST)
	public String find_id(HttpServletResponse response, @RequestParam("email") String email, Model md) throws Exception{
		md.addAttribute("id", service.find_id(response, email));
		return "profile/find_id";
	}
	
	
	/************************************
	 * 비밀번호 찾기 폼 이동
	 ************************************/
	@RequestMapping(value = "profile/find_pw_form")
	public String find_pw_form() throws Exception{
		return "profile/find_pw_form";
	}
	
	
	/************************************
	 * 비밀번호 찾기
	 ************************************/
	@RequestMapping(value = "profile/find_pw", method = RequestMethod.POST)
	public void find_pw(@ModelAttribute ProfileVO pvo, HttpServletResponse response) throws Exception{
		service.find_pw(response, pvo);
	}
	
	
	
	
	
}