package com.board.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.board.dto.User;

@Mapper
public interface UserMapper {
	// getUserByUserIdAndPassword (객체 user 반환)
	public User getUserByUserIdAndPassword(@Param("userId") String userId,@Param("password") String password);

	public User getUserByUserId(String userId);

	public int joinUser(@Param("userId") String userId, @Param("userName") String userName, @Param("password") String password);


}
