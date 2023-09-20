package com.application.ccnms.user.dao;

import com.application.ccnms.user.dto.UserDTO;

public interface UserDAO {
	
	public void insertUser(UserDTO userDTO);
	public UserDTO selectOneValidateUser(String userId);
}
