package com.board.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.board.dto.Board;
import com.board.dto.Comment;
import com.board.dto.PageRequestDTO;
import com.board.dto.PageResponseDTO;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.board.service.BoardService;
import com.board.service.CommentService;
import com.board.service.UserService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private UserService userService;
	
	// insert 더미데이터 생성
//	@GetMapping("/board-data")
//	public void insertNotice() {
//		IntStream.rangeClosed(1, 200)
//					.forEach(i ->{
//						Board board = Board.builder()
//											.boardTitle("BoardTilte : " + i)
//											.boardContent("BoardContent : " + i)
//											.boardName("BoardName : " + i)
//											.build();
//						boardService.insertNotice(board);
//					});
//	}
	
	// 조회수 - BoardDetail로 넘어가면 count 1씩 증가
	// /boardList/{boardid}
		@RequestMapping(value = "/board/{boardId}", method = RequestMethod.GET)
		public String getBoardByBoardId(@PathVariable Long boardId, Model model, PageRequestDTO pageRequest) {
			String view = "error";
			Board board = null;
			int countResult = 0;
			
			System.out.println(boardId);
			
			try {
				board = boardService.getBoardByBoardId(boardId);
				model.addAttribute("pageInfo", pageRequest);
				if(board != null) {
					view = "BoardDetail";
					
					List<Comment> commentList = commentService.getCommentListByBoardId(boardId);
					
					model.addAttribute("board", board);
					model.addAttribute("commentList", commentList);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			countResult = boardService.updateBoardCount(boardId);
			model.addAttribute("boardId", boardId);
			
			return view;
		}
		
		// 미현님꺼 참조
		//boardList/{boardid}
//		@RequestMapping(value = "/board/{boardId}", method = RequestMethod.GET)
//		public String getBoardByBoardId(@PathVariable Long boardId, Model model) {
//			Board board = null;
//			
//			System.out.println(boardId);
//			
//			try {
//				board = boardService.getBoardByBoardId(boardId);
//				System.out.println(board);
//				
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//			
//			model.addAttribute("board", board);
//			
//			return "BoardDetail";
//		}
	
	// paging
	@GetMapping("/main")
	public String searchWithPage(PageRequestDTO pageRequest,
									Model model, String searchKeyword, HttpSession session) {
		
		List<Board> boardList = boardService.getNoticeBySearchWithPage(pageRequest);
		int totalCount = boardService.getTotalCount(pageRequest);
		
		// test용 세션
//		session.setAttribute("userId", "q1w2e3r4");
//		System.out.println(session.getAttribute("userId"));
//		session.invalidate();

		PageResponseDTO pageResponse = new PageResponseDTO().builder()
															.total(totalCount)
															.pageAmount(pageRequest.getAmount())
															.pageRequest(pageRequest)
															.build();
		model.addAttribute("boardList", boardList);
		model.addAttribute("pageInfo", pageResponse);
		
		return "main";
		
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
	public String updateBoardForm(@PathVariable Long boardId, Model model, PageRequestDTO pageRequest) throws Exception {
		Board board = boardService.getBoardByBoardId(boardId);
		System.out.println(pageRequest);
		System.out.println("boardUpdate : " + board);
		model.addAttribute("board", board);
		model.addAttribute("pageInfo", pageRequest);
		
		return "updateBoard";
	}
		
	@RequestMapping(value = "/board/{boardId}", method = RequestMethod.POST)
	public String updateBoard(@PathVariable Long boardId,
								@ModelAttribute Board newBoard, MultipartFile file, PageRequestDTO pageRequest) {
		//System.out.println("post");
//		System.out.println(boardId);
//		System.out.println(newBoard);
//		System.out.println(pageRequest);
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
	
	@RequestMapping("/boardtest")
	public String test() {
		
		return "boardtest";
	}
	
		
}