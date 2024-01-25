package com.board.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.board.dto.Comment;
import com.board.dto.PageRequestDTO;
import com.board.service.CommentService;
@Controller
public class CommentController {

	@Autowired
	private CommentService commentService;
	
	@PostMapping("/deleteComment")
    public ResponseEntity<String> deleteComment(@RequestBody Map<String, Long> requestBody) {
        Long commentId = requestBody.get("commentId");
        boolean result = false;
        
        result = commentService.deleteComment(commentId);
        if (result) {
            return ResponseEntity.ok("댓글이 성공적으로 삭제되었습니다.");
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("댓글 삭제에 실패했습니다.");
        }
    }
	
	@RequestMapping(value = "/comment", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> insertComment(@ModelAttribute Comment newComment, PageRequestDTO pageRequest) {
        System.out.println(newComment);
        System.out.println(pageRequest.getPageNum());
        boolean result = false;
        result = commentService.insertComment(newComment);

        if (result) {
        	System.out.println(result);
            return ResponseEntity.ok("댓글 추가 성공");
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("댓글 삭제 실패");
        }
    }
	
	
	
}
