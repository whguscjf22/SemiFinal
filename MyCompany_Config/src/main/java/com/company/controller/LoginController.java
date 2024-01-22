package com.company.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.company.dto.Emp;
import com.company.service.EmpService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class LoginController {
	@Autowired
	EmpService service;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginForm() {
		return "login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(int empno, String ename, HttpSession session) throws SQLException {
		String view = "error";
		Emp emp = null;
		
		emp = service.getEmpByEmpnoAndEname(empno, ename);
		
		// 세션 : setAttribute("key", value);
		if(emp != null) {
			session.setAttribute("userName", emp.getEname());
			session.setAttribute("userId", emp.getEmpno());
			view = "redirect:/main";
			return view;
		}
		
		
		return view;
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		
		if(session != null) {
			session.invalidate();
		}
		
		return "redirect:/main";
		
	}
}
