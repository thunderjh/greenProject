package com.spring.admin.notice.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.admin.login.vo.AdminLoginVO;
import com.spring.admin.notice.service.AdminNoticeService;
import com.spring.client.notice.vo.NoticeVO;
import com.spring.common.vo.PageDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping(value="/admin/*")
@AllArgsConstructor
public class AdminNoticeController {
	
	private AdminNoticeService adminNoticeService;
	
	/************************************************************
	 *������ �������� ��� �����ϱ�
	 * ***********************************************************/
	@RequestMapping(value="/board/adminNoticeList", method = RequestMethod.GET)
	public String noticeAdmin(@ModelAttribute("data") NoticeVO nvo, Model model) {
		log.info("adminNoticeList ȣ��");
		//��ü ���ڵ� ��ȸ
		List<NoticeVO> noticeList = adminNoticeService.noticeList(nvo);
		model.addAttribute("noticeList", noticeList);
		//��ü ���ڵ� �� ��ȯ
		int total = adminNoticeService.noticeListCnt(nvo);
		model.addAttribute("pageMaker", new PageDTO(nvo, total));
		
		return "admin/board/adminNoticeList";
	}
	
	/************************************************************
	 * ������ �������� ���� �� �����ϱ�
	 * ***********************************************************/
	@RequestMapping(value="/board/adminNoticeDetail", method=RequestMethod.GET)
	public String noticeDetail(@ModelAttribute("data") NoticeVO nvo, Model model) {
		log.info("adminNoticeDetail ȣ�� ����");

		NoticeVO detail = adminNoticeService.noticeDetail(nvo);
		log.info(nvo.getN_num());
		model.addAttribute("detail", detail);
		
		return "admin/board/adminNoticeDetail";
	}
	
	/*********************************************************************
	 *  �۾��� �� ����ϱ�
	 *********************************************************************/
	@RequestMapping(value="/board/writeForm")
	public String writeForm(@ModelAttribute("data") NoticeVO nvo) {
		log.info("adminWriteForm ȣ�� ����");
		
		return "admin/board/writeForm";
	}
	
	/*********************************************************************
	 *  �۾��� �����ϱ�
	 *********************************************************************/	
	@RequestMapping(value="/board/noticeInsert", method=RequestMethod.POST)
	public String noticeInert(@SessionAttribute("adminLogin") AdminLoginVO login,   NoticeVO nvo, Model model)throws Exception{
		log.info("adminBoardInsert ȣ�� ����");
		
		int result = 0;
		String url="";
		nvo.setA_id(login.getA_id());
		result = adminNoticeService.noticeInsert(nvo);
		if(result ==1) {
			url = "/admin/board/adminNoticeList";
		} else {
			url = "/admin/board/writeForm";
		}
		return "redirect:"+url;
	}
	
	/*********************************************************************
	 *  �ۼ��� �� ����ϱ�
	 *  @param n_num
	 *  @param NoticeVO
	 *********************************************************************/
	@RequestMapping(value="/board/updateForm")
	public String updateForm(@ModelAttribute("data") NoticeVO nvo, Model model) {
		log.info("adminUpdateForm ȣ�� ����");
		log.info("n_num = " + nvo.getN_num());
		
		NoticeVO updateData = adminNoticeService.updateForm(nvo);
		
		model.addAttribute("updateData", updateData);
		return "admin/board/updateForm";
	}
	
	/*********************************************************************
	 *  �ۼ��� �����ϱ�
	 *  @param BoardVO
	 *  ���� : RedirectAttributes ��ü �����̷�Ʈ ����(return "redirect:/���")��
	 *  �ѹ��� ���Ǵ� �����͸� ������ �� �ִ� addFlashAttribute()��� ����� �����Ѵ�.
	 *  addFlashAttribute() �޼���� ���������� ���۵Ǳ�� ������, URI�󼼴� ������ �ʴ� ������ �������� ���·� ���޵ȴ�.
	 *********************************************************************/
	@RequestMapping(value="/board/noticeUpdate", method=RequestMethod.POST)
	public String noticeUpdate(@ModelAttribute NoticeVO nvo, RedirectAttributes ras) throws Exception{
		log.info("noticeUpdate ȣ�� ����");
		
		int result=0;
		String url="";
		
		result = adminNoticeService.noticeUpdate(nvo);
		ras.addFlashAttribute("data",nvo);
		if(result ==1) {
			//�Ʒ� rul�� ���� �� �� �������� �̵�
			url="/admin/board/adminNoticeDetail?n_num="+nvo.getN_num();
			//url="/board/boardDetail";
		}else {
			url="/admin/board/updateForm?n_num="+nvo.getN_num();
			//url="/board/updateForm";
		}
		return "redirect:"+url;
	}
	
	/*********************************************************************
	 *  �ۻ��� �����ϱ�
	 *********************************************************************/
	@RequestMapping(value="/board/noticeDelete")
	public String noticeDelete(@ModelAttribute NoticeVO nvo, RedirectAttributes ras) throws Exception{
		log.info("noticeDelete ȣ�� ����");
		
		int result = 0;
		String url ="";
		
		//result = board.Service.boardDelete(bvo.getB_num());
		result = adminNoticeService.noticeDelete(nvo);
		ras.addFlashAttribute("boardVO",nvo);
		
		if(result == 1) {
			url="/admin/board/adminNoticeList";
		}else {
			url="/admin/board/adminNoticeDetail";
		}
		return "redirect:"+url;
	}
}
