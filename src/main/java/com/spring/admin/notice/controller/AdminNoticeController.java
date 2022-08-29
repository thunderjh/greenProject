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
	 *관리자 공지사항 목록 구현하기
	 * ***********************************************************/
	@RequestMapping(value="/board/adminNoticeList", method = RequestMethod.GET)
	public String noticeAdmin(@ModelAttribute("data") NoticeVO nvo, Model model) {
		log.info("adminNoticeList 호출");
		//전체 레코드 조회
		List<NoticeVO> noticeList = adminNoticeService.noticeList(nvo);
		model.addAttribute("noticeList", noticeList);
		//전체 레코드 수 반환
		int total = adminNoticeService.noticeListCnt(nvo);
		model.addAttribute("pageMaker", new PageDTO(nvo, total));
		
		return "admin/board/adminNoticeList";
	}
	
	/************************************************************
	 * 관리자 공지사항 세부 글 구현하기
	 * ***********************************************************/
	@RequestMapping(value="/board/adminNoticeDetail", method=RequestMethod.GET)
	public String noticeDetail(@ModelAttribute("data") NoticeVO nvo, Model model) {
		log.info("adminNoticeDetail 호출 성공");

		NoticeVO detail = adminNoticeService.noticeDetail(nvo);
		log.info(nvo.getN_num());
		model.addAttribute("detail", detail);
		
		return "admin/board/adminNoticeDetail";
	}
	
	/*********************************************************************
	 *  글쓰기 폼 출력하기
	 *********************************************************************/
	@RequestMapping(value="/board/writeForm")
	public String writeForm(@ModelAttribute("data") NoticeVO nvo) {
		log.info("adminWriteForm 호출 성공");
		
		return "admin/board/writeForm";
	}
	
	/*********************************************************************
	 *  글쓰기 구현하기
	 *********************************************************************/	
	@RequestMapping(value="/board/noticeInsert", method=RequestMethod.POST)
	public String noticeInert(@SessionAttribute("adminLogin") AdminLoginVO login,   NoticeVO nvo, Model model)throws Exception{
		log.info("adminBoardInsert 호출 성공");
		
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
	 *  글수정 폼 출력하기
	 *  @param n_num
	 *  @param NoticeVO
	 *********************************************************************/
	@RequestMapping(value="/board/updateForm")
	public String updateForm(@ModelAttribute("data") NoticeVO nvo, Model model) {
		log.info("adminUpdateForm 호출 성공");
		log.info("n_num = " + nvo.getN_num());
		
		NoticeVO updateData = adminNoticeService.updateForm(nvo);
		
		model.addAttribute("updateData", updateData);
		return "admin/board/updateForm";
	}
	
	/*********************************************************************
	 *  글수정 구현하기
	 *  @param BoardVO
	 *  참고 : RedirectAttributes 객체 리다이렉트 시점(return "redirect:/경로")에
	 *  한번만 사용되는 데이터를 전송할 수 있는 addFlashAttribute()라는 기능을 지원한다.
	 *  addFlashAttribute() 메서드는 브라우저까지 전송되기는 하지만, URI상세는 보이지 않는 숨겨진 데이터의 형태로 전달된다.
	 *********************************************************************/
	@RequestMapping(value="/board/noticeUpdate", method=RequestMethod.POST)
	public String noticeUpdate(@ModelAttribute NoticeVO nvo, RedirectAttributes ras) throws Exception{
		log.info("noticeUpdate 호출 성공");
		
		int result=0;
		String url="";
		
		result = adminNoticeService.noticeUpdate(nvo);
		ras.addFlashAttribute("data",nvo);
		if(result ==1) {
			//아래 rul은 수정 후 상세 페이지로 이동
			url="/admin/board/adminNoticeDetail?n_num="+nvo.getN_num();
			//url="/board/boardDetail";
		}else {
			url="/admin/board/updateForm?n_num="+nvo.getN_num();
			//url="/board/updateForm";
		}
		return "redirect:"+url;
	}
	
	/*********************************************************************
	 *  글삭제 구현하기
	 *********************************************************************/
	@RequestMapping(value="/board/noticeDelete")
	public String noticeDelete(@ModelAttribute NoticeVO nvo, RedirectAttributes ras) throws Exception{
		log.info("noticeDelete 호출 성공");
		
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
