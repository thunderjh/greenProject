package com.spring.client.missionReply.controller;

import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.client.missionReply.service.MissionReplyService;
import com.spring.client.missionReply.vo.MissionReplyVO;

import lombok.AllArgsConstructor;

@RestController
@RequestMapping(value = "/missionReplies")
@AllArgsConstructor
public class MissionReplyController {

	
	private MissionReplyService missionReplyService;
	

	@GetMapping(value = "/all/{m_no}", produces = MediaType.APPLICATION_JSON_VALUE)
	public List<MissionReplyVO> missionReplyList(@PathVariable("m_no") Integer m_no) {
		List<MissionReplyVO> entity = missionReplyService.missionReplyList(m_no);
		return entity;
	}
	
	@PostMapping(value="/replyInsert", consumes="application/json", produces=MediaType.TEXT_PLAIN_VALUE)
	public String  missionReplyInsert(@RequestBody MissionReplyVO rvo) {
		int result = missionReplyService.missionReplyInsert(rvo);
		return (result == 1) ? "SUCCESS" :"FAILURE";
	}
	
	@DeleteMapping(value="/{m_r_num}",consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE)
	public String missionReplyDelete(@PathVariable("m_r_num") Integer m_r_num, @RequestBody MissionReplyVO rvo ) {
		rvo.setM_r_num(m_r_num);
		int result = missionReplyService.missionReplyDelete(rvo);
		return (result == 1) ? "SUCCESS" :"FAILURE";
	}
	
	@PutMapping(value="/{m_r_num}", consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE)
	public String missionReplyUpdate(@PathVariable("m_r_num") Integer m_r_num, @RequestBody MissionReplyVO rvo) {
		rvo.setM_r_num(m_r_num);
		int result = missionReplyService.missionReplyUpdate(rvo);
		return (result == 1) ? "SUCCESS" :"FAILURE";

	}
}
