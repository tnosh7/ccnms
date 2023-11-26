package com.application.ccnms.admin.digging.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.application.ccnms.admin.digging.dao.AdminDiggingDAO;
import com.application.ccnms.digging.dto.DiggingDTO;

@Service
public class AdminDiggingServiceImpl implements AdminDiggingService {
	@Autowired
	private AdminDiggingDAO adminDiggingDAO;

	@Transactional
	@Override
	public void addDigging(DiggingDTO diggingDTO) throws Exception {
		adminDiggingDAO.insertDigging(diggingDTO);
	}
	
	@Override
	public List<DiggingDTO> getDiggingList() throws Exception {
		return adminDiggingDAO.selectListDiggingList();
	}

	@Override
	public void removeDiggingList(int[] removeDiggingIdList) throws Exception {
		adminDiggingDAO.selectListdeleteDigging(removeDiggingIdList);
	}

	@Override
	public List<DiggingDTO> getSearchDiggingList(Map<String, Object> searchMap) throws Exception {
		return adminDiggingDAO.selectListSearchDigging(searchMap);
	}

	
}
