package com.board.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.board.dto.Board;
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
	public String joinUser(@ModelAttribute User newUser) {
		User user = null;
		String view = "error";
		boolean result = false;
		
		user = userService.getUserByUserId(newUser.getUserId());
		if(user == null) {
			result = userService.joinUser(newUser.getUserId(), 
										  newUser.getUserName(), 
										  newUser.getPassword());
			if(result) {
				view = "redirect:/login";
			}
		}
		System.out.println(user);
		return view;	
	}
	
	
	// 회원정보 수정폼
	@RequestMapping(value = "/modify/user/{userId}", method = RequestMethod.GET)
	public String updateUserForm(@PathVariable String userId, Model model) {
		User user = userService.getUserByUserId(userId);
		model.addAttribute("User", user);
		
		if(user.getGrade() == "관리자") {
			return "updateUserForAdmin";
		}
		
		return "updateUser";
	}
	
	// 회원정보 수정(회원용)
	@RequestMapping(value = "/user/{userId}", method = RequestMethod.POST)
	public String updateUser(@PathVariable String userId, @ModelAttribute User newUser) {
		String view = "error";
		User user = null;
		boolean result = false;
		
		try {
			user = userService.getUserByUserId(userId);
			
			user.setPassword(newUser.getPassword());
			user.setUserName(newUser.getUserName());
			
			result = userService.updateUserByUserId(user);
			
			if(result) {
				view = "redirect:/user/" + userId;
				return view;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return view;
		}
		return view;
	}
	
	// 회원정보 수정 (관리자용)
	@RequestMapping(value = "/user/{userId}", method = RequestMethod.POST)
	public String updateUserForAdmin(@PathVariable String userId, @ModelAttribute User newUser) {
		String view = "error";
		User user = null;
		boolean result = false;
		
		try {
			user = userService.getUserByUserId(userId);
			
			user.setPassword(newUser.getPassword());
			user.setGrade(newUser.getGrade());
			
			result = userService.updateUserByUserId(user);
			
			if(result) {
				view = "redirect:/user/" + userId;
				return view;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return view;
		}
		return view;
	}
	
	
	//회원탈퇴 (회원정보 삭제)
	@RequestMapping(value = "/user/{userId}", method = RequestMethod.DELETE)
	public String deleteUser(@PathVariable String userId) throws SQLException, Exception {
		
		String view = "error";
		boolean result = false;
		
		result = userService.deleteUserByUserId(userId);
		
		if(result) {
			view = "redirect:/main";
			return view;
		}
		return view;
	}	
	
}
	
	

