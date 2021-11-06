package com.co_n_s.temp_project.blog;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import com.co_n_s.temp_project.comm.AbstractDAO;

@Repository("blogDAO")
public class BlogDAO extends AbstractDAO{ 
	
	Logger log = Logger.getLogger(this.getClass());
	
	@SuppressWarnings("unchecked")
	public ArrayList<HashMap<String, Object>> selectMyBlog(HashMap<String, Object> param) throws Exception{
		return (ArrayList<HashMap<String, Object>>) selectListAll("blog.selectMyBlog", param);
	}
	
	// 블로그 글 정보 저장
	public int insertWriteForm(HashMap<String, Object> param) throws Exception {
		return (int) insert("blog.insertwriteForm", param);
	}
	
	// 자유게시판	
	@SuppressWarnings("unchecked")
	public ArrayList<HashMap<String, Object>> selectFreeboard(HashMap<String, Object> param) throws Exception{
		return (ArrayList<HashMap<String, Object>>) selectListAll("blog.selectFreeboard", param);
	}
	
	// 업비트
	@SuppressWarnings("unchecked")
	public ArrayList<HashMap<String, Object>> selectUpbit(HashMap<String, Object> param) throws Exception{
		return (ArrayList<HashMap<String, Object>>) selectListAll("blog.selectUpbit", param);
	}
	
	// 빗썸
	@SuppressWarnings("unchecked")
	public ArrayList<HashMap<String, Object>> selectBithumb(HashMap<String, Object> param) throws Exception{
		return (ArrayList<HashMap<String, Object>>) selectListAll("blog.selectBithumb", param);
	}
	
	// 코인원
	@SuppressWarnings("unchecked")
	public ArrayList<HashMap<String, Object>> selectCoinone(HashMap<String, Object> param) throws Exception{
		return (ArrayList<HashMap<String, Object>>) selectListAll("blog.selectCoinone", param);
	}
}
