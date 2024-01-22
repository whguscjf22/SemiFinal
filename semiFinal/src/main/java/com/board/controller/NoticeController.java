package com.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.board.dto.Dept;
import com.board.service.NoticeService;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService service;
	
	
	@RequestMapping(value = "/dept/{deptno}", method = RequestMethod.GET)
	public String testNotice(@PathVariable int deptno) {
		
		System.out.println(deptno);
		Dept dept = service.testNotice(deptno);
		System.out.println(dept);
		
		return "home";
	}



}