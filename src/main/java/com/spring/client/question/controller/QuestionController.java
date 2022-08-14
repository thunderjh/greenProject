package com.spring.client.question.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.client.question.serivce.QuestionService;
import com.spring.client.question.vo.QuestionVO;
import com.spring.common.vo.PageDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/question/*")
@AllArgsConstructor
public class QuestionController {
	
	private QuestionService questionService;
	
	
	/************************************************************
	 * 공지사항  목록 구현하기
	 * ***********************************************************/
	@RequestMapping(value="/questionList", method=RequestMethod.GET)
	public String questionList(@ModelAttribute QuestionVO qvo, Model model) {
		log.info("questionList 호출 성공");
		//전체 레코드 조회
		List<QuestionVO> questionList = questionService.questionList(qvo);
		model.addAttribute("questionList", questionList);
		//전체 레코드 수 반환
		int total = questionService.questionListCnt(qvo);
		model.addAttribute("pageMaker", new PageDTO(qvo, total));
		
		return "question/questionList";		// /WEB-INF/views/question/questionList.jsp
	}
	
	/************************************************************
	 * 문의사항 세부 글 구현하기
	 * ***********************************************************/
	@RequestMapping(value="/questionDetail", method=RequestMethod.GET)
	public String noticeDetail(@ModelAttribute("data") QuestionVO qvo, Model model) {
		log.info("questionDetail 호출 성공");

		QuestionVO detail = questionService.questionDetail(qvo);
		log.info(qvo.getQ_num());
		model.addAttribute("detail", detail);
		
		return "question/questionDetail";
	}
	
	/************************************************************
	 * 문의사항 글 쓰기
	 * ***********************************************************/
	@RequestMapping(value="/writeForm")
	public String writeForm(@ModelAttribute("data") QuestionVO qvo) {
		log.info("writeForm 호출 성공");
		
		return "question/writeForm";
	}
	
	/************************************************************
	 * 글쓰기 구현하기
	 * ***********************************************************/
	@RequestMapping(value="/questionInsert", method=RequestMethod.POST)
	public String questionInsert(QuestionVO qvo, Model model)throws Exception {
		log.info("questionInsert 호출 성공");
		
		int result = 0;
		String url="";
		
		result = questionService.questionInsert(qvo);
		if(result == 1) {
			url = "/question/questionList";
		} else {
			url = "/question/writeForm";
		}
		return "redirect:"+url;
	}
}
