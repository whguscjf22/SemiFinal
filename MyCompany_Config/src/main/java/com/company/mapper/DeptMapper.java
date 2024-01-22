package com.company.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.company.dto.Dept;

@Mapper
public interface DeptMapper {
	
	// List
	List<Dept> getAllDeptList() throws SQLException;

	// 객체 - Dept
	public Dept getDeptByDeptno(int deptno) throws SQLException;
	
	// insert - Dept
	public int insertDept(Dept dept) throws SQLException;
	
	// update - Dept
	public int updateDnameAndLoc(Dept dept) throws SQLException; 

	// delete - dept
	public int deleteDeptByDeptno(int deptno) throws SQLException;

	// dynamic - getDynamicDeptno
	public List<Dept> getDynamicDeptno(Map<String, Integer> map1) throws SQLException;

	// dynamic - getDynamicChoose
	public List<Dept> getDynamicChoose(Map<String, String> map2) throws SQLException;

	// dynamic - getDynamicWhereTrim
	public List<Dept> getDynamicWhereTrim(Map<String, String> map3) throws SQLException;

	// dynamic - updateDnameAndLoc
	public int updateDynamicSet(Map<String, Object> map4) throws SQLException;

	// dynamic - getDynamicForeachDeptno
	public List<Dept> getDynamicForeachDeptno(List<Integer> list5);

	// dynamic - insertDynamicForeachDeptList
	public int insertDynamicForeachDeptList(List<Dept> list6);

	
}
