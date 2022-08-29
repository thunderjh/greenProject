package com.spring.client.notice.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.client.notice.service.NoticeService;
import com.spring.client.notice.vo.NoticeVO;
import com.spring.common.vo.PageDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/notice/*")
@AllArgsConstructor
public class NoticeController {

	private NoticeService noticeService;
	
	/************************************************************
	 * 공지사항 목록 구현하기
	 * ***********************************************************/
	@RequestMapping(value="/noticeList", method=RequestMethod.GET)
	public String noticeList(@ModelAttribute NoticeVO nvo, Model model) {
		log.info("noticeList 호출 성공");
		//전체 레코드 조회
		List<NoticeVO> noticeList = noticeService.noticeList(nvo);
		model.addAttribute("noticeList", noticeList);
		//전체 레코드 수 반환
		int total = noticeService.noticeListCnt(nvo);
		model.addAttribute("pageMaker", new PageDTO(nvo, total));
		
		return "notice/noticeList";	//		/WEB-INF/views/notice/noticeList.jsp
	}
	
	/************************************************************
	 * 공지사항 세부 글 구현하기
	 * ***********************************************************/
	@RequestMapping(value="/noticeDetail", method=RequestMethod.GET)
	public String noticeDetail(@ModelAttribute("data") NoticeVO nvo, Model model) {
		log.info("noticeDetail 호출 성공");

		NoticeVO detail = noticeService.noticeDetail(nvo);
		log.info(nvo.getN_num());
		model.addAttribute("detail", detail);
		
		return "notice/noticeDetail";
	}
}
