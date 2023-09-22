package com.application.ccnms.user.service;

import com.application.ccnms.user.dto.UserDTO;

public interface UserService {
	public void addUser(UserDTO userDTO)  throws Exception;
	public UserDTO loginUser (UserDTO userDTO) throws Exception;
	public String checkDuplicateUserId(String userId)throws Exception;
}
