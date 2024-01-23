package com.board.controller;

import java.util.List;
import java.util.stream.IntStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.board.dto.Board;
import com.board.dto.PageRequestDTO;
import com.board.dto.PageResponseDTO;
import com.board.dto.User;
import com.board.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
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
	


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// paging
	// mainTest >> main 으로 변경해야함
	@GetMapping("/mainTest")
	public String searchWithPage(PageRequestDTO pageRequest,
									Model model, String searchKeyword) {
		
		List<Board> boardList = boardService.getNoticeBySearchWithPage(pageRequest);
		int totalCount = boardService.getTotalCount(pageRequest);

		PageResponseDTO pageResponse = new PageResponseDTO().builder()
															.total(totalCount)
															.pageAmount(pageRequest.getAmount())
															.pageRequest(pageRequest)
															.build();
		model.addAttribute("boardList", boardList);
		model.addAttribute("pageInfo", pageResponse);
		
		return "mainTest";
		
	}

}