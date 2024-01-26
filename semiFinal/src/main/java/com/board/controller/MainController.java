package com.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.board.dto.Board;
import com.board.service.BoardService;

@Controller
public class MainController {
	//
	@Autowired
	private BoardService boardService;
	
//	@RequestMapping(value = "/main", method = RequestMethod.GET)
//	public String main(Model model) {
//		
//		
//		//1) List<Board> getAllBoardList
//		List<Board> boardList = boardService.getAllBoardList();
//		//System.out.println(boardList);
//		
//		model.addAttribute("boardList",boardList);
//		
//		return "main";
//	}
}
