package com.board.controller;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.board.dto.Board;
import com.board.dto.User;
import com.board.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	// /boardList/{boardid}
		@RequestMapping(value = "/board/{boardId}", method = RequestMethod.GET)
		public String getBoardByBoardId(@PathVariable Long boardId, Model model) {
			Board board = null;
			
			System.out.println(boardId);
			
			try {
				board = boardService.getBoardByBoardId(boardId);
				System.out.println(board);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			model.addAttribute("boardId", boardId);
			
			return "BoardDetail";
		}
	
//	// /board/{boardName}
//	@RequestMapping(value = "/board/{boardName}", method = RequestMethod.GET)
//	public String getBoardByBoardName(@PathVariable String boardName, Model model) {
//		Board board = null;
//		
//		System.out.println(boardName);
//		
//		try {
//			board = boardService.getBoardByBoardName(boardName);
//			System.out.println(board);
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		model.addAttribute("boardName", boardName);
//		
//		return "BoardDetail";
//	}
	
	// /board
	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String insertBoardForm() {
		return "registerBoard";
	}
	
	@RequestMapping(value = "/board", method = RequestMethod.POST)
	public String insertBoard(@ModelAttribute Board newBoard, MultipartFile file) {
		
		String view = "error";
		boolean boardResult = false;
	
		try {
			boardResult = boardService.insertBoard(newBoard);

			
			if(boardResult) {
				view = "redirect:/main";
				return view;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return view;
		}
		
		
		return view;
	}

	// /modify/board/{boardId}
	@RequestMapping(value = "/modify/board/{boardId}", method = RequestMethod.GET)
	public String updateBoardForm(@PathVariable Long boardId, Model model) throws Exception {
		Board board = boardService.getBoardByBoardId(boardId);
		
		
		model.addAttribute("board", board);
		
		return "updateBoard";
	}
		
	@RequestMapping(value = "/board/{boardId}", method = RequestMethod.POST)
	public String updateBoard(@PathVariable Long boardId,
								@ModelAttribute Board newBoard, MultipartFile file) {
		//System.out.println("post");

		String view = "error";
		
		// 
		Board board = null;
		boolean result = false;
		try {
			board = boardService.getBoardByBoardId(boardId);
			
			board.setBoardTitle(newBoard.getBoardTitle());
			board.setBoardContent(newBoard.getBoardContent());
			
			result = boardService.updateBoardBYBoardId(board);
			
			if(result) {
				view = "redirect:/board/" + boardId;
				return view;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return view;
		}
		return view;
	}
	
	// 
	@RequestMapping(value = "/board/{boardId}", method = RequestMethod.DELETE)
	public String deleteBoard(@PathVariable Long boardId) throws SQLException, Exception {
		
		String view = "error";
		boolean result = false;
		
		result = boardService.deleteBoardByBoardId(boardId);
		
		if(result) {
			view = "redirect:/main";
			return view;
		}
		return view;
	}	
		
}