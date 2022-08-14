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
	 * ��������  ��� �����ϱ�
	 * ***********************************************************/
	@RequestMapping(value="/questionList", method=RequestMethod.GET)
	public String questionList(@ModelAttribute QuestionVO qvo, Model model) {
		log.info("questionList ȣ�� ����");
		//��ü ���ڵ� ��ȸ
		List<QuestionVO> questionList = questionService.questionList(qvo);
		model.addAttribute("questionList", questionList);
		//��ü ���ڵ� �� ��ȯ
		int total = questionService.questionListCnt(qvo);
		model.addAttribute("pageMaker", new PageDTO(qvo, total));
		
		return "question/questionList";		// /WEB-INF/views/question/questionList.jsp
	}
	
	/************************************************************
	 * ���ǻ��� ���� �� �����ϱ�
	 * ***********************************************************/
	@RequestMapping(value="/questionDetail", method=RequestMethod.GET)
	public String noticeDetail(@ModelAttribute("data") QuestionVO qvo, Model model) {
		log.info("questionDetail ȣ�� ����");

		QuestionVO detail = questionService.questionDetail(qvo);
		log.info(qvo.getQ_num());
		model.addAttribute("detail", detail);
		
		return "question/questionDetail";
	}
	
	/************************************************************
	 * ���ǻ��� �� ����
	 * ***********************************************************/
	@RequestMapping(value="/writeForm")
	public String writeForm(@ModelAttribute("data") QuestionVO qvo) {
		log.info("writeForm ȣ�� ����");
		
		return "question/writeForm";
	}
	
	/************************************************************
	 * �۾��� �����ϱ�
	 * ***********************************************************/
	@RequestMapping(value="/questionInsert", method=RequestMethod.POST)
	public String questionInsert(QuestionVO qvo, Model model)throws Exception {
		log.info("questionInsert ȣ�� ����");
		
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
