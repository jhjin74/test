package com.co_n_s.temp_project.side.chat;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import com.co_n_s.temp_project.comm.AbstractDAO;

@Repository("chatDAO")
public class ChatDAO extends AbstractDAO{
	
	Logger log = Logger.getLogger(this.getClass());
	
	@SuppressWarnings("unchecked")
	public ArrayList<HashMap<String, Object>> selectChatLog(HashMap<String, Object> param) throws Exception{
		return (ArrayList<HashMap<String, Object>>) selectListAll("chat.selectChatLog", param);
	}

	// 메시지 내용 넣기
	public int insertChatLog(HashMap<String, Object> param) throws Exception {
		return (int) insert("chat.insertChatLog", param);
	}
}
