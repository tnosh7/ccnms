package com.application.ccnms.common.service;

import java.util.List;

import com.application.ccnms.digging.dto.DiggingDTO;

public interface CommonService {
	
	public List<DiggingDTO> getDiggingList()throws Exception;
	public List<DiggingDTO> getThumbsUpList()throws Exception;
	public List<DiggingDTO> getRecentList()throws Exception;
	
	public int upThumbsUp(long diggingId)throws Exception;;
	public int getNewDiggingCnt() throws Exception;
	public int getAllDiggingCnt() throws Exception;
	public int getReplyCnt() throws Exception;
	public int getThumbsUpCnt() throws Exception;

}
