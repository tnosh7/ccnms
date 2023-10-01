package com.application.ccnms.digging.service;

import com.application.ccnms.digging.dto.DiggingDTO;

public interface DiggingService {
	public void getDiggingList() throws Exception;
	public void addDigging(DiggingDTO diggingDTO) throws Exception;
	
}
