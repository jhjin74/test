package com.co_n_s.temp_project.side.chat;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.ModelAndView;

public interface ChatService {
	
	// 메시지 내용 넣기
	public int insertChatLog(HashMap<String, Object> param) throws Exception;
	
	// 채팅대화 가져오기
	public ArrayList<HashMap<String, Object>> selectChatLog(HashMap<String, Object> param) throws Exception;
	
}
