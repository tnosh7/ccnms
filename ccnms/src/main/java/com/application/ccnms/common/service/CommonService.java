package com.application.ccnms.common.service;

import java.util.List;
import java.util.Map;

import com.application.ccnms.digging.dto.DiggingDTO;

public interface CommonService {
	
	public List<DiggingDTO> getDiggingList(Map<String,Object> searchMap)throws Exception;
	public List<DiggingDTO> getHeadList() throws Exception;
	public int upThumbsUp(long diggingId)throws Exception;
	public int getAllDiggingCnt(String search) throws Exception;

}
