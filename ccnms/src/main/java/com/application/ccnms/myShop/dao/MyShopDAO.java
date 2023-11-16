package com.application.ccnms.myShop.dao;

import java.util.List;
import java.util.Map;

import com.application.ccnms.myShop.dto.CartDTO;
import com.application.ccnms.myShop.dto.KeepDTO;
import com.application.ccnms.shop.dto.ShopDTO;

public interface MyShopDAO {
	
	public ShopDTO selectOneShopDTO (long productCd) throws Exception ;
	public CartDTO selectOneDuplicatedCart (CartDTO cartDTO) throws Exception; 
	public void insertMyCart (CartDTO cartDTO) throws Exception;
	public int selectOneMyCartCnt (String userId) throws Exception;
	public List<Map<String,Object>> selectListCartList (String userId) throws Exception;
	public void updateCartQty (Map<String, Object> updateMap) throws Exception ;
	public void deleteCart (int[] removeCartCdList) throws Exception;
	
	public KeepDTO selectOneDuplicatedKeep (KeepDTO keepDTO) throws Exception;
	public void insertMyKeep (KeepDTO keepDTO) throws Exception;
	public int selectOneMyKeepCnt (String userId) throws Exception;
	public List<Map<String,Object>> selectListKeepList (String userId) throws Exception;
	public void deleteKeep (int[] removeKeepCdList) throws Exception;
	
	public List<Map<String,Object>> selectListOrderList (String userId) throws Exception;
	public Map<String,Object> selectOneOrderDetail (Map<String, Object> orderDetailMap) throws Exception;

	public List<Map<String,Object>> selectListSaleList(String userId)throws Exception;
	public void updateDeliveryStatus (int[]changeDeliveryList)throws Exception;


}
