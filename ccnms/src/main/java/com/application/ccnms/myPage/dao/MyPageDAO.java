package com.application.ccnms.myPage.dao;

import com.application.ccnms.user.dto.UserDTO;

public interface MyPageDAO {
	public void insertProfile(UserDTO userDTO) throws Exception;
	public UserDTO selectOneUserDetail(String userId) throws Exception;
	public UserDTO selectOneAuthenticationUser(UserDTO userDTO) throws Exception;
}