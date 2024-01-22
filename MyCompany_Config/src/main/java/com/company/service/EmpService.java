package com.company.service;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.dto.Emp;
import com.company.mapper.EmpMapper;

@Service
public class EmpService {
	
		@Autowired
		EmpMapper mapper;

		public Emp getEmpByEmpnoAndEname(int empno, String ename) throws SQLException {
			Emp emp = null;
			
			emp = mapper.getEmpByEmpnoAndEname(empno, ename);
			
			return emp;
		}

		
		
}
