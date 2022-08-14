/*
 * package com.spring.client.profile.controller;
 * 
 * import java.util.List;
 * 
 * import javax.inject.Inject; import javax.servlet.http.HttpSession;
 * 
 * import org.springframework.stereotype.Controller; import
 * org.springframework.ui.Model; import
 * org.springframework.web.bind.annotation.ModelAttribute; import
 * org.springframework.web.bind.annotation.RequestMapping; import
 * org.springframework.web.bind.annotation.RequestMethod; import
 * org.springframework.web.servlet.ModelAndView;
 * 
 * import com.spring.client.profile.service.ProfileService; import
 * com.spring.client.profile.vo.ProfileVO; import
 * com.spring.client.user.controller.UserController;
 * 
 * import lombok.AllArgsConstructor; import lombok.extern.log4j.Log4j;
 * 
 * 
 * @Controller
 * 
 * @Log4j
 * 
 * @RequestMapping("/profile/*")
 * 
 * @AllArgsConstructor public class loginController{
 * 
 * @Inject private ProfileService profileService;
 * 
 *//************************************
	 * 濡쒓렇�씤
	 ************************************/
/*
 * @RequestMapping(value = "/login" , method = RequestMethod.GET) public String
 * login() { log.info("login �샇異� �꽦怨�");
 * 
 * return "profile/login"; // /WEB-INF/views/profile/login.jsp }
 * 
 *//************************************
	 * 濡쒓렇�씤 泥댄겕
	 ************************************/
/*
 * @RequestMapping(value = "/loginCheck", method = RequestMethod.POST) public
 * ModelAndView loginCheck(@ModelAttribute ProfileVO pvo, HttpSession session) {
 * log.info("loginCheck �샇異� �꽦怨�");
 * 
 * String name = profileService.loginCheck(pvo, session); ModelAndView mav = new
 * ModelAndView();
 * 
 * if (name != null) { // 濡쒓렇�씤 �꽦怨� �떆 mav.setViewName("profile/mainPage"); //
 * 酉곗쓽 �씠由� } else { // 濡쒓렇�씤 �떎�뙣 �떆 mav.setViewName("profile/login");
 * mav.addObject("message", "error"); } return mav; }
 * 
 *//************************************
	 * 濡쒓렇�븘�썐
	 ************************************//*
											 * @RequestMapping(value = "/logout", method = RequestMethod.GET) public
											 * ModelAndView logout(HttpSession session, ModelAndView mav) {
											 * log.info("logout �샇異� �꽦怨�"); profileService.logout(session);
											 * mav.setViewName("profile/login"); mav.addObject("message", "logout");
											 * return mav; } }
											 * 
											 */