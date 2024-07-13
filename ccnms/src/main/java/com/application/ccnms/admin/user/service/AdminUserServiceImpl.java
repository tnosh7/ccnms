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
	
	private AdminUserDAO adminUserDAO;

	@Autowired
	public AdminUserServiceImpl(AdminUserDAO adminUserDAO) {
		this.adminUserDAO = adminUserDAO;
	}

	@Override
	public List<UserDTO> getUserList() throws Exception {
		return adminUserDAO.selectListUser();
	}
	
	@Override
	public List<UserDTO> getSearchUserList(Map<String, Object> searchMap) throws Exception {
		return adminUserDAO.selectListSearchUser(searchMap);
	}
	
	@Override
	public void deleteUserList(String[] delUserIdList) throws Exception {
		adminUserDAO.deleteUserList(delUserIdList);
	}

	@Override
	public UserDTO getOneUserInfo(String userId) throws Exception {
		return adminUserDAO.selectOneUserInfo(userId);
	}

	@Override
	public void modifyUser(UserDTO userDTO) throws Exception {
		adminUserDAO.updateOneUser(userDTO);
	}

}
