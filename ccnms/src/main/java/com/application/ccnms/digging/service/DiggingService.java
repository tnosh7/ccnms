package com.application.ccnms.digging.service;

import java.util.List;

import com.application.ccnms.digging.dto.DiggingDTO;

public interface DiggingService {
	public List<DiggingDTO> getDiggingList() throws Exception;
	public void addDigging(DiggingDTO diggingDTO) throws Exception;
	
}
