package com.application.ccnms.myShop.service;

import java.util.List;
import java.util.Map;

import com.application.ccnms.myShop.dto.CartDTO;
import com.application.ccnms.myShop.dto.KeepDTO;
import com.application.ccnms.shop.dto.ShopDTO;

public interface MyShopService {

	public ShopDTO getShopDTO (long productCd) throws Exception;
	public boolean checkDuplicatedCart (CartDTO cartDTO) throws Exception;
	public void addMyCart (CartDTO cartDTO) throws Exception;
	public List<Map<String,Object>> getCartList (String userId) throws Exception;
	public void removeCart (int [] removeCartCdList) throws Exception;
	public void modifyCartProductQty(Map<String,Object>updateMap)throws Exception;
	
	public boolean checkDuplicatedKeep (KeepDTO keepDTO) throws Exception;
	public void addMyKeep (KeepDTO keepDTO) throws Exception;
	public List<Map<String,Object>> getMyKeepList (String userId) throws Exception;
	public void removeKeep (int [] removeKeepCdList) throws Exception;
	
	public List<Map<String,Object>> getOrderList(String userId) throws Exception;
	public Map<String,Object> getOrderDetail(Map<String,Object>orderDetailMap) throws Exception;
	
	public List<Map<String,Object>>getSaleList (String userId)throws Exception;
	public void changeDeliveryStatus(int[] changeDeliveryList)throws Exception;
	public List<ShopDTO> getUserSaleList (String userId)throws Exception;
	public void removeMySaleList(int[] removeMySale)throws Exception;
}