package com.application.ccnms.common.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.ccnms.common.dao.CommonDAO;
import com.application.ccnms.digging.dto.DiggingDTO;
import com.application.ccnms.shop.dto.ShopDTO;
import com.application.ccnms.user.dto.UserDTO;

@Service
public class CommonServiceImpl implements CommonService {
	
	private CommonDAO commonDAO;
	
	@Autowired
	public CommonServiceImpl(CommonDAO commonDAO) {
		this.commonDAO = commonDAO;
	}
	@Override
	public List<DiggingDTO> getDiggingList(Map<String, Object> sortMap) throws Exception {
		return commonDAO.selectListDiggingList(sortMap) ;
	}
	@Override
	public List<DiggingDTO> getMainTitle() throws Exception {
	
		return commonDAO.selectListMainTitle();
	}

	@Override
	public int getAllDiggingCnt() throws Exception {
		return commonDAO.selectOneAllDiggingCnt();
	}
	@Override
	public void upThumbsUp(long digId) throws Exception {
		commonDAO.updateThumbsUp(digId);
		commonDAO.updateLikePoint(digId);
	}
	
	@Override
	public int countThumbsUp(long digId) throws Exception {
		return commonDAO.selectThumbsUp(digId);
	}
	@Override
	public List<DiggingDTO> getHeadList() throws Exception {
		return commonDAO.selectListHeadList();
	}

	
	@Override
	public List<ShopDTO> getPopulerShopList() throws Exception {
		return commonDAO.selectListPopulerShopList();
	}

	@Override
	public List<DiggingDTO> getDiggingSearch(String search) throws Exception {
		return commonDAO.selectListDiggingSearch(search);
	}

	@Override
	public List<ShopDTO> getShopSearch(String search) throws Exception {
		return commonDAO.selectListShopSearch(search);
	}

	
	

	
}
