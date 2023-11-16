package com.application.ccnms.admin.shop.service;

import java.util.List;
import java.util.Map;

import com.application.ccnms.shop.dto.ShopDTO;


public interface AdminShopService {

	public List<ShopDTO> getShopList() throws Exception;
	public List<Map<String,Object>> getOrderList() throws Exception;
	public Map<String,Object> getOrderDetail(Map<String,Object> adminOrderDetailMap) throws Exception;

}
