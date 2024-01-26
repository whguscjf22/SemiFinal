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
public class Comment {
	private Long commentId;
	private String commentContent;
	private String userId;
	private Timestamp date;
	private Long boardId;
	
	@Builder
	public Comment(Long commentId, String commentContent, String userId, Timestamp date, Long boardId) {
		super();
		this.commentId = commentId;
		this.commentContent = commentContent;
		this.userId = userId;
		this.date = date;
		this.boardId = boardId;
	}
	
	

}
