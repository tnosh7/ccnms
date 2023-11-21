package com.application.ccnms.admin.user.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.ccnms.admin.dto.AdminDTO;
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
	
	@Override
	public List<UserDTO> getSearchUserList(Map<String, Object> searchMap) throws Exception {
		return adminUserDAO.selectListSearchUser(searchMap);
	}
	
	@Override
	public List<AdminDTO> getAdminList() throws Exception {
		return adminUserDAO.selectListAdmin();
	}

	@Override
	public void deleteUserList(String[] delUserIdList) throws Exception {
		adminUserDAO.deleteUserList(delUserIdList);
	}

}
