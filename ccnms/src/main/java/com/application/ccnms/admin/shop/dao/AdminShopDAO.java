package com.application.ccnms.admin.shop.dao;

import java.util.List;
import java.util.Map;

import com.application.ccnms.shop.dto.ShopDTO;


public interface AdminShopDAO {
	public List<ShopDTO> selectListShop() throws Exception;
	public List<ShopDTO> selectListSearchShop(Map<String, Object> searchMap)throws Exception; 
	public void insertAdminProduct(ShopDTO shopDTO) throws Exception;
	public List<Map<String,Object>> selectListOrder() throws Exception;
	public List<Map<String,Object>> selectListSearchOrder(Map<String,Object> searchMap) throws Exception;
	public Map<String,Object> selectOneOrderDetail(Map<String, Object> adminOrderDetailMap) throws Exception ;
	public void deleteProductList(int[] removeProduct) throws Exception;
	public void deleteOrderList(int[] removeOrder) throws Exception;

}
