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
	public List<DiggingDTO> getDiggingList(Map<String, Object> searchMap) throws Exception {
		return commonDAO.selectListDiggingList(searchMap) ;
	}

	@Override
	public int getAllDiggingCnt(String search) throws Exception {
		return commonDAO.selectOneAllDiggingCnt(search);
	}
	@Override
	public int upThumbsUp(long diggingId) throws Exception {
		return commonDAO.updateThumbsUp(diggingId);
	}
	@Override
	public List<DiggingDTO> getHeadList() throws Exception {
		return commonDAO.selectListHeadList();
	}

	@Override
	public List<ShopDTO> getRecentShopList() throws Exception {
		return commonDAO.selectListRecentShopList();
	}

	
}
