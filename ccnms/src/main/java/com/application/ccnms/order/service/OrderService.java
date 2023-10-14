package com.application.ccnms.order.service;

import com.application.ccnms.order.dto.CartDTO;
import com.application.ccnms.shop.dto.ShopDTO;

public interface OrderService {
	public ShopDTO getShopDTO(long productId)throws Exception;
	public boolean checkDuplicatedKeep(CartDTO cartDTO)throws Exception;
	public void addMyKeep(CartDTO cartDTO)throws Exception;
	public int getMyCartCnt(String userId)throws Exception;
}
