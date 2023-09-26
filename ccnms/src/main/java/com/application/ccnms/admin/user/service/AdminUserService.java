package com.application.ccnms.admin.user.service;

import java.util.List;
import java.util.Map;

import com.application.ccnms.admin.dto.AdminDTO;
import com.application.ccnms.user.dto.UserDTO;

public interface AdminUserService {
	public List<UserDTO> getUserList() throws Exception;
	public List<AdminDTO> getAdminList() throws Exception;
	public List<AdminDTO> getSearchAdmin(Map<String,String> searchMap)throws Exception;
}
