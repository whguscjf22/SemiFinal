package com.company.dto;

import java.util.Date;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Getter
@ToString
public class Emp {
	private int empno;
	private String ename;
	private String job;
	private Integer mgr;
	private Date hiredate;
	private Float sal;
	private Float comm;
	private int deptno;
	
	@Builder
	public Emp(int empno, String ename, String job, Integer mgr, Date hiredate, Float sal, Float comm, int deptno) {
		super();
		this.empno = empno;
		this.ename = ename;
		this.job = job;
		this.mgr = mgr;
		this.hiredate = hiredate;
		this.sal = sal;
		this.comm = comm;
		this.deptno = deptno;
	}
	
	
	
	
}
