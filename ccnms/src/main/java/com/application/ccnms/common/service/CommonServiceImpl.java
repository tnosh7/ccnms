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
	@Autowired
	private CommonDAO commonDAO;
	
	@Override
	public List<DiggingDTO> getDiggingList(Map<String, Object> sortMap) throws Exception {
		return commonDAO.selectListDiggingList(sortMap) ;
	}

	@Override
	public int getAllDiggingCnt() throws Exception {
		return commonDAO.selectOneAllDiggingCnt();
	}
	@Override
	public void upThumbsUp(long diggingId) throws Exception {
		commonDAO.updateThumbsUp(diggingId);
	}
	
	@Override
	public int countThumbsUp(long diggingId) throws Exception {
		return commonDAO.selectThumbsUp(diggingId);
	}
	@Override
	public List<DiggingDTO> getHeadList() throws Exception {
		return commonDAO.selectListHeadList();
	}

	@Override
	public List<ShopDTO> getRecentShopList() throws Exception {
		return commonDAO.selectListRecentShopList();
	}

	@Override
	public List<ShopDTO> getPopulerShopList() throws Exception {
		return commonDAO.selectListPopulerShopList();
	}

	@Override
	public List<ShopDTO> getExchangeShopList() throws Exception {
		return commonDAO.selectListgetExchangeShopList();
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
