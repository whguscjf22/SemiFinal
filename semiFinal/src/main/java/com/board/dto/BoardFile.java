package com.board.dto;

import java.sql.Timestamp;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
 
@NoArgsConstructor
@Getter
@Setter
@ToString
public class BoardFile {
	private Long fileId;
	private String fileName;
	private String fileOriginalName;
	private String filePath;
	private Timestamp registeredDate;
	private Long fileSize;
	private Long boardId;
	private Timestamp deleteDate;
	
	@Builder
	public BoardFile(Long fileId, String fileName, String fileOriginalName, String filePath, Timestamp registeredDate,
			Long fileSize, Long boardId, Timestamp deleteDate) {
		super();
		this.fileId = fileId;
		this.fileName = fileName;
		this.fileOriginalName = fileOriginalName;
		this.filePath = filePath;
		this.registeredDate = registeredDate;
		this.fileSize = fileSize;
		this.boardId = boardId;
		this.deleteDate = deleteDate;
	}
	

}
