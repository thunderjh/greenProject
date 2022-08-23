package com.spring.admin.campaignboardReply.controller;

import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.admin.campaignboardReply.service.AdminCampaignboardReplyService;
import com.spring.admin.campaignboardReply.vo.AdminCampaignboardReplyVo;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping (value = "/replies")
@Log4j
@AllArgsConstructor
public class AdminCampaignboardReplycontroller {
	
	
	private AdminCampaignboardReplyService adminCampaignboardReplyService;
	
	@GetMapping(value = "/all/{c_no}", produces = MediaType.APPLICATION_JSON_VALUE)
	public List<AdminCampaignboardReplyVo> replyList(@PathVariable("c_no") Integer c_no){
		log.info("list 호출 성공");
		
		List<AdminCampaignboardReplyVo> entity = null;
		entity = adminCampaignboardReplyService.adminCampaignboardReplyList(c_no);
		return entity;
	}
}
