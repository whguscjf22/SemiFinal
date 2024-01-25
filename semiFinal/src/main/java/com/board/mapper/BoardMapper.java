package com.board.mapper;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.board.dto.Board;
import com.board.dto.PageRequestDTO;

@Mapper
public interface BoardMapper {
	// 더미 생성용
	public void insertNotice(Board board);


	// paging
	public List<Board> getNoticeBySearchWithPage(PageRequestDTO pageRequest);

	// paging
	public int getTotalCount(PageRequestDTO pageRequest);


	//BoardList
	public List<Board> getAllBoardList();

	//객체
	public Board getBoardByBoardId(Long boardId);
	
	//객체
	public Board getBoardByBoardName(String boardName)throws SQLException;

	// insert - Board
	public int insertBoard(Board board)throws SQLException;

	// update - Board
	public int updateBoardBYBoardId(Board board)throws SQLException;

	// delete - Board
	public int deleteBoardByBoardId(Long boardId)throws SQLException;

	// update count
	public int updateBoardCount(Long boardId);


}
