package com.application.ccnms.admin.user.dao;

import java.util.List;
import java.util.Map;

import com.application.ccnms.admin.dto.AdminDTO;
import com.application.ccnms.user.dto.UserDTO;

public interface AdminUserDAO {
	public List<UserDTO> selectListUser() throws Exception;
	public List<AdminDTO> selectListAdmin() throws Exception;
	public List<AdminDTO> selectListSearchAdmin(Map<String,String> searchMap) throws Exception;
	public void deleteUserList(String[] delUserIdList)throws Exception;

}
