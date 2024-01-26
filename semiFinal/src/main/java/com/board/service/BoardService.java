package com.board.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.board.dto.Board;
import com.board.dto.PageRequestDTO;
import com.board.mapper.BoardMapper;

@Service
public class BoardService {

	@Autowired
	private BoardMapper boardMapper;
	// 더미데이터 생성용
	public void insertNotice(Board board) {

		boardMapper.insertNotice(board);
	}
	// paging
	public List<Board> getNoticeBySearchWithPage(PageRequestDTO pageRequest) {
		
		return boardMapper.getNoticeBySearchWithPage(pageRequest);
	}

	// paging
	public int getTotalCount(PageRequestDTO pageRequest) {

		return boardMapper.getTotalCount(pageRequest);
	}

	
	//AllBoardList
	public List<Board> getAllBoardList() {
		
		return boardMapper.getAllBoardList();
	}

	public Board getBoardByBoardId(Long boardId) {
		
		return boardMapper.getBoardByBoardId(boardId);
	}
	
	public List<Board> getBoardByBoardName(String boardName) throws Exception{
		
		return boardMapper.getBoardByBoardName(boardName);
	}

	// insert - board
	@Transactional
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
	
	// update count
	public int updateBoardCount(Long boardId) {
		int result = 0;
		
		result = boardMapper.updateBoardCount(boardId);
		
		return result;
	}


}
