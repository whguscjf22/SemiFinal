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
public class Board {
	
	private Long boardId;
	private String boardTitle;
	private String boardContent;
	private Timestamp createDate;
	private Timestamp modifiedDate;
	private String userId;
	private Long fileId;
	
	@Builder
	public Board(Long boardId, String boardTitle, String boardContent, Timestamp createDate, Timestamp modifiedDate,
			String userId, Long fileId, String boardName, String count) {
		super();
		this.boardId = boardId;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.createDate = createDate;
		this.modifiedDate = modifiedDate;
		this.userId = userId;
		this.fileId = fileId;
		BoardName = boardName;
		this.count = count;
	}
	private String BoardName;
	private String count;

}
