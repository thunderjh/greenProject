package com.spring.admin.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.admin.login.service.AdminLoginService;
import com.spring.admin.login.vo.AdminLoginVO;

import lombok.AllArgsConstructor;

@Controller
@SessionAttributes("adminLogin")
@RequestMapping("/admin/*")
@AllArgsConstructor
public class AdminLoginController {
	private AdminLoginService adminLoginService;

	@ModelAttribute
	public AdminLoginVO adminLogin() {
		return new AdminLoginVO();
	}

	@GetMapping("/login")
	public String loginForm() {
		return "admin/main";
	}

	@PostMapping("/login")
	public String loginProcess(AdminLoginVO login, Model model, RedirectAttributes ras) {
		String url = "";
		AdminLoginVO adminLogin = adminLoginService.loginProcess(login);

		if (adminLogin != null) {
			model.addAttribute("adminLogin", adminLogin);
			url = "/admin/board/pointApproval"; // 게시판으로 이동(우선 포인트관리 게시판으로..)
		} else {
			ras.addFlashAttribute("errorMsg", "로그인 실패");
			url = "/admin/login"; // 로그인 페이지로 이동
		}
		return "redirect:" + url;
	}

	@RequestMapping("/logout")
	public String logout(SessionStatus sessionStatus) {
		sessionStatus.setComplete(); // 세션초기화
		
		return "redirect:/admin/login";
	}
}
