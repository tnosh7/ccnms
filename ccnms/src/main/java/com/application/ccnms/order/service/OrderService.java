package com.application.ccnms.order.service;

import java.util.List;
import java.util.Map;

import com.application.ccnms.myShop.dto.CartDTO;
import com.application.ccnms.myShop.dto.KeepDTO;
import com.application.ccnms.order.dto.OrderDTO;
import com.application.ccnms.shop.dto.ShopDTO;
import com.application.ccnms.user.dto.UserDTO;

public interface OrderService {
	
	public ShopDTO getShopDTO(long productCd) throws Exception;
	public UserDTO getUserDTO(String userId) throws Exception;
	public void addOrder(OrderDTO orderDTO, int point) throws Exception;
	public List<ShopDTO> getProductListByCart(int[] productCdsList)throws Exception;


}
