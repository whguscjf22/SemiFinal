package com.company.mapper;

import java.sql.SQLException;

import org.apache.ibatis.annotations.Mapper;

import com.company.dto.AttachmentFile;

@Mapper
public interface AttachmentFileMapper {

	int insertAttachmentFile(AttachmentFile attachmentFile) throws SQLException;

	AttachmentFile getAttachmentFileByDeptno(int deptno) throws SQLException;

	AttachmentFile getAttachmentFileByFileNo(long fileNo) throws SQLException;

	int deleteFileByFileNo(long fileNo) throws SQLException;



}
