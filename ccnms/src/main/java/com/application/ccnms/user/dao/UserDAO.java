package com.application.ccnms.user.dao;

import com.application.ccnms.user.dto.UserDTO;

public interface UserDAO {
	
	public void insertUser(UserDTO userDTO) throws Exception;
	public UserDTO selectOneLoginUser(UserDTO userDTO)throws Exception;
	public String selectOneDuplicateUserId(UserDTO userId) throws Exception;
}
