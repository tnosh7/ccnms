package com.application.ccnms.admin.digging.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.ccnms.admin.digging.dao.AdminDiggingDAO;
import com.application.ccnms.digging.dto.DiggingDTO;

@Service
public class AdminDiggingServiceImpl implements AdminDiggingService {
	@Autowired
	private AdminDiggingDAO adminDiggingDAO;

	@Override
	public void addDigging(DiggingDTO diggingDTO) throws Exception {
		adminDiggingDAO.insertDigging(diggingDTO);
	}
}
