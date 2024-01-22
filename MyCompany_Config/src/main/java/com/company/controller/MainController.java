package com.company.controller;

import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.company.dto.Dept;
import com.company.service.DeptService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	private DeptService service;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Model model) throws SQLException {
		// List<Dept>
		List<Dept> deptList = service.getAllDeptList();
		model.addAttribute("deptList", deptList);
		
		return "main";
	}
	
}
