package com.application.ccnms.order.dao;

import java.util.List;
import java.util.Map;

import com.application.ccnms.order.dto.CartDTO;
import com.application.ccnms.order.dto.KeepDTO;
import com.application.ccnms.shop.dto.ShopDTO;
import com.application.ccnms.user.dto.UserDTO;

public interface OrderDAO {
	public ShopDTO selectOneShopDTO(long productCd)throws Exception;
	public CartDTO selectOneDuplicatedCart(CartDTO cartDTO) throws Exception;
	public void insertMyCart(CartDTO cartDTO)throws Exception;
	public int selectOneMyCartCnt()throws Exception;
	
	public KeepDTO selectOneDuplicatedKeep(KeepDTO keepDTO) throws Exception;
	public void insertMyKeep(KeepDTO keepDTO)throws Exception;
	public int selectOneMyKeepCnt()throws Exception;

	public UserDTO selectOneUser(String userId)throws Exception;
	
	public List<Map<String,Object>> selectListCartList (String userId) throws Exception;
	public void updateCartQty (Map<String,Object> updataMap) throws Exception;
	public void deleteCart (int[] deleteCartCdList) throws Exception;
}
