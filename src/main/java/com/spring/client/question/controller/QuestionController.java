package com.spring.client.question.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.client.question.serivce.QuestionService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/question/*")
@AllArgsConstructor
public class QuestionController {
	
//	private QuestionService questionService;
	
	@RequestMapping(value="/questionList", method=RequestMethod.GET)
	public String questionList() {
		log.info("questionList 호출 성공");
		
		return "question/questionList";
	}
}
