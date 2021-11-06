package com.co_n_s.temp_project.blog;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface BlogService {

	// 내 글 가져오기
	public ArrayList<HashMap<String, Object>> selectMyBlog(HashMap<String, Object> param) throws Exception;
	
	// 글 쓰기
	public int insertWriteForm(HashMap<String, Object> param)  throws Exception;

	// 자유게시판만 가져오기
	public ArrayList<HashMap<String, Object>> selectFreeboard(HashMap<String, Object> param) throws Exception;

	// 업비트만 가져오기
	public ArrayList<HashMap<String, Object>> selectUpbit(HashMap<String, Object> param) throws Exception;
	
	// 빗썸만 가져오기
	public ArrayList<HashMap<String, Object>> selectBithumb(HashMap<String, Object> param) throws Exception;
	
	// 코인원만 가져오기
	public ArrayList<HashMap<String, Object>> selectCoinone(HashMap<String, Object> param) throws Exception;
}
