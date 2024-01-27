package com.board.mapper;

import java.sql.SQLException;
import java.util.List;

import com.board.dto.Board;
import com.board.dto.BoardFile;

public interface BoardFileMapper {

	int insertBoardFile(BoardFile boardFile) throws SQLException;

	BoardFile getBoardFileByFileId(long fileId) throws SQLException;

	BoardFile getBoardFileByBoardId(long boardId) throws SQLException;

	int deleteFileByFileId(long fileId) throws SQLException;

	public List<BoardFile> getBoardFileList() throws SQLException;

	public int updateFileDeletedDateByBoardId(long boardId) throws SQLException;




}
