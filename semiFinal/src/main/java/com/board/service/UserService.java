package com.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.dto.User;
import com.board.mapper.UserMapper;

@Service
public class UserService {
	
	@Autowired
	UserMapper userMapper;
	
	public User getUserByUserIdAndPassword(String userId, String password) {
		User user = null;
		user = userMapper.getUserByUserIdAndPassword(userId, password);
		
		return user;
	}
	
	public User getUserByUserId(String userId) {
		User user = null;
		user = userMapper.getUserByUserId(userId);
		return user;
	}

	public boolean joinUser(String userId, String userName,String password) {
		boolean result = false;
		
		int res = userMapper.joinUser(userId,userName,password);
		if (res != 0 ) {
			result = true;
		}else {
			new Exception("회원가입 실패");
		}
		return result;
	}


}
