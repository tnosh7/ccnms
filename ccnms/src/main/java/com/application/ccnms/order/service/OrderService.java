package com.application.ccnms.order.service;

import java.util.List;
import java.util.Map;

import com.application.ccnms.order.dto.CartDTO;
import com.application.ccnms.order.dto.KeepDTO;
import com.application.ccnms.order.dto.OrderDTO;
import com.application.ccnms.shop.dto.ShopDTO;
import com.application.ccnms.user.dto.UserDTO;

public interface OrderService {
	public ShopDTO getShopDTO(long productCd)throws Exception;
	public boolean checkDuplicatedCart(CartDTO cartDTO)throws Exception;
	public void addMyCart(CartDTO cartDTO)throws Exception;
	public int getMyCartCnt(String userId)throws Exception;
	
	public boolean checkDuplicatedKeep(KeepDTO keepDTO)throws Exception;
	public void addMyKeep(KeepDTO keepDTO)throws Exception;
	public int getMyKeepCnt(String userId)throws Exception;
	
	public UserDTO getUserDTO(String userId) throws Exception;

	public List<Map<String,Object>> getCartList (String userId) throws Exception;
	public void modifyCartQty(Map<String,Object> updateMap) throws Exception;
	public void removeCart(int[] deleteCartCdList) throws Exception;
	
	public void addOrder(OrderDTO orderDTO, int point) throws Exception;
	public List<ShopDTO> getProductListByCart(int[] productCdsList)throws Exception;
}
