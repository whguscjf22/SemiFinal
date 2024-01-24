package com.board.service;

import java.io.File;
import java.sql.SQLException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.board.dto.BoardFile;
import com.board.mapper.BoardFileMapper;

@Service
public class BoardFileService {

	@Autowired
	BoardFileMapper boardFileMapper;
	
	// 객체
	public BoardFile getBoardFileByFileId(long fileId) throws SQLException, Exception{
		BoardFile boardFile = null;
		
		boardFile = boardFileMapper.getBoardFileByFileId(fileId);
		return boardFile;
	}
	
	// insert
	public boolean insertBoardFile(MultipartFile file, long boardId) throws Exception {
		boolean result = false;
		
		if(file == null) {
			throw new Exception("파일 전달 오류 발생");
		}
		
		String filePath = "C:\\muti";
		String fileOriginalName = file.getOriginalFilename();
		UUID uuid = UUID.randomUUID();
		String fileName = uuid.toString() + "_" + fileOriginalName;
		Long fileSize = file.getSize();
		
		BoardFile boardFile = BoardFile.builder()
										.fileOriginalName(fileOriginalName)
										.fileName(fileName)
										.fileSize(fileSize)
										.filePath(filePath)
										.boardId(boardId)
										.build();
						
		int res = boardFileMapper.insertBoardFile(boardFile);
		
		if(res != 0) {
			file.transferTo(new File(filePath + "\\" + fileName));
			result = true;
		}
		
		return result;
	}
	
	
	// 파일 출력
	public BoardFile getBoardFileByBoardId(long boardId) throws SQLException{
		BoardFile boardFile = null;
		
		boardFile = boardFileMapper.getBoardFileByBoardId(boardId);
		
		return boardFile;
	}
	
	// 파일 삭제
	@Transactional
	public boolean deleteFileByFileId(long fileId) throws SQLException, Exception {
		
		boolean result = false;
		
		BoardFile file = getBoardFileByFileId(fileId);
		
		// 로컬 서버 파일 삭제
		File serverFile = new File(file.getFilePath() + "\\" + file.getFileName());
		boolean serverDeleteResult = serverFile.delete();
		
		// db 삭제
		int res = boardFileMapper.deleteFileByFileId(fileId);
		
		if(serverDeleteResult && res != 0) {
			result = true;
		}
		return result;
	}


}
