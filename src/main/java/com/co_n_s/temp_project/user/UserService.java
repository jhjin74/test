package com.co_n_s.temp_project.user;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.ModelAndView;

public interface UserService {

	// 회원가입
	public int insertUserInfo(HashMap<String, Object> param) throws Exception;
	
	// 아이디 중복 체크
	public int userIdCheck(HashMap<String, Object> param) throws Exception;
	
	// 로그인 정보 체크
	public HashMap<String, Object> userLoginCheck(HashMap<String, Object> param) throws Exception;
	
	
}
