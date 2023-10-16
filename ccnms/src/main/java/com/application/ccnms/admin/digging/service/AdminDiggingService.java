package com.application.ccnms.admin.digging.service;

import java.util.List;

import com.application.ccnms.digging.dto.DiggingDTO;

public interface AdminDiggingService {
	public void addDigging(DiggingDTO diggingDTO) throws Exception;
	public List<DiggingDTO> getDiggingList()throws Exception;

}
