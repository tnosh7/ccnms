package com.application.ccnms.order.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.application.ccnms.myShop.dto.CartDTO;
import com.application.ccnms.myShop.dto.KeepDTO;
import com.application.ccnms.order.dao.OrderDAO;
import com.application.ccnms.order.dto.OrderDTO;
import com.application.ccnms.shop.dto.ShopDTO;
import com.application.ccnms.user.dto.UserDTO;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderDAO orderDAO;
	
	@Override
	public ShopDTO getShopDTO(long productCd) throws Exception {
		return orderDAO.selectOneShopDTO(productCd);
	}

	@Override
	public UserDTO getUserDTO(String userId) throws Exception {
		return orderDAO.selectOneUser(userId);
	}

	@Override
	public List<ShopDTO> getProductListByCart(int[] productCdsList) throws Exception {
		return orderDAO.selectListCartProductList(productCdsList);
	}

	@Override
	@Transactional
	public void addOrder(OrderDTO orderDTO, int point) throws Exception {
		Map<String,Object> orderMap = new HashMap<String,Object>();
		orderMap.put("point", point);
		orderMap.put("orderQty", orderDTO.getOrderQty());
		orderMap.put("productCd", orderDTO.getProductCd());
		orderMap.put("userId", orderDTO.getUserId());
			
		orderDAO.updateShopStockCnt(orderMap);
		orderDAO.updateUserPoint(orderMap);
		orderDAO.insertOrder(orderDTO);
	
	}

	
}
