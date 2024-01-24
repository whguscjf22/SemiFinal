package com.board.dto;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
 
@NoArgsConstructor
@Getter
@Setter
@ToString
public class User {
	private String userId;
	private String userName;
	private String password;
	private String grade;
	
	@Builder
	public User(String userId, String userName, String password, String grade) {
		this.userId = userId;
		this.userName = userName;
		this.password = password;
		this.grade = grade;
	}
	
}
