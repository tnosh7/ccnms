package com.application.ccnms.common.dao;

import java.util.List;
import java.util.Map;

import com.application.ccnms.digging.dto.DiggingDTO;
import com.application.ccnms.user.dto.UserDTO;

public interface CommonDAO {
	public List<Map<String,Object>> selectListDiggingList() throws Exception ;
	public List<Map<String,Object>> selectListDiggingList(String sort) throws Exception ;
	public List<DiggingDTO> selectListHeadList()throws Exception ;
	public int updateThumbsUp(long diggingId)throws Exception ;
	public int selectOneAllDiggingCnt() throws Exception ;
}
