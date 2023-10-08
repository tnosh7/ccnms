package com.application.ccnms.common.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.ccnms.common.dao.CommonDAO;
import com.application.ccnms.digging.dto.DiggingDTO;

@Service
public class CommonServiceImpl implements CommonService {
	@Autowired
	private CommonDAO commonDAO;

	@Override
	public int getNewDiggingCnt() throws Exception {
		return commonDAO.selectOneNewDiggingCnt();
	}

	@Override
	public int getAllDiggingCnt() throws Exception {
		return commonDAO.selectOneAllDiggingCnt();
	}

	@Override
	public int getReplyCnt() throws Exception {
		return commonDAO.selectOneReplyCnt();
	}

	@Override
	public int getThumbsUpCnt() throws Exception {
		return commonDAO.selectOneThumbsUpCnt(); 
	}

	@Override
	public List<DiggingDTO> getDiggingList() throws Exception {
		return commonDAO.selectListDiggingList() ;
	}

	@Override
	public List<DiggingDTO> getThumbsUpList() throws Exception {
		return commonDAO.selectListThumbsUpList() ;
	}

	@Override
	public List<DiggingDTO> getRecentList() throws Exception {
		return commonDAO.selectListRecentList() ;
	}

	@Override
	public int upThumbsUp(long diggingId) throws Exception {
		return commonDAO.updateThumbsUp(diggingId);
	}
}
