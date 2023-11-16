package com.application.ccnms.admin.shop.dao;

import java.util.List;
import java.util.Map;

import com.application.ccnms.shop.dto.ShopDTO;


public interface AdminShopDAO {
	public List<ShopDTO> selectListShop()throws Exception;
	public List<Map<String,Object>> selectListOrder()throws Exception;
	public Map<String,Object> selectOneOrderDetail(Map<String, Object> adminOrderDetailMap) throws Exception ;
}
