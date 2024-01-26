package com.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.board.dto.Comment;

@Mapper
public interface CommentMapper {

	public List<Comment> getCommentListByBoardId(Long boardId);

	public int deleteComment(Long commentId);

	public int insertComment(Comment newComment);

	public int deleteCommentByBoardId(Long boardId);
	
}
