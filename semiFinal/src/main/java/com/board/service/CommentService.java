package com.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.dto.Comment;
import com.board.mapper.CommentMapper;

@Service
public class CommentService {
	
	@Autowired
	private CommentMapper commentMapper;

	public List<Comment> getCommentListByBoardId(Long boardId) {

		return commentMapper.getCommentListByBoardId(boardId);
	}

	public boolean deleteComment(Long commentId) {
		int res = 0;
		boolean result = false;
		
		res = commentMapper.deleteComment(commentId);
		if(res != 0) {
			result = true;
		}
		return result;
	}

	public boolean insertComment(Comment newComment) {	
		int res = 0;
		boolean result = false;
		
		res = commentMapper.insertComment(newComment);
		if(res != 0) {
			result = true;
		}
		return result;
	}

	public boolean deleteCommentByBoardId(Long boardId) {

		int res = 0;
		boolean result = false;
		
		res = commentMapper.deleteCommentByBoardId(boardId);
		if(res != 0) {
			result = true;
		}
		return result;
	}
	
	

	
}
