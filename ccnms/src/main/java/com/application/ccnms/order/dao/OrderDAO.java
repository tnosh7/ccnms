package com.application.ccnms.order.dao;

import java.util.List;
import java.util.Map;

import com.application.ccnms.myShop.dto.CartDTO;
import com.application.ccnms.myShop.dto.KeepDTO;
import com.application.ccnms.shop.dto.ShopDTO;
import com.application.ccnms.user.dto.UserDTO;

public interface OrderDAO {

	public UserDTO selectOneUser(String userId)throws Exception;
	public List<ShopDTO> selectListCartProductList(int[] productCdsList) throws Exception;
}
