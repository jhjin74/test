package com.co_n_s.temp_project.Controller;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.co_n_s.temp_project.user.UserService;

@Controller
public class LoginController {
	
	@Resource(name="userService")
	private UserService userService;

	@RequestMapping(value = "/join.ds")
	public ModelAndView join() throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("comm/header/join");

		return mv;
	}
	
	@RequestMapping(value = "/login.ds")
	public ModelAndView login() throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("comm/header/login");
		
		return mv;
	}
	
	// 로그인 정보 체크
		@RequestMapping(value = "/login/logininfo.json", method=RequestMethod.POST)
		public ModelAndView userLoginCheck(@RequestBody HashMap<String, Object> param, HttpServletRequest request) throws Exception {
			
			HashMap<String, Object> result = userService.userLoginCheck(param);
						
			result.get("USER_NICKNAME");
			System.out.println(result.get("USER_NICKNAME"));
			ModelAndView mv = new ModelAndView();
			mv.setViewName("jsonView");
			mv.addObject("user_nick", result.get("USER_NICKNAME"));
			System.out.println("닉네임 : " + result.get("USER_NICKNAME"));
			
			if ( result.get("USER_NICKNAME").toString() != null ) {
				HttpSession session = request.getSession();
				session.setAttribute("user_nick", result.get("USER_NICKNAME"));
				
				System.out.println("닉네임은 " + session.getAttribute("user_nick"));
			}
			 
			
			return mv;
		}
	
	// 아이디 중복 체크
	@RequestMapping(value = "/join/idcheck.json", method=RequestMethod.POST)
	public ModelAndView userIdCheck(@RequestBody HashMap<String, Object> param) throws Exception {
					
		int result = userService.userIdCheck(param);
		System.out.println(result);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("jsonView");
		mv.addObject("result", result);
		
		return mv;
	}
	
	// 회원가입
	@RequestMapping(value = "/join/joininfo.json", method=RequestMethod.POST)
	public ModelAndView insertUserInfo(@RequestBody HashMap<String, Object> param) throws Exception {
			
		System.out.println(param);
		
		int result = userService.insertUserInfo(param);
		
		System.out.println(result);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("jsonView");
		mv.addObject("result", result);
		
		return mv;
	}
	

}