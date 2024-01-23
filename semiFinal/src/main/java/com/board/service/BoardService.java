package com.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.dto.Board;
import com.board.dto.PageRequestDTO;
import com.board.dto.User;
import com.board.mapper.BoardMapper;

@Service
public class BoardService {

	@Autowired
	private BoardMapper boardMapper;

	public void insertNotice(Board board) {

		boardMapper.insertNotice(board);
	}

	public List<Board> getBoardListBySearchKeyword(String searchKeyword) {
		
		List<Board> boardList = boardMapper.getBoardListBySearchKeyword(searchKeyword);
		
		return boardList;
	}

	public List<Board> getNoticeBySearchWithPage(PageRequestDTO pageRequest) {
		
		return boardMapper.getNoticeBySearchWithPage(pageRequest);
	}

	public int getTotalCount(PageRequestDTO pageRequest) {

		return boardMapper.getTotalCount(pageRequest);
	}

	public List<Board> getBoardList() {
		return boardMapper.getBoardList();
	}

}
