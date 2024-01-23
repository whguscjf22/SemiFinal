package com.board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.board.dto.User;
import com.board.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginForm() {
		return "login";
	}
	
	// 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(String userId, String password, HttpSession session) {
		String view = "error";
		User user = null;
		
		user = userService.getUserByUserIdAndPassword(userId, password);
		System.out.println(user);
		if(user!=null) {
			session.setAttribute("userName", user.getUserId());
			session.setAttribute("userGrade", user.getGrade());
			view = "redirect:/main";
			return view;
		}
		return view;
	}
	
	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {

		if(session != null) {
			session.invalidate();
		}
		return "redirect:/main";
	}
	
	
	@RequestMapping(value = "/joinUser", method = RequestMethod.GET)
	public String joinUserForm() {
		return "joinUser";
	}
	
	// 회원가입
	@RequestMapping(value="/joinUser", method = RequestMethod.POST)
	public String joinUser(String userId, String userName,String password) {
		User user = null;
		String view = "error";
		boolean result = false;
		
		user = userService.getUserByUserId(userId);
		if(user == null) {
			result = userService.joinUser(userId, userName, password);
			if(result) {
				view = "redirect:/main";
			}
		}
		System.out.println(user);
		return view;
				
	}
}
	
	

