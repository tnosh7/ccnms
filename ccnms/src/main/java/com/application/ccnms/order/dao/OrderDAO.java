package com.application.ccnms.order.dao;

import com.application.ccnms.order.dto.CartDTO;
import com.application.ccnms.shop.dto.ShopDTO;
import com.application.ccnms.user.dto.UserDTO;

public interface OrderDAO {
	public ShopDTO selectOneShopDTO(long productCd)throws Exception;
	public CartDTO selectOneDuplicatedKeep(CartDTO cartDTO) throws Exception;
	public void insertMyKeep(CartDTO cartDTO)throws Exception;
	public UserDTO selectOneUser(String userId)throws Exception;
	public int selectOneMyCartCnt()throws Exception;
}
