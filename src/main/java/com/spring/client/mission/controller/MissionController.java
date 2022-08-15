package com.spring.client.mission.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.client.mission.common.vo.PageDTO;
import com.spring.client.mission.service.MissionService;
import com.spring.client.mission.vo.MissionVO;
import com.spring.client.profile.vo.ProfileVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
//미션게시판컨트롤러

@Controller
@RequestMapping("/client/mission/*")
@AllArgsConstructor
@Log4j
public class MissionController {

	private MissionService missionService;
	private HttpSession session;

	// 게시글 목록 조회
	@GetMapping("/missionList")
	public String missionList(@ModelAttribute("data") MissionVO bvo, Model model) {
		//전체 레코드 조회
		List<MissionVO> missionList = missionService.missionList(bvo);
		model.addAttribute("missionList", missionList);
		
		//전체 레코드 수
		int total = missionService.missionListCnt(bvo);
		//페이징
		model.addAttribute("pageMaker",new PageDTO(total,bvo));

		return "client/mission/missionList";
	}

	// 글쓰기 폼
	@RequestMapping("/missionForm")
	public String writeForm(@ModelAttribute("data") MissionVO bvo) {
		
		return "client/mission/missionInsert";
	}

	// 새글 추가
	@PostMapping("/missionInsert")
	public String missionInsert(MissionVO bvo, Model model) throws Exception {
		ProfileVO sessionId = (ProfileVO)session.getAttribute("pvo");
		bvo.setId(sessionId.getId());
		model.addAttribute("sessionId",sessionId);
		missionService.missionInsert(bvo);

		return "redirect:/client/mission/missionList";
	}

	// 글 상세보기
	@GetMapping("/missionDetail")
	public String missionDetail(@ModelAttribute("data") MissionVO bvo, Model model) {
		MissionVO detail = missionService.missionDetail(bvo);
		model.addAttribute("detail", detail);
		return "client/mission/missionDetail";
	}

	// 글 수정 폼 이동
	@RequestMapping("/missionUpdateForm")
	public String updateForm(@ModelAttribute("data") MissionVO bvo, Model model) {
		MissionVO updateData = missionService.updateForm(bvo);
		model.addAttribute("updateData", updateData);

		return "client/mission/missionUpdate";
	}

	// 글 수정
	@PostMapping("/missionUpdate")
	public String missionUpdate(@ModelAttribute MissionVO bvo, RedirectAttributes ras) throws Exception {
		missionService.missionUpdate(bvo);
		ras.addFlashAttribute("data", bvo);

		return "redirect:/client/mission/missionDetail";

	}

	// 글 삭제
	@RequestMapping(value = "/missionDelete")
	public String missionDelete(@ModelAttribute MissionVO bvo, RedirectAttributes ras) throws Exception {
		missionService.missionDelete(bvo);
		ras.addFlashAttribute("boardVO", bvo);

		return "redirect:/client/mission/missionList";
	}
	
	//마이페이지 포인트조회
	@RequestMapping(value="/point")
	public String pointList(@ModelAttribute("data") MissionVO bvo, Model model) {
		ProfileVO sessionId = (ProfileVO)session.getAttribute("pvo");
		bvo.setId(sessionId.getId());
		List<MissionVO> pointList = missionService.pointList(bvo);
		model.addAttribute("pointList", pointList);
		int totalPoint = missionService.totalPoint(bvo);
		model.addAttribute("totalPoint", totalPoint);
		return "client/mission/point";
	}

}
