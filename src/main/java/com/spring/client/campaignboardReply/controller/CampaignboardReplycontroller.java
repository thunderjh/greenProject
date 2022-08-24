package com.spring.client.campaignboardReply.controller;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


import com.spring.client.campaignboardReply.service.CampaignboardReplyService;
import com.spring.client.campaignboardReply.vo.CampaignboardReplyVo;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping (value = "/clientreplies")
@Log4j
@AllArgsConstructor
public class CampaignboardReplycontroller {
	
	private CampaignboardReplyService campaignboardReplyService;
	
	//댓글입력
	@PostMapping(value="/replyInsert", consumes="application/json", produces=MediaType.TEXT_PLAIN_VALUE)
	public String  CampaignboardReplyInsert(@RequestBody CampaignboardReplyVo cb_rvo) {
		log.info("clientreplyInsert 호출 성공 ");
		log.info("cb_rvo : " + cb_rvo);
		int result = 0;
		
		
		result = campaignboardReplyService.campaignboardReplyInsert(cb_rvo);
		return (result == 1) ? "SUCCESS" :"FAILURE";
	}
	
}
