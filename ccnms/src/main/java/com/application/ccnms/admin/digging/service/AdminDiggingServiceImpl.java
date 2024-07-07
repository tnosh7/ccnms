package com.application.ccnms.admin.digging.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.application.ccnms.admin.digging.dao.AdminDiggingDAO;
import com.application.ccnms.digging.dto.DiggingDTO;
import com.application.ccnms.digging.dto.MainTitleDTO;
import com.application.ccnms.digging.dto.SubTitleDTO;

@Service
public class AdminDiggingServiceImpl implements AdminDiggingService {
	
	private AdminDiggingDAO adminDiggingDAO;
	
	
	
	@Autowired
	public AdminDiggingServiceImpl(AdminDiggingDAO adminDiggingDAO) {
		this.adminDiggingDAO = adminDiggingDAO;
	}

	@Override
	public List<MainTitleDTO> getMainTitle() throws Exception {
		return adminDiggingDAO.selectListMainTitle();
	}
	
	@Override
	public List<SubTitleDTO> getSubTitle() throws Exception {
		return adminDiggingDAO.selectListSubTitle();
	}
	
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

	@Override
	public List<SubTitleDTO> getSubTitle(int mainId) throws Exception {
		return adminDiggingDAO.selectListSubTitle(mainId);
	}

	

	
	
}
