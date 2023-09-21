package com.application.ccnms.admin.dao;

import com.application.ccnms.admin.dto.AdminDTO;

public interface AdminDAO {
	public AdminDTO selectOneLoginAdmin(AdminDTO adminDTO);
}
