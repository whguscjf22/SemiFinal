package com.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.dto.Dept;
import com.board.mapper.NoticeMapper;

@Service
public class NoticeService {

	@Autowired
	private NoticeMapper mapper;

	public Dept testNotice(int deptno) {
		System.out.println("service작동");
		return mapper.testNotice(deptno);
	}

	
}
