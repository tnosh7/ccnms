package com.application.ccnms.order.dao;

import java.util.List;
import java.util.Map;

import com.application.ccnms.myShop.dto.CartDTO;
import com.application.ccnms.myShop.dto.KeepDTO;
import com.application.ccnms.order.dto.OrderDTO;
import com.application.ccnms.shop.dto.ShopDTO;
import com.application.ccnms.user.dto.UserDTO;

public interface OrderDAO {
	public ShopDTO selectOneShopDTO(long productCd) throws Exception;
	public UserDTO selectOneUser(String userId) throws Exception;
	public List<ShopDTO> selectListCartProductList(int[] productCdsList) throws Exception;
	public void updateShopStockCnt (Map<String,Object> orderMap) throws Exception;
	public void insertOrder (OrderDTO orderDTO) throws Exception;
	public void updateStockCnt(List<Map<String,Integer>> productMapList)throws Exception;
	public void insertOrderByCart(List<OrderDTO> orderList)throws Exception;
	public void deleteCartByOrder(int[] cartCdList)throws Exception;
}
