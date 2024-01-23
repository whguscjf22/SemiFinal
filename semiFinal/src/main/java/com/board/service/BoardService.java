package com.board.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.dto.Board;
import com.board.dto.User;
import com.board.mapper.BoardMapper;

@Service
public class BoardService {

	@Autowired
	BoardMapper boardMapper;

	
	//AllBoardList
	public List<Board> getAllBoardList() {
		
		return boardMapper.getAllBoardList();
	}

	public Board getBoardByBoardId(Long boardId) {
		
		return boardMapper.getBoardByBoardId(boardId);
	}
	
	public Board getBoardByBoardName(String boardName) throws Exception{
		
		return boardMapper.getBoardByBoardName(boardName);
	}

	// insert - board
	public boolean insertBoard(Board board) throws SQLException, Exception {
		boolean result = false;
		
		int res = boardMapper.insertBoard(board);
		
		if(res != 0) {
			result = true;
		}else {
			new Exception("게시판 생성 실패");
		}
		
		return result;
	}

	// update - board
	public boolean updateBoardBYBoardId(Board board) throws SQLException, Exception{
		boolean result = false;
		
		int res = boardMapper.updateBoardBYBoardId(board);
		
		if(res != 0) {
			result = true;
		}else {
			new Exception("게시판 수정 실패");
		}
		
		return result;
	}

	// delete - board
	public boolean deleteBoardByBoardId(Long boardId) throws SQLException, Exception{
		
		boolean result = false;
		
		int res = boardMapper.deleteBoardByBoardId(boardId);
		
		if(res != 0) {
			result = true;
			return result;
		}
		
		return result;
	}



}
