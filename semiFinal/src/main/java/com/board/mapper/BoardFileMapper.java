package com.board.mapper;

import java.sql.SQLException;

import com.board.dto.BoardFile;

public interface BoardFileMapper {

	int insertBoardFile(BoardFile boardFile) throws SQLException;

	BoardFile getBoardFileByFileId(long fileId) throws SQLException;

	int deleteFileByFileId(long fileId) throws SQLException;



}
