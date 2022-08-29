package com.spring.client.question.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		log.info("questionList 호출성공");
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
	public String questionDetail(@ModelAttribute("data") QuestionVO qvo, Model model) {
		log.info("questionDetail ȣ�� ����");

		QuestionVO detail = questionService.questionDetail(qvo);
		log.info(qvo.getQ_num());
		model.addAttribute("detail", detail);
		
		return "question/questionDetail";
	}
	
	/*********************************************************************
	 *  ��й�ȣ Ȯ��
	 *  @param q_num
	 *  @param q_pwd
	 *  @return int�� result�� 0 �Ǵ� 1�� ������ ���� �ְ�,
	 *  				String �� result ���� "���� or ����, ��ġ or ����ġ"�� ������ ���� �ִ�.(���� ���ڿ� ����)
	 *  ���� : @ResponseBody�� ���޵� �並 ���ؼ� ����ϴ� ���� �ƴ϶� HTTP Response Body�� ���� ����ϴ� ���.
	 *  			produces �Ӽ��� ������ �̵�� Ÿ�԰� ���õ� ������ �����ϴµ� ����� ���� ����Ʈ Ÿ���� ����
	 *********************************************************************/
	@ResponseBody
	@RequestMapping(value="/pwdConfirm", method=RequestMethod.POST, produces="text/plain; charset=UTF-8")
	public String pwdConfirm(QuestionVO qvo) {
		log.info("pwdConfirm ȣ�� ����");
		String value="";
		
		//�Ʒ� �������� �Է� ������ ���� ���°� ����(1 or 0)
		int result = questionService.pwdConfirm(qvo);
		if(result==1) {
			value="����";
		}else {
			value="����";
		}
		log.info("result = "+result);
		
		return value;
	}
	
	/*********************************************************************
	 *  �ۼ��� �� ����ϱ�
	 *  @param q_num
	 *  @param QuestionVO
	 *********************************************************************/
	@RequestMapping(value="/updateForm")
	public String updateForm(@ModelAttribute("data") QuestionVO qvo, Model model) {
		log.info("updateForm ȣ�� ����");
		log.info("q_num = " + qvo.getQ_num());
		
		QuestionVO updateData = questionService.updateForm(qvo);
		
		model.addAttribute("updateData", updateData);
		return "question/updateForm";
	}
	
	/*********************************************************************
	 *  �ۼ��� �����ϱ�
	 *  @param QuestionVO
	 *  ���� : RedirectAttributes ��ü �����̷�Ʈ ����(return "redirect:/���")��
	 *  �ѹ��� ���Ǵ� �����͸� ������ �� �ִ� addFlashAttribute()��� ����� �����Ѵ�.
	 *  addFlashAttribute() �޼���� ���������� ���۵Ǳ�� ������, URI�󼼴� ������ �ʴ� ������ �������� ���·� ���޵ȴ�.
	 *********************************************************************/
	@RequestMapping(value="/questionUpdate", method=RequestMethod.POST)
	public String questionUpdate(@ModelAttribute QuestionVO qvo, RedirectAttributes ras) throws Exception{
		log.info("questionUpdate ȣ�� ����");
		
		int result=0;
		String url="";
		
		result = questionService.questionUpdate(qvo);
		ras.addFlashAttribute("data",qvo);
		if(result ==1) {
			//�Ʒ� rul�� ���� �� �� �������� �̵�
			url="/question/questionDetail?q_num="+qvo.getQ_num();
			//url="/question/questionDetail";
		}else {
			url="/question/updateForm?q_num="+qvo.getQ_num();
			//url="/question/updateForm";
		}
		return "redirect:"+url;
	}
	
	/*********************************************************************
	 *  �ۻ��� �����ϱ�
	 *********************************************************************/
	@RequestMapping(value="/questionDelete")
	public String questionDelete(@ModelAttribute QuestionVO qvo, RedirectAttributes ras) throws Exception{
		log.info("boardDelete ȣ�� ����");
		
		int result = 0;
		String url ="";
		
		//result = board.Service.boardDelete(bvo.getB_num());
		result = questionService.questionDelete(qvo);
		ras.addFlashAttribute("questionVO",qvo);
		
		if(result == 1) {
			url="/question/questionList";
		}else {
			url="/question/questionDetail";
		}
		return "redirect:"+url;
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
	

	/*********************************************************************
	 *  �ۻ��� �� ��� ���� �����ϱ�
	 *********************************************************************/
	@ResponseBody
	@RequestMapping(value="/replyCnt")
	public String replyCnt(@RequestParam("q_num") int q_num) {
		log.info("replyCnt ȣ�� ����");
		
		int result = 0;
		result = questionService.replyCnt(q_num);
		
		return String.valueOf(result);
	}
}
