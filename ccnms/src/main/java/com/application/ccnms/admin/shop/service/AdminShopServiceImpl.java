package com.application.ccnms.admin.shop.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.application.ccnms.admin.shop.dao.AdminShopDAO;
import com.application.ccnms.shop.dto.ShopDTO;

@Service

public class AdminShopServiceImpl implements AdminShopService {
	
	
	private AdminShopDAO adminShopDAO;

	@Autowired
	public AdminShopServiceImpl(AdminShopDAO adminShopDAO) {
		this.adminShopDAO = adminShopDAO;
	}
	@Override
	public List<ShopDTO> getShopList() throws Exception {
		return adminShopDAO.selectListShop();
	}
	@Override
	public List<ShopDTO> getSearchShopList(Map<String, Object> searchMap) throws Exception {
		return adminShopDAO.selectListSearchShop(searchMap);
	}
	
	@Transactional
	@Override
	public void addAdminProduct(ShopDTO shopDTO) throws Exception {
		adminShopDAO.insertAdminProduct(shopDTO);
	}
	@Override
	public List<Map<String,Object>> getOrderList() throws Exception {
		return adminShopDAO.selectListOrder();
	}
	@Override
	public List<Map<String, Object>> getSearchOrderList(Map<String, Object> searchMap) throws Exception {
		return adminShopDAO.selectListSearchOrder(searchMap);
	}
	@Override
	public Map<String,Object> getOrderDetail(Map<String, Object> adminOrderDetailMap) throws Exception {
		return adminShopDAO.selectOneOrderDetail(adminOrderDetailMap);
	}
	@Override
	public void removeProductList(int[] removeProduct) throws Exception {
		adminShopDAO.deleteProductList(removeProduct);
	}
	@Override
	public void removeOrderList(int[] removeOrder) throws Exception {
		adminShopDAO.deleteOrderList(removeOrder);
	}
}
