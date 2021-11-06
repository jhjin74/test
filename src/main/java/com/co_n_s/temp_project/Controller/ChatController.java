package com.co_n_s.temp_project.Controller;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.co_n_s.temp_project.side.chat.ChatService;

@Controller
public class ChatController {
	
	Logger log = Logger.getLogger(this.getClass());
	

	@Resource(name="chatService")
	private ChatService chatService;
	
//	DB에 채팅 닉네임, 메시지 넣기
	@RequestMapping(value = "/insertChatLog.json", method=RequestMethod.POST)
	public ModelAndView insertChatLog(@RequestBody HashMap<String, Object> param) throws Exception {
		
		System.out.println("log param : " +param);
		
		int result = chatService.insertChatLog(param);
		System.out.println("채팅조회값 : " + result);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("jsonView");
		mv.addObject("result", result);
		
		return mv;
	}
	
//	DB에서 내용 가져오기
	@RequestMapping(value = "/selectChatLog.json", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView selectChatLog(@RequestBody HashMap<String, Object> param) throws Exception {
		
		System.out.println(param);
		ArrayList<HashMap<String, Object>> result = chatService.selectChatLog(param);
		System.out.println(result);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("jsonView");
		mv.addObject("result", result);
		
		return mv;
	}

}
