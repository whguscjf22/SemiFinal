package com.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.board.dto.User;
import com.board.service.NoticeService;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService service;
	
	
	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public String testNotice() {
		User user = service.testNotice();
		System.out.println(user);
		
		return "home";
	}



}