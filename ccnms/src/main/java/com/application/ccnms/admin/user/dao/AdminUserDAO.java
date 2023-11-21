package com.application.ccnms.admin.user.dao;

import java.util.List;
import java.util.Map;

import com.application.ccnms.admin.dto.AdminDTO;
import com.application.ccnms.user.dto.UserDTO;

public interface AdminUserDAO {
	public List<UserDTO> selectListUser()throws Exception;
	public List<UserDTO> selectListSearchUser(Map<String,Object> searchMap) throws Exception;
	public List<AdminDTO> selectListAdmin() throws Exception;
	public void deleteUserList(String[] delUserIdList)throws Exception;

}
