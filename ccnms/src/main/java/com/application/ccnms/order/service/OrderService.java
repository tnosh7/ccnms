package com.application.ccnms.order.service;

import com.application.ccnms.order.dto.CartDTO;
import com.application.ccnms.shop.dto.ShopDTO;
import com.application.ccnms.user.dto.UserDTO;

public interface OrderService {
	public ShopDTO getShopDTO(long productCd)throws Exception;
	public boolean checkDuplicatedKeep(CartDTO cartDTO)throws Exception;
	public void addMyKeep(CartDTO cartDTO)throws Exception;
	public UserDTO getUserDTO(String userId) throws Exception;
	public int getMyCartCnt(String userId)throws Exception;
}
