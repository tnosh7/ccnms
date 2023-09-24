package com.application.ccnms.myPage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.ccnms.myPage.dao.MyPageDAO;
import com.application.ccnms.user.dto.UserDTO;

@Service

public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	private MyPageDAO myPageDAO;

	@Override
	public void addProfile(UserDTO userDTO) throws Exception {
		myPageDAO.insertProfile(userDTO);
	}

	@Override
	public UserDTO getUserDetail(String userId) throws Exception {
		return myPageDAO.selectOneUserDetail(userId);
	}

}
