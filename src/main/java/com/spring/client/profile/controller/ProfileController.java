package com.spring.client.profile.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.client.profile.service.ProfileService;
import com.spring.client.profile.vo.ProfileVO;
import com.spring.client.user.controller.UserController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequestMapping("/profile/*")
@AllArgsConstructor
public class ProfileController {

	@Inject
	private ProfileService profileService;

	
	/***********************************
	 ���������� (������ ó�� ��� ��ȸ)
	 ��û URL
	 ************************************/
	@RequestMapping(value = "/MyPage", method = RequestMethod.GET)	
	public String MyPage(@ModelAttribute("data") String userId, Model model) {
		log.info("MyPage ȣ�� ����");	

		model.addAttribute("userId", userId);
		
		return "profile/MyPage";	//	/WEB-INF/views/board/boardList.jsp
	}
	
	
	
	
	
	
	
	
	

    
	/***********************************
	 01 ȸ�� ��� �����ϱ� (������ ó�� ��� ��ȸ)
	 ��û URL
	 ************************************/
	@RequestMapping(value = "/profileList", method = RequestMethod.GET)
    public String profileList(Model model) {
        List<ProfileVO> profileList = profileService.profileList();
        model.addAttribute("profileList", profileList);
        return "profile/profileList";
    }    
	/***********************************
	 02-1 ȸ�� ��� �������� �̵�
	 ��û URL
	 ************************************/
    @RequestMapping("profile/write.do")
    public String profileWrite(){
        
        return "profile/profile_write";
    }    
    /***********************************
	 02-2 ȸ�� ��� ó�� �� => ȸ��������� �����̷�Ʈ
	 @ModelAttribute�� ������ �Է��� �����Ͱ� ����ȴ�.
	 ************************************/
    @RequestMapping("profile/insert.do")
    public String profileInsert(@ModelAttribute ProfileVO pvo){
        // ���̺� ���ڵ� �Է�
        profileService.insertProfile(pvo);

        return "redirect:/profile/list.do";
    }    
    /***********************************
	 03 ȸ�� �� ���� �����ϱ� (������ ó�� ��� ��ȸ)
	 ��û URL
	 ************************************/
    @RequestMapping(value = "/profileView", method = RequestMethod.GET)	
    public String profileView(String userId, Model model){
        // ȸ�� ������ model�� ����
        model.addAttribute("vo", profileService.profileView(userId));
        //System.out.println("Ŭ���� ���̵� Ȯ�� : "+userId);
        log.info("Ŭ���� ���̵� : "+userId);
        // profile_view.jsp�� ������
        return "profile/profileView";
    }
}

