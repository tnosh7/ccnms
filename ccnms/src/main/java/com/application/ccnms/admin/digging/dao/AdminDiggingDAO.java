package com.application.ccnms.admin.digging.dao;

import java.util.List;
import java.util.Map;

import com.application.ccnms.digging.dto.DiggingDTO;

public interface AdminDiggingDAO {
	public void insertDigging(DiggingDTO diggingDTO) throws Exception ;
	public List<DiggingDTO> selectListDiggingList()throws Exception ;
	public void selectListdeleteDigging(int[] removeDiggingIdList)throws Exception;
	public List<DiggingDTO> selectListSearchDigging(Map<String,Object> searchMap) throws Exception;
}
