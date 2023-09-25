package com.application.ccnms.admin.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.ccnms.admin.user.dao.AdminUserDAO;
import com.application.ccnms.user.dto.UserDTO;

@Service
public class AdminUserServiceImpl implements AdminUserService {

	@Autowired
	private AdminUserDAO adminUserDAO;

	@Override
	public List<UserDTO> getUserList() throws Exception {
		return adminUserDAO.selectListUser();
	}
}
