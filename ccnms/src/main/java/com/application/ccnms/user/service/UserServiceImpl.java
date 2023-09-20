package com.application.ccnms.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.application.ccnms.user.dao.UserDAO;
import com.application.ccnms.user.dto.UserDTO;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Override
	public void addUser(UserDTO userDTO) {
		userDTO.setPasswd(bCryptPasswordEncoder.encode(userDTO.getPasswd()));
		userDAO.insertUser(userDTO);
	}

	
	
}
