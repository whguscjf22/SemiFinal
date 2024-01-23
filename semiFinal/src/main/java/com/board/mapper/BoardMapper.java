package com.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.board.dto.Board;
import com.board.dto.PageRequestDTO;
import com.board.dto.User;

@Mapper
public interface BoardMapper {

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 더미 생성용
	public void insertNotice(Board board);


	// paging
	public List<Board> getNoticeBySearchWithPage(PageRequestDTO pageRequest);

	// paging
	public int getTotalCount(PageRequestDTO pageRequest);





}
