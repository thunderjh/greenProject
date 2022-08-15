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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.client.profile.dao.ProfileDAO;
import com.spring.client.profile.service.ProfileService;
import com.spring.client.profile.vo.ProfileVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

 
@Controller
@Log4j
@AllArgsConstructor
public class MypageController {

	@Autowired
	private ProfileService service;
	@Inject
	ProfileDAO profileDAO;

	/***********************************
	 마이페이지 
	 ************************************/
	@RequestMapping(value = "profile/mainMypage" ,method = RequestMethod.GET)	
	public String mainMypage(@ModelAttribute("data") String id, Model model) {
		log.info("mainMypage 호출 성공");		
		return "profile/mainMypage";
	}
	
	
	/***********************************
	 마이페이지 상세 정보
	 ************************************/
	@RequestMapping(value = "profile/mypage")
	public String mypage() throws Exception{
		log.info("mypage 호출 성공");
		return "profile/mypage";
	}
	
	
	/***********************************
	 회원정보 수정
	 ************************************/
	@RequestMapping(value = "profile/update_mypage", method = RequestMethod.POST)
	public String update_mypage(@ModelAttribute ProfileVO pvo, HttpSession session, RedirectAttributes rttr) throws Exception{
		log.info("update_mypage 호출 성공");
		session.setAttribute("pvo", service.update_mypage(pvo));
		rttr.addFlashAttribute("msg", "회원정보 수정 완료");
		return "redirect:/profile/mypage";
	}
	
	
	/***********************************
	 비밀번호 변경
	 ************************************/
	@RequestMapping(value = "profile/update_pw", method = RequestMethod.POST)
	public String update_pw(@ModelAttribute ProfileVO pvo, @RequestParam("old_pw") String old_pw, HttpSession session, HttpServletResponse response, RedirectAttributes rttr) throws Exception{
		log.info("update_pw 호출 성공");
		session.setAttribute("pvo", service.update_pw(pvo, old_pw, response));
		rttr.addFlashAttribute("msg", "비밀번호 수정 완료");
		return "redirect:/profile/mypage";
	}
		
	/***********************************
	 회원탈퇴
	 ************************************/
	@RequestMapping(value = "profile/withdrawal", method = RequestMethod.POST)
	public String withdrawal_form(@ModelAttribute ProfileVO pvo, HttpSession session, HttpServletResponse response) throws Exception{
		if(service.withdrawal(pvo, response)) {
			session.invalidate();
		}
		return "redirect:/greenProject";
	}	
	
	
	

    
	
}

