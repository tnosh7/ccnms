package com.application.ccnms.common.service;

import java.util.List;
import java.util.Map;

import com.application.ccnms.digging.dto.DiggingDTO;

public interface CommonService {
	
	public List<Map<String,Object>> getDiggingList()throws Exception;
	public List<Map<String,Object>> getDiggingList(String sort)throws Exception;
	public List<DiggingDTO> getHeadList() throws Exception;
	public int upThumbsUp(long diggingId)throws Exception;
	public int getAllDiggingCnt() throws Exception;

}
