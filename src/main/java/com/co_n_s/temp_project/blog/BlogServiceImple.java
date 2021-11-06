package com.co_n_s.temp_project.blog;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("blogService")
public class BlogServiceImple implements BlogService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="blogDAO") 
	private BlogDAO blogDAO;

	// 내 글 불러오기
	@Override
	public ArrayList<HashMap<String, Object>> selectMyBlog(HashMap<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return blogDAO.selectMyBlog(param);
	}

	// 글 쓰기
	@Override
	public int insertWriteForm(HashMap<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return blogDAO.insertWriteForm(param);
	}

	// 자유게시판만 가져오기
	@Override
	public ArrayList<HashMap<String, Object>> selectFreeboard(HashMap<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return blogDAO.selectFreeboard(param);
	}

	// 업비트만 가져오기
	@Override
	public ArrayList<HashMap<String, Object>> selectUpbit(HashMap<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return blogDAO.selectUpbit(param);
	}

	// 빗썸만 가져오기
	@Override
	public ArrayList<HashMap<String, Object>> selectBithumb(HashMap<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return blogDAO.selectBithumb(param);
	}

	// 코인원만 가져오기
	@Override
	public ArrayList<HashMap<String, Object>> selectCoinone(HashMap<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return blogDAO.selectCoinone(param);
	}
}