package com.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.board.dto.Board;
import com.board.dto.PageRequestDTO;
import com.board.dto.User;

@Mapper
public interface BoardMapper {

	public List<Board> getTotalCount();

	public void insertNotice(Board board);

	public List<Board> getBoardListBySearchKeyword(String searchKeyword);

	public List<Board> getNoticeBySearchWithPage(PageRequestDTO pageRequest);

	public int getTotalCount(PageRequestDTO pageRequest);

	public List<Board> getBoardList();




}
