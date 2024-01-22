package com.board.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.board.dto.Dept;

@Mapper
public interface NoticeMapper {

	public Dept testNotice(int deptno);


}
