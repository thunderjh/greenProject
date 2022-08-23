package com.spring.admin.campaignboardReply.controller;

import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	//댓글 보여주기
	@GetMapping(value = "/all/{c_no}", produces = MediaType.APPLICATION_JSON_VALUE)
	public List<AdminCampaignboardReplyVo> replyList(@PathVariable("c_no") Integer c_no){
		log.info("list 호출 성공");
		
		List<AdminCampaignboardReplyVo> entity = null;
		entity = adminCampaignboardReplyService.adminCampaignboardReplyList(c_no);
		return entity;
	}
	//댓글입력
	@PostMapping(value="/replyInsert", consumes="application/json", produces=MediaType.TEXT_PLAIN_VALUE)
	public String  adminCampaignboardReplyInsert(@RequestBody AdminCampaignboardReplyVo cb_rvo) {
		int result = adminCampaignboardReplyService.adminCampaignboardReplyInsert(cb_rvo);
		return (result == 1) ? "SUCCESS" :"FAILURE";
	}
	
	
	
	
	//댓글 삭제
	
	@DeleteMapping(value = "/{c_r_num}", produces = MediaType.TEXT_PLAIN_VALUE)
	public String  adminCampaignboardReplyDelete(@PathVariable("c_r_num") Integer c_r_num, AdminCampaignboardReplyVo cb_rvo){
		log.info("reply delete 호출 성공");
		
		cb_rvo.setC_r_num(c_r_num);
		int result = adminCampaignboardReplyService.adminCampaignboardReplyDelete(cb_rvo);
		return (result == 1) ? "SUCCESS" :"FAILURE";
	}
	
}
