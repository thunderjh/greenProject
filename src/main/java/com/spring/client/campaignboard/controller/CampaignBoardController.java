package com.spring.client.campaignboard.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.client.campaign.common.vo.PageDTO;
import com.spring.client.campaignboard.service.CampaignBoardService;
import com.spring.client.campaignboard.vo.CampaignBoardVo;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/client/campaignBoard/*")
@AllArgsConstructor
public class CampaignBoardController {
	
	private CampaignBoardService campaignBoardService;
	private HttpSession session;
	
	@GetMapping("/about")
	public String about() {
		log.info("about.jsp 호출 성공!!");
		
		return "client/campaignBoard/about";
	}

	//캠페인 보드 리스트
	@GetMapping("/campaignBoardList")
	public String campaignBoardList(@ModelAttribute("data") CampaignBoardVo cbvo, Model model) {
		log.info("campaignBoardList호출 성공!!");
		log.info("cbvo = " + cbvo);
		
		//전체 레코드 조회
		List<CampaignBoardVo> campaignBoardList = campaignBoardService.campaignBoardList(cbvo);
		model.addAttribute("campaignBoardList", campaignBoardList);	
		
		//전체 레코드 수 구현
		int total = campaignBoardService.campaignBoardListCnt(cbvo);
		//페이징 처리
		model.addAttribute("pageMaker", new PageDTO(cbvo, total));
		log.info("total = " + total);
		
		return "client/campaignBoard/campaignBoardList";
	}
	
	/*캠페인 게시판 디데일*/
	@GetMapping("/campaignBoardDetail")
	public String campaignBoardDetail(@ModelAttribute("data") CampaignBoardVo cbvo, Model model) {
		log.info("campaignBoardDetail호출 성공!!");
		
		CampaignBoardVo campaignBoardDetail = campaignBoardService.campaignBoardDetail(cbvo);	
		model.addAttribute("campaignBoardDetail", campaignBoardDetail);	
		return "client/campaignBoard/campaignBoardDetail";
		
	
	}



}
