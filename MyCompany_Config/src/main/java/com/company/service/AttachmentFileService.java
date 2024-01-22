package com.company.service;

import java.io.File;
import java.sql.SQLException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.company.dto.AttachmentFile;
import com.company.mapper.AttachmentFileMapper;

@Service
public class AttachmentFileService {
	
	@Autowired
	AttachmentFileMapper attachmentFileMapper;
	
	// 객체
	public AttachmentFile getAttachmentFileByFileNo(long fileNo) throws SQLException, Exception { 
		AttachmentFile attachmentFile = null;
		
		
		attachmentFile = attachmentFileMapper.getAttachmentFileByFileNo(fileNo);
		return attachmentFile;
	}
	
	// insert - 
	public boolean insertAttachmentFile(MultipartFile file, int deptno) throws SQLException, Exception {
		
		
		
		
		boolean result = false;

		if(file == null) {
			throw new Exception("파일 전달 오류 발생");
		} 
		
		String filePath = "C:\\muti\\00.spring";
		String attachmentOriginalFileName = file.getOriginalFilename();
		UUID uuid = UUID.randomUUID();
		String attachmentFileName = uuid.toString() + "_" + attachmentOriginalFileName;
		Long attachmentFileSize = file.getSize();
		
		AttachmentFile attachmentFile = AttachmentFile.builder()
													.attachmentOriginalFileName(attachmentOriginalFileName)
													.attachmentFileName(attachmentFileName)
													.attachmentFileSize(attachmentFileSize)
													.filePath(filePath)
													.deptno(deptno)
													.build();
													
		int res = attachmentFileMapper.insertAttachmentFile(attachmentFile);

		if(res != 0) {
			file.transferTo(new File(filePath + "\\" + attachmentFileName));
			result = true;
		}
		
		return result;
	}
	
	
	// 부서번호로 파일 출력
	public AttachmentFile getAttachmentFileByDeptno(int deptno) throws SQLException {
		AttachmentFile attachmentFile = null;
		
		attachmentFile = attachmentFileMapper.getAttachmentFileByDeptno(deptno);
		
		return attachmentFile;
	}

	// 파일 번호로 파일 삭제
	@Transactional
	public boolean deleteFileByFileNo(long fileNo) throws SQLException, Exception {
		
		boolean result = false;
		
		AttachmentFile file = getAttachmentFileByFileNo(fileNo);
		
		// 로컬 서버 파일 삭제
		File serverFile = new File(file.getFilePath() + "\\" + file.getAttachmentFileName());
		boolean serverDeleteResult = serverFile.delete();
		
		// db 삭제
		int res = attachmentFileMapper.deleteFileByFileNo(fileNo);
		
		if(serverDeleteResult && res != 0) {
			result = true;
		}
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	

}