package com.spring.client.profile.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.client.profile.service.ProfileService;
import com.spring.client.profile.vo.ProfileVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequestMapping("/profile/*")
@AllArgsConstructor
public class loginController{

	@Inject
	@Autowired
	private ProfileService service;
	
	/************************************
	 * 로그인 폼 이동
	 ************************************/
	@RequestMapping(value = "/login", method = {RequestMethod.GET, RequestMethod.POST})
	public String login() throws Exception{
		log.info("login 호출 성공");
		return "profile/login";
	}	
	
	
	/************************************
	 * 로그인 체크
	 ************************************/		
	@RequestMapping(value = "/loginCheck", method = RequestMethod.POST)
	public String loginCheck(@ModelAttribute ProfileVO pvo, HttpSession session, HttpServletResponse response) throws Exception{
		log.info("loginCheck 호출 성공");
		pvo = service.loginCheck(pvo, response);	//**
		session.setAttribute("pvo", pvo);	//**
		return "profile/mainPage";
	}	
	
	
	/************************************
	 * 로그아웃
	 ************************************/	   
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public void logout(HttpSession session, HttpServletResponse response) throws Exception{
		session.invalidate();
		//session.removeAttribute("pvo");
		service.logout(response);
	}
}