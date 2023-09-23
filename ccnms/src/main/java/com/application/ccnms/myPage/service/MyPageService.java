package com.application.ccnms.myPage.service;

import com.application.ccnms.user.dto.UserDTO;

public interface MyPageService {
	
	public void addProfile(UserDTO userDTO) throws Exception;
	public UserDTO getUserDetail(String userId) throws Exception;
	public String checkAuthenticationUser(userId) throws Exception; 
}
