package com.board.schedulde;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.board.dto.BoardFile;
import com.board.service.BoardFileService;

@EnableScheduling
@Component
public class Schedulde {
	@Autowired
	private BoardFileService boardFileService;

	
	// 실제 파일 시간비교해서 삭제
//	@Scheduled(cron = "0/5 * * * * *") // 0 0 10 ? * * 매일 10시 작동
//	public void deleteFileySchedulde() throws Exception {
//		boolean result = false;
//		List<BoardFile> fileList = boardFileService.getBoardFileDeletedList();
//		
//		Timestamp deleteDate = null; // fileList.get(7).getDeletedDate();
//		Timestamp currentTime= new Timestamp(System.currentTimeMillis());
//		
//		if(fileList != null) {
//			for (int i = 0; i < fileList.size(); i++) {
//				deleteDate = fileList.get(i).getDeletedDate();
//				long timeDifferenceInMillis = currentTime.getTime() - deleteDate.getTime();
//				long resultTime = timeDifferenceInMillis / (1000 * 60); // 밀리초를 분으로 변환
//				System.out.println(resultTime);
//				// 삭제한지 300분이 넘은것 삭제
//				if(resultTime > 90) {
//					result = boardFileService.deleteFileByFileId(fileList.get(i).getFileId());
//					if(result) {
//						System.out.println("test : " + result);
//					}
//				}
//			}
//			
//		}
//		
//        
//        }
	        
}
