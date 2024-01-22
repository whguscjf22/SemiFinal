package com.company.controller;

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
import com.company.dto.AttachmentFile;
import com.company.service.AttachmentFileService;

@Controller
public class AttachmentFileController {

	@Autowired
	private AttachmentFileService fileService;
	
	@GetMapping(value = "/download/file/{fileNo}")
	public ResponseEntity<Resource> downloadFile(@PathVariable long fileNo) {
		
		AttachmentFile attachmentFile = null;
		Resource resource = null;
		try {
			attachmentFile = fileService.getAttachmentFileByFileNo(fileNo);
			
			Path path = Paths.get(attachmentFile.getFilePath() + "\\" + attachmentFile.getAttachmentFileName());
			resource = new InputStreamResource(Files.newInputStream(path));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		headers.setContentDisposition(ContentDisposition
											.builder("attachment")
											.filename(attachmentFile.getAttachmentOriginalFileName())
											.build());
		
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}
	
	@ResponseBody
	@DeleteMapping(value = "/file/{fileNo}")
	public String deleteFileByFileNo(@PathVariable long fileNo) {
		
		// db, 로컬 서버 삭제 => true : return "성공" / "실패"
		boolean result = false;
		try {
			result = fileService.deleteFileByFileNo(fileNo);
			
			if(result) {
				return "성공";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "실패";
		
		
//		v.1
//		AttachmentFile file = null;
//		boolean result = false;
//		String msg = "실패";
//		try {
//			file = fileService.getAttachmentFileByFileNo(fileNo);
//			
//			if(file != null) {
//				result = fileService.deleteFileByFileNo(file);
//				if(result) {
//					msg = "성공";
//				}
//			}
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		return msg;
	}
		//	부서삭제시 >> 파일도 삭제할것인가
		//	파일 업데이트는 어떻게??
	
}
