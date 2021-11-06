package com.co_n_s.temp_project.side.chat;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("chatService")
public class ChatServiceImpl implements ChatService {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="chatDAO")
	private ChatDAO chatDAO;



	@Override
	public int insertChatLog(HashMap<String, Object> param) throws Exception {
		return chatDAO.insertChatLog(param);
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectChatLog(HashMap<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return chatDAO.selectChatLog(param);
	}
	
}
