package com.application.ccnms.admin.digging.service;

import java.util.List;
import java.util.Map;

import com.application.ccnms.digging.dto.DiggingDTO;

public interface AdminDiggingService {
	public void addDigging(DiggingDTO diggingDTO) throws Exception;
	public List<DiggingDTO> getDiggingList()throws Exception;
	public void removeDiggingList (int[] removeDiggingIdList) throws Exception;
	public List<DiggingDTO> getSearchDiggingList(Map<String,Object> searchMap) throws Exception;
}
