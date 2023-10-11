package com.application.ccnms.common.service;

import java.util.List;
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
	public List<DiggingDTO> getDiggingList() throws Exception {
		return commonDAO.selectListDiggingList() ;
	}
	@Override
	public List<DiggingDTO> getDiggingList(String sort) throws Exception {
		return commonDAO.selectListDiggingList(sort) ;
	}
	@Override
	public int getThumbsUpCnt() throws Exception {
		return commonDAO.selectOneThumbsUpCnt(); 
	}

	@Override
	public List<UserDTO> getUserInfo(String writer) throws Exception {
		return commonDAO.selectOneUserInfo(writer);
	}
	@Override
	public int getNewDiggingCnt() throws Exception {
		return commonDAO.selectOneNewDiggingCnt();
	}

	@Override
	public int getAllDiggingCnt() throws Exception {
		return commonDAO.selectOneAllDiggingCnt();
	}

	@Override
	public int getReplyCnt(long diggingId) throws Exception {
		return commonDAO.selectOneReplyCnt(diggingId);
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
