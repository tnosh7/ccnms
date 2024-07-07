package com.application.ccnms.admin.digging.service;

import java.util.List;
import java.util.Map;

import com.application.ccnms.digging.dto.DiggingDTO;
import com.application.ccnms.digging.dto.MainTitleDTO;
import com.application.ccnms.digging.dto.SubTitleDTO;

public interface AdminDiggingService {
	public List<MainTitleDTO> getMainTitle()throws Exception;
	public List<SubTitleDTO> getSubTitle()throws Exception;
	public void addDigging(DiggingDTO diggingDTO) throws Exception;
	public List<DiggingDTO> getDiggingList()throws Exception;
	public void removeDiggingList (int[] removeDiggingIdList) throws Exception;
	public List<DiggingDTO> getSearchDiggingList(Map<String,Object> searchMap) throws Exception;
	public List<SubTitleDTO> getSubTitle(int mainId)throws Exception;
	
}
