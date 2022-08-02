package com.spring.client.campaignboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping(value = "/board/*")
@AllArgsConstructor
public class CampaignBoardController {
	
	@RequestMapping(value = "/campaignBoardList", method = RequestMethod.GET)
	public String campaignBoardList() {
		log.info("campaignBoardList호출 성공!!");
		
		return "board/campaignBoardList";
	}
}
