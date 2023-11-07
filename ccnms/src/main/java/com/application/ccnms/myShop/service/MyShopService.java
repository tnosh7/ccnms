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
	public int getMyCartCnt (String userId) throws Exception;
	public List<Map<String,Object>> getCartList (String userId) throws Exception;
	public void modifyCartQty (Map<String, Object> updateMap) throws Exception;
	public void removeCart (int [] removeCartCdList) throws Exception;
	
	public boolean checkDuplicatedKeep (KeepDTO keepDTO) throws Exception;
	public void addMyKeep (KeepDTO keepDTO) throws Exception;
	public int getMyKeepCnt (String userId) throws Exception;
	public List<Map<String,Object>> getMyKeepList (String userId) throws Exception;
	public void removeKeep (int [] removeKeepCdList) throws Exception;





}
