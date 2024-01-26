package com.board.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.board.dto.Board;
import com.board.dto.BoardFile;
import com.board.dto.Comment;
import com.board.dto.PageRequestDTO;
import com.board.dto.PageResponseDTO;
import com.board.service.BoardFileService;
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
	
	@Autowired
	private BoardFileService boardFileService;
	
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
				//System.out.println(file);
				model.addAttribute("pageInfo", pageRequest);
				if(board != null) {
					view = "BoardDetail";
					
					List<Comment> commentList = commentService.getCommentListByBoardId(boardId);
					BoardFile file = boardFileService.getBoardFileByBoardId(boardId);
					
					model.addAttribute("file", file);
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
//		return "main";
//	}
	
	// /board
	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String insertBoardForm(@RequestParam(value="boardName",required=false) String boardName, Model model) {
		String view = "registerBoard";
		
		List<Board> boardList = null;
		if(boardName != null) {
			// 카테고리에 맞는 board 찾아와 List<Board>를  main.jsp 로 출력
			try {
				boardList = boardService.getBoardByBoardName(boardName);
				model.addAttribute("boardList", boardList);
				view = "main";
			} catch (Exception e) {
				e.printStackTrace();
				view = "";
			}
			
		}
		
		return view;
	}
	

	@RequestMapping(value = "/board", method = RequestMethod.POST)
	public String insertBoard(Board newBoard, MultipartFile file) {
		String view = "error";
		boolean fileResult = false;
		boolean boardResult = false;
		System.out.println(newBoard);
		System.out.println(file.getOriginalFilename());
		
		try {
			boardResult = boardService.insertBoard(newBoard);
			System.out.println(newBoard.getBoardId());
			if(boardResult) {
				if(file != null) {
					System.out.println(boardResult);
//					BoardFile newFile = new BoardFile();
//					newBoard.setBoardId(1L);
//					System.out.println(boardService.getBoardByBoardId(newBoard.getBoardId()));
					fileResult = boardFileService.insertBoardFile(file, newBoard.getBoardId());
				view = "redirect:/main";
				return view;
				}
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
		BoardFile file = boardFileService.getBoardFileByBoardId(boardId);
		
		model.addAttribute("file", file);
		model.addAttribute("board", board);
		model.addAttribute("pageInfo", pageRequest);
		
		return "updateBoard";
	}
		
	@RequestMapping(value = "/board/{boardId}", method = RequestMethod.PUT)
	public String updateBoard(@PathVariable Long boardId,
								@ModelAttribute Board newBoard, MultipartFile file, PageRequestDTO pageRequest) {
		String view = "error";
		System.out.println("파일 확인중" + file);
		// 
		Board board = null;
		boolean result = false;
		try {
			board = boardService.getBoardByBoardId(boardId);
			
			board.setBoardTitle(newBoard.getBoardTitle());
			board.setBoardContent(newBoard.getBoardContent());
			
			result = boardService.updateBoardBYBoardId(board);
			System.out.println(result);
			
			
			if(file != null) {
				boardFileService.insertBoardFile(file, boardId);
			}
			
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
		boolean comResult = commentService.deleteCommentByBoardId(boardId);
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