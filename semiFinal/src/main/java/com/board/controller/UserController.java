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
import org.springframework.web.bind.annotation.RequestParam;
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
			session.setAttribute("userId", user.getUserId());
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
	public String joinUser(@ModelAttribute User newUser, Model model) {
		User user = null;
		String view = "error";
		boolean result = false;
		System.out.println(newUser);		
		if(newUser.getUserId() == null || newUser.getUserId().isEmpty() || newUser.getPassword() == null) {
			model.addAttribute("error", "아이디 / 비밀번호를 입력해주세요!");
	        return view;
	    }
		
		try {
			user = userService.getUserByUserId(newUser.getUserId());
			
			if(user != null) {
				model.addAttribute("error", "존재하는 아이디입니다!");
		        return view;
			} else {
				result = userService.joinUser(newUser);
				if(result) {
					view = "redirect:/login";
				}
			}
		} catch (Exception e) {
	        model.addAttribute("error", "사용자 등록 중 오류가 발생했습니다.");
	        return view;
		}
		return view;	
	}
	// 회원정보 상세
	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public String userDetail( Model model, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		User user = userService.getUserByUserId(userId);
		model.addAttribute("user", user);
		
		return "UserDetail";
	}
	
	// 회원정보 수정으로 이동
	@RequestMapping(value = "/user", method = RequestMethod.POST)
	public String updateUserForm( Model model, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		User user = userService.getUserByUserId(userId);
		model.addAttribute("user", user);
//		System.out.println(user);
//		if(user.getGrade() == "관리자") {
//			return "updateUserForAdmin";
//		}
		
		return "updateUser";
	}
	
	// 회원정보 수정(회원용)
	@RequestMapping(value = "/modify/user", method = RequestMethod.POST)
	public String updateUser(HttpSession session, @ModelAttribute User newUser) {
		String view = "error";
		String userId = (String) session.getAttribute("userId");
		User user = userService.getUserByUserId(userId);
		boolean result = false;
		System.out.println(newUser + "회원용");
		
		try {
			user = userService.getUserByUserId(userId);
			
			user.setPassword(newUser.getPassword());
			user.setUserName(newUser.getUserName());
			
			result = userService.updateUserByUserId(user);
			
			if(result) {
				view = "redirect:/user";
				return view;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return view;
		}
		return view;
	}
	
	// 회원정보 수정 (관리자용)
	@RequestMapping(value = "/userInfo/{userId}", method = RequestMethod.POST)
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
	
	

