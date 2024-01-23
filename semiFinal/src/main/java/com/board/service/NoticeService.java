package com.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.dto.User;
import com.board.mapper.NoticeMapper;

@Service
public class NoticeService {

	@Autowired
	private NoticeMapper mapper;

	public User testNotice() {
		
		return mapper.testNotice();

	}	
}
