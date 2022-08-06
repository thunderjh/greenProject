package com.spring.admin.mission.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.admin.mission.service.AdminMissionService;
import com.spring.client.mission.vo.MissionVO;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping(value = "/admin/*")
@AllArgsConstructor
public class AdminMissionController {

	private AdminMissionService adminMissionService;

	@GetMapping(value = "/board/pointApproval")
	public String pointApproval(@ModelAttribute("data") MissionVO bvo, Model model) {
		List<MissionVO> missionList = adminMissionService.missionList(bvo);
		model.addAttribute("missionList", missionList);

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
}
