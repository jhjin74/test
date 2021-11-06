package com.co_n_s.temp_project.user;

import java.util.HashMap;

import org.springframework.stereotype.Repository;

import com.co_n_s.temp_project.comm.AbstractDAO;

@Repository("userDAO")
public class UserDAO extends AbstractDAO {
	
	// 회원가입 정보
	public int insertUserInfo(HashMap<String, Object> param) throws Exception {
		return (int) insert("user.insertUserInfo", param);
	}
	
	// 아이디 중복 체크
	public int userIdCheck(HashMap<String, Object> param) throws Exception{
		return (int) selectOne("user.userIdCheck", param);
	}
	
	// 로그인 정보 체크
	public HashMap<String, Object> userLoginCheck(HashMap<String, Object> param) throws Exception{
		return (HashMap<String, Object>) selectOne("user.userLoginCheck", param);
	}
	
}
