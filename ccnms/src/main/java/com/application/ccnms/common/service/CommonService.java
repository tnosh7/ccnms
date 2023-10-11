package com.application.ccnms.common.service;

import java.util.List;

import com.application.ccnms.digging.dto.DiggingDTO;
import com.application.ccnms.user.dto.UserDTO;

public interface CommonService {
	
	public List<DiggingDTO> getDiggingList()throws Exception;
	public List<DiggingDTO> getDiggingList(String sort)throws Exception;
	public List<DiggingDTO> getHeadList() throws Exception;
	public int upThumbsUp(long diggingId)throws Exception;
	public List<UserDTO> getUserInfo(String writer)throws Exception;
	public int getNewDiggingCnt() throws Exception;
	public int getAllDiggingCnt() throws Exception;
	public int getReplyCnt(long diggingId) throws Exception;
	public int getThumbsUpCnt() throws Exception;

}
