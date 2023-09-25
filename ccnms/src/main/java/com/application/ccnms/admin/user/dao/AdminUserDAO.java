package com.application.ccnms.admin.user.dao;

import java.util.List;

import com.application.ccnms.user.dto.UserDTO;

public interface AdminUserDAO {
	public List<UserDTO> selectListUser() throws Exception;
}
