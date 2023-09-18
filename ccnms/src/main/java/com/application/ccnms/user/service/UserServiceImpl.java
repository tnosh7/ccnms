package com.application.ccnms.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.ccnms.user.dao.UserDAO;
import com.application.ccnms.user.dto.UserDTO;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDAO userDAO;

	@Override
	public String getCheckDuplicateId(String userId) {
		if (userDAO.selectOneDuplicateId(userId) == null) return "duplicate";
		else return "noDuplicate";
	}
	
	
}
