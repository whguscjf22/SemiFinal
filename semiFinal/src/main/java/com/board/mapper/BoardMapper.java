package com.board.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.board.dto.User;

@Mapper
public interface BoardMapper {

	public User testNotice();



}
