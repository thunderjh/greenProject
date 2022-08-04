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
	 마이페이지 (페이지 처리 목록 조회)
	 요청 URL
	 ************************************/
	@RequestMapping(value = "/MyPage", method = RequestMethod.GET)	
	public String MyPage(@ModelAttribute("data") String userId, Model model) {
		log.info("MyPage 호출 성공");	

		model.addAttribute("userId", userId);
		
		return "profile/MyPage";	//	/WEB-INF/views/board/boardList.jsp
	}
	
	
	
	
	
	
	
	
	

    
	/***********************************
	 01 회원 목록 구현하기 (페이지 처리 목록 조회)
	 요청 URL
	 ************************************/
	@RequestMapping(value = "/profileList", method = RequestMethod.GET)
    public String profileList(Model model) {
        List<ProfileVO> profileList = profileService.profileList();
        model.addAttribute("profileList", profileList);
        return "profile/profileList";
    }    
	/***********************************
	 02-1 회원 등록 페이지로 이동
	 요청 URL
	 ************************************/
    @RequestMapping("profile/write.do")
    public String profileWrite(){
        
        return "profile/profile_write";
    }    
    /***********************************
	 02-2 회원 등록 처리 후 => 회원목록으로 리다이렉트
	 @ModelAttribute에 폼에서 입력한 데이터가 저장된다.
	 ************************************/
    @RequestMapping("profile/insert.do")
    public String profileInsert(@ModelAttribute ProfileVO pvo){
        // 테이블에 레코드 입력
        profileService.insertProfile(pvo);

        return "redirect:/profile/list.do";
    }    
    /***********************************
	 03 회원 상세 정보 구현하기 (페이지 처리 목록 조회)
	 요청 URL
	 ************************************/
    @RequestMapping(value = "/profileView", method = RequestMethod.GET)	
    public String profileView(String userId, Model model){
        // 회원 정보를 model에 저장
        model.addAttribute("vo", profileService.profileView(userId));
        //System.out.println("클릭한 아이디 확인 : "+userId);
        log.info("클릭한 아이디 : "+userId);
        // profile_view.jsp로 포워드
        return "profile/profileView";
    }
}

