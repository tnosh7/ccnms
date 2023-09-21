package com.application.ccnms.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.application.ccnms.admin.dao.AdminDAO;
import com.application.ccnms.admin.dto.AdminDTO;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO adminDAO;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@Override
	public AdminDTO loginAdmin(AdminDTO adminDTO) {
		AdminDTO dbAdminDTO = adminDAO.selectOneLoginAdmin(adminDTO);
		if(bCryptPasswordEncoder.matches(adminDTO.getPasswd(), dbAdminDTO.getPasswd())) {
			if (dbAdminDTO.getPasswd() != null)
			return dbAdminDTO;
		}
		return null;
	}

	@Override
	public void addRegisterAdmin(AdminDTO adminDTO) {
		adminDTO.setPasswd(bCryptPasswordEncoder.encode(adminDTO.getPasswd()));;
		adminDAO.insertRegisterAdmin(adminDTO);
	} 
}
