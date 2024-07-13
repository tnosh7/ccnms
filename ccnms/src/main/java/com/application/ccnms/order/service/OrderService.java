package com.application.ccnms.order.service;

import java.util.List;
import java.util.Map;

import com.application.ccnms.myshop.dto.CartDTO;
import com.application.ccnms.myshop.dto.KeepDTO;
import com.application.ccnms.order.dto.OrderDTO;
import com.application.ccnms.shop.dto.ShopDTO;
import com.application.ccnms.user.dto.UserDTO;

public interface OrderService {
	
	public ShopDTO getShopDTO(long productCd) throws Exception;
	public UserDTO getUserDTO(String userId) throws Exception;
	public void addOrder(OrderDTO orderDTO) throws Exception;
	public List<ShopDTO> getProductListByCart(int[] productCdsList)throws Exception;
	public void addCartOrder(Map<String,Object> orderListMap) throws Exception;
}
