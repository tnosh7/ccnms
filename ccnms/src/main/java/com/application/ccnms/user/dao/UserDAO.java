package com.application.ccnms.user.dao;

import com.application.ccnms.user.dto.UserDTO;

public interface UserDAO {
	public String selectOneDuplicateId(String userId);
}
