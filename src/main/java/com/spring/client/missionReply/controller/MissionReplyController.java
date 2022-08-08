package com.spring.client.missionReply.controller;

import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.client.missionReply.service.MissionReplyService;
import com.spring.client.missionReply.vo.MissionReplyVO;

import lombok.AllArgsConstructor;

@RestController
@RequestMapping(value = "/MissionReplies")
@AllArgsConstructor
public class MissionReplyController {

	
	private MissionReplyService missionReplyService;

	@GetMapping(value = "/all/{m_no}", produces = MediaType.APPLICATION_JSON_VALUE)
	public List<MissionReplyVO> MissionReplyList(@PathVariable("m_no") Integer m_no) {
		List<MissionReplyVO> entity = missionReplyService.MissionReplyList(m_no);

		return entity;
	}
}
