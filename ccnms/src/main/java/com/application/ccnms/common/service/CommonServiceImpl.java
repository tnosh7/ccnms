package com.application.ccnms.common.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.ccnms.common.dao.CommonDAO;
import com.application.ccnms.digging.dto.DiggingDTO;
import com.application.ccnms.user.dto.UserDTO;

@Service
public class CommonServiceImpl implements CommonService {
	@Autowired
	private CommonDAO commonDAO;
	
	@Override
	public List<Map<String,Object>> getDiggingList() throws Exception {
		return commonDAO.selectListDiggingList() ;
	}
	@Override
	public List<Map<String,Object>>  getDiggingList(String sort) throws Exception {
		return commonDAO.selectListDiggingList(sort) ;
	}

	@Override
	public int getAllDiggingCnt() throws Exception {
		return commonDAO.selectOneAllDiggingCnt();
	}


	@Override
	public int upThumbsUp(long diggingId) throws Exception {
		return commonDAO.updateThumbsUp(diggingId);
	}
	@Override
	public List<DiggingDTO> getHeadList() throws Exception {
		return commonDAO.selectListHeadList();
	}

	
}
