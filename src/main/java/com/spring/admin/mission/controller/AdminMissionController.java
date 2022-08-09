package com.spring.admin.mission.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.admin.mission.service.AdminMissionService;
import com.spring.client.mission.common.vo.PageDTO;
import com.spring.client.mission.service.MissionService;
import com.spring.client.mission.vo.MissionVO;

import lombok.AllArgsConstructor;
//관리자포인트관리컨트롤러
@Controller
@RequestMapping(value = "/admin/*")
@AllArgsConstructor
public class AdminMissionController {

	
	private AdminMissionService adminMissionService;
	private MissionService missionService;

	@GetMapping(value = "/board/pointApproval")
	public String pointApproval(@ModelAttribute("data") MissionVO bvo, Model model) {
		List<MissionVO> missionList = adminMissionService.missionList(bvo);
		int totalPoint = adminMissionService.totalPoint(bvo);
		model.addAttribute("missionList", missionList);
		model.addAttribute("totalPoint", totalPoint);
		
		int total = missionService.missionListCnt(bvo);
		model.addAttribute("pageMaker",new PageDTO(total,bvo));
		
		
		return "admin/board/pointApproval";
	}

	@PostMapping(value = "/board/pointPlus")
	public String pointPlus(@ModelAttribute("data") MissionVO bvo, Model model) {
		adminMissionService.pointPlus(bvo);

		return "redirect:/admin/board/pointApproval";
	}

	@PostMapping(value = "/board/pointCancle")
	public String pointCancle(@ModelAttribute("data") MissionVO bvo, Model model) {
		adminMissionService.pointCancle(bvo);

		return "redirect:/admin/board/pointApproval";
	}
	
	@RequestMapping(value = "board/missionAdminDelete")
	public String missionDelete(@ModelAttribute MissionVO bvo, RedirectAttributes ras) throws Exception {
		adminMissionService.missionAdminDelete(bvo);
		ras.addFlashAttribute("boardVO", bvo);

		return "redirect:/admin/board/pointApproval";
	}
}
