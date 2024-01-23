package com.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.dto.User;
import com.board.mapper.BoardMapper;

@Service
public class BoardService {

	@Autowired
	private BoardMapper mapper;

	public User testNotice() {
		
		return mapper.testNotice();

	}	
}
