package com.application.ccnms.common.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.ccnms.common.dao.CommonDAO;

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
}
