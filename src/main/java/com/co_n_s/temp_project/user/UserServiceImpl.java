package com.co_n_s.temp_project.user;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Resource(name="userDAO")
	private UserDAO userDAO;
	
	@Override // 회원가입
	public int insertUserInfo(HashMap<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return userDAO.insertUserInfo(param);
	}
	
	@Override // 아이디 중복 체크
	public int userIdCheck(HashMap<String, Object> param) throws Exception {
		return userDAO.userIdCheck(param);
	}
	
	@Override // 로그인 정보 체크
	public HashMap<String, Object> userLoginCheck(HashMap<String, Object> param) throws Exception {
		return userDAO.userLoginCheck(param);
	}

}
