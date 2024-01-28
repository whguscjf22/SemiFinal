package com.board.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import com.board.dto.BoardFile;
import com.board.service.BoardFileService;

@Controller
public class BoardFileController {

	@Autowired
	private BoardFileService fileService;
	
	// 파일 추가
	@GetMapping(value = "/download/file/{fileId}")
	public ResponseEntity<Resource> downloadFile(@PathVariable long fileId) {
		
		BoardFile boardFile = null;
		Resource resource = null;
		
		System.out.println(fileId);
		
		try {
			boardFile = fileService.getBoardFileByFileId(fileId);
			
			Path path = Paths.get(boardFile.getFilePath() + "\\" + boardFile.getFileName());
			resource = new InputStreamResource(Files.newInputStream(path));
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		headers.setContentDisposition(ContentDisposition
											.builder("board")
											.filename(boardFile.getFileOriginalName())
											.build());
	
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}
	
	// 파일 삭제
	@ResponseBody
	@DeleteMapping(value = "/file/{fileId}")
	public String deleteFileByFileId(@PathVariable long fileId) {
		System.out.println("파일삭제 " + fileId);
		boolean result = false;
		
		
		try {
			result = fileService.deleteFileByFileId(fileId); // 기존 삭제
//			result = fileService.updateFileDeletedDateByBoardId(fileId); // 삭제 유예 > 오류남
			
			if(result) {
				System.out.println(result);
				return "성공";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "실패";
	}
	
	
	
	
	

	
	
	
	
	
}
