package com.application.ccnms.admin.user.service;

import java.util.List;

import com.application.ccnms.user.dto.UserDTO;

public interface AdminUserService {
	public List<UserDTO> getUserList() throws Exception;
}
