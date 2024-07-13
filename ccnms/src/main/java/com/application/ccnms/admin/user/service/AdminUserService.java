package com.application.ccnms.admin.user.service;

import java.util.List;
import java.util.Map;

import com.application.ccnms.admin.dto.AdminDTO;
import com.application.ccnms.user.dto.UserDTO;

public interface AdminUserService {
	public List<UserDTO> getUserList()throws Exception;
	public List<UserDTO> getSearchUserList(Map<String,Object> searchMap) throws Exception;
	public void deleteUserList(String[] delUserIdList) throws Exception;
	public UserDTO getOneUserInfo(String userId) throws Exception;
	public void modifyUser(UserDTO userDTO) throws Exception;
	
}
