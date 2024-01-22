package com.company.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.dto.Dept;
import com.company.mapper.DeptMapper;

@Service
public class DeptService {
	
	@Autowired
	DeptMapper mapper;
	
	// List
	public List<Dept> getAllDeptList() throws SQLException {
		
		return mapper.getAllDeptList();
	}

	// 객체
	public Dept getDeptByDeptno(int deptno) throws Exception { 
		return mapper.getDeptByDeptno(deptno); 
	}
	
	// insert - Dept
	public boolean insertDept(Dept Dept) throws SQLException, Exception {
		boolean result = false;
		int res = mapper.insertDept(Dept);
		
		if(res != 0) {
			result = true;
		} else {
			new Exception("부서 생성 실패");
		}
		return result;
	}
	
	// update-dept
	public boolean updateDnameAndLoc(Dept dept) throws SQLException, Exception {
		boolean result = false;
		int res = mapper.updateDnameAndLoc(dept);
		
		if(res != 0) {
			result = true;
		} else {
			new Exception("부서 수정 실패");
		}
		
		return result;
	}
	
	// delete - dept
	public boolean deleteDeptByDeptno(int deptno) throws SQLException, Exception {
		boolean result = false;
		int res = mapper.deleteDeptByDeptno(deptno);
		
		if(res != 0) {
			result = true;
		} else {
			new Exception("부서 삭제 실패");
		}
		return result;
	}

	
}