package com.application.ccnms.digging.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.ccnms.digging.dao.DiggingDAO;
import com.application.ccnms.digging.dto.DiggingDTO;

@Service
public class DiggingServiceImpl implements DiggingService {
	
	@Autowired
	private DiggingDAO diggingDAO;

	@Override
	public void addDigging(DiggingDTO diggingDTO) throws Exception {
		diggingDAO.insertDigging(diggingDTO);
	}

	@Override
	public List<DiggingDTO> getDiggingList() throws Exception {
		return diggingDAO.selectListDiggingList();
	}

	@Override
	public DiggingDTO getDiggingDetail(long diggingId) throws Exception {
		return diggingDAO.selectDiggingDetail(diggingId);
	} 
}
