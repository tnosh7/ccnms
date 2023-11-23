package com.application.ccnms.user.service;

import com.application.ccnms.user.dto.UserDTO;

public interface UserService {
	public boolean addUser(UserDTO userDTO)  throws Exception;
	public UserDTO loginUser (UserDTO userDTO) throws Exception;
	public String checkDuplicateUserId(String userId)throws Exception;
	public void getEmailCheck(String email, String userId)throws Exception;
	public int getMyOrderCnt(String userId) throws Exception;
	public int getMyCartCnt(String userId) throws Exception;
	public boolean getEmailIdentify(String userId) throws Exception;
	public boolean emailAuthentication(UserDTO userDTO) throws Exception;
}
