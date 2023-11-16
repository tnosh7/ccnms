package com.application.ccnms.admin.shop.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.ccnms.admin.shop.dao.AdminShopDAO;
import com.application.ccnms.shop.dto.ShopDTO;

@Service

public class AdminShopServiceImpl implements AdminShopService {
	
	@Autowired
	private AdminShopDAO adminShopDAO;


	@Override
	public List<ShopDTO> getShopList() throws Exception {
		return adminShopDAO.selectListShop();
	}
	@Override
	public List<Map<String,Object>> getOrderList() throws Exception {
		return adminShopDAO.selectListOrder();
	}
	@Override
	public Map<String,Object> getOrderDetail(Map<String, Object> adminOrderDetailMap) throws Exception {
		return adminShopDAO.selectOneOrderDetail(adminOrderDetailMap);
	}
}
