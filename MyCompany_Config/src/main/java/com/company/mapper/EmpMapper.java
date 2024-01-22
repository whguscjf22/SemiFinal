package com.company.mapper;

import java.sql.SQLException;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.company.dto.Emp;


@Mapper
public interface EmpMapper {
	
	// 객체 emp
	public Emp getEmpByEmpnoAndEname(@Param("empno") int empno, @Param("ename") String ename) throws SQLException;



}
