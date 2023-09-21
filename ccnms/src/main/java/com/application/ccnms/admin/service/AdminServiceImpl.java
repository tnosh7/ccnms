package com.application.ccnms.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.ccnms.admin.dao.AdminDAO;
import com.application.ccnms.admin.dto.AdminDTO;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO adminDAO;

	@Override
	public AdminDTO loginAdmin(AdminDTO adminDTO) {
		AdminDTO dbAdminDTO = adminDAO.selectOneLoginAdmin(adminDTO);
		if(dbAdminDTO != null) {
			return dbAdminDTO;
		}
		return null;
	} 
}
