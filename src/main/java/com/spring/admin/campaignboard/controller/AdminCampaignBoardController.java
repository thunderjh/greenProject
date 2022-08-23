package com.spring.admin.campaignboard.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.admin.campaignboard.service.AdminCampaignBoardService;
import com.spring.admin.login.vo.AdminLoginVO;
import com.spring.client.campaignboard.vo.CampaignBoardVo;


import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/*")
@AllArgsConstructor
@Log4j
public class AdminCampaignBoardController {

	private  AdminCampaignBoardService  adminCampaignBoardService;
	
	// 관리자 캠페인 보드 리스트
	@GetMapping("/adminCampaignBoard/campaignBoardList")
	public String campaignBoardList(@ModelAttribute("data") CampaignBoardVo cbvo, Model model) {
		log.info("admin campaignBoardList호출 성공!!");
		
		List<CampaignBoardVo> campaignBoardList = adminCampaignBoardService.campaignBoardList(cbvo);
		model.addAttribute("campaignBoardList", campaignBoardList);
		
		
		return "admin/adminCampaignBoard/campaignBoardList";

	}	
	
	/*관리자 캠페인 게시판 디데일*/
	
	@GetMapping("/adminCampaignBoard/campaignBoardDetail")
	public String campaignBoardDetail (@ModelAttribute("data") CampaignBoardVo cbvo, Model model) {
		log.info("admin campaignBoardDetail호출 성공!!");
		
		CampaignBoardVo campaignBoardDetail = adminCampaignBoardService.campaignBoardDetail(cbvo);	
		model.addAttribute("campaignBoardDetail", campaignBoardDetail);	
		return "admin/adminCampaignBoard/campaignBoardDetail";
		
	
	}
	
	
	/*글쓰기 폼 출력하기*/
	@RequestMapping(value = "/adminCampaignBoard/campaignBoardInsertForm")
	public String campaignBoardInsert() {
		log.info("campaignBoardInsert 호출 성공");
		return "admin/adminCampaignBoard/campaignBoardInsertForm";
		
	}
	
	/*캠페인 게시판 글쓰기 구현*/
	
	@RequestMapping(value = "/adminCampaignBoard/campaignBoardInsert", method = RequestMethod.POST)
	//@PostMapping("/boardInsert")
	public String boardInsert( @SessionAttribute("adminLogin") AdminLoginVO login,  CampaignBoardVo cbvo, Model model) throws Exception{
		log.info("boardInsert 호출 성공");
		
		int result = 0;
		String url ="";
		cbvo.setA_id(login.getA_id());
		
		result = adminCampaignBoardService.campaignBoardInsert(cbvo);
		
		//문제 생겼을 때 입력 화면으로 이동하기 위해서 작성
		//사실 문제 없이 성공하면 필요없음
		if(result == 1) {
			url = "/admin/adminCampaignBoard/campaignBoardList";
		}else {
			url = "/admin/adminCampaignBoard/campaignBoardInsert";
		}
		//문제시 입력 화면 이동하기 위한 if문 끝
		
		return "redirect:"+url;
	}
	
	
	/*캠페인 게시판 글 수정 하기
	 * campaignBoardUpdateForm
	 * */
	/*글 수정 폼 출력하기(수정화면 맵핑)*/
	@RequestMapping(value = "/adminCampaignBoard/campaignBoardUpdateForm")
	public String campaignBoardUpdateForm(@ModelAttribute("data") CampaignBoardVo cbvo, Model model) {
		log.info("campaignBoardUpdateForm 호출 성공");
		
		CampaignBoardVo updateData = adminCampaignBoardService.updateDataForm(cbvo);
		model.addAttribute("updateData", updateData);
		log.info("updateData"+updateData);
		return "admin/adminCampaignBoard/campaignBoardUpdateForm";
		
	}
		
	/*글수정 처리*/
	@PostMapping("/adminCampaignBoard/campaignBoardUpdate")
	public String campaignBoardUpdate(@ModelAttribute CampaignBoardVo cbvo, RedirectAttributes ras) throws Exception {
		adminCampaignBoardService.campaignBoardUpdate(cbvo);
		ras.addFlashAttribute("data", cbvo);

		return "redirect:/admin/adminCampaignBoard/campaignBoardDetail";

	}
	
	/*글삭제하기*/
	@RequestMapping(value = "/adminCampaignBoard/campaignBoardDelete")
	public String campaignBoardDelete(@ModelAttribute CampaignBoardVo cbvo, RedirectAttributes ras) throws Exception {
		
		int result = 0;
		String url = "";
		
		result = adminCampaignBoardService.campaignBoardDelete(cbvo);
		ras.addFlashAttribute("CampaignBoardVo", cbvo);
		
		//문제 생겼을 때 입력 화면으로 이동하기 위해서 작성
		//사실 문제 없이 성공하면 필요없음
		
				if(result == 1) {
					url = "/admin/adminCampaignBoard/campaignBoardList";
				}else {
					url = "/admin/adminCampaignBoard/campaignBoardDetail";
				}
				//문제시 입력 화면 이동하기 위한 if문 끝
				
				return "redirect:"+url;
	}
	
	//총 댓글 수 구하기
	@ResponseBody
	@RequestMapping(value = "/comment_cnt")
	public String comment_cnt(@RequestParam("c_no") int c_no){
		
		log.info("comment_cnt 호출 성공");
		
		int result = 0 ;
		result = adminCampaignBoardService.comment_cnt(c_no);
		
		
		return String.valueOf(result);
	}
	
}
