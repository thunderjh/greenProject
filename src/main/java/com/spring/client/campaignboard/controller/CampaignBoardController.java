package com.spring.client.campaignboard.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.client.campaignboard.service.CampaignBoardService;
import com.spring.client.campaignboard.vo.CampaignBoardVo;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping(value = "/board/*")
@AllArgsConstructor
public class CampaignBoardController {
	
	private CampaignBoardService campaignBoardService;
	
	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public String about() {
		log.info("about.jsp 호출 성공!!");
		
		return "board/about";
	}
	
	
	
	@RequestMapping(value = "/campaignBoard/campaignBoardList", method = RequestMethod.GET)
	public String campaignBoardList(@ModelAttribute("data") CampaignBoardVo cbvo, Model model) {
		log.info("campaignBoardList호출 성공!!");
		//전체 레코드 조회
		List<CampaignBoardVo> campaignBoardList = campaignBoardService.campaignBoardList(cbvo);
		model.addAttribute("campaignBoardList", campaignBoardList);
		
		
		return "board/campaignBoard/campaignBoardList";
	}
	/*
	
	@RequestMapping(value = "/campaignBoard/campaignBoardList", method = RequestMethod.GET)
	public String campaignBoardList() {
		log.info("campaignBoardList호출 성공!!");
		//전체 레코드 조회

		
		
		return "board/campaignBoard/campaignBoardList";
	
	}*/
	
}
