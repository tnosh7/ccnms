package com.application.ccnms.order.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public UserDTO getUserDTO(String userId) throws Exception {
		return orderDAO.selectOneUser(userId);
	}

	@Override
	public List<ShopDTO> getProductListByCart(int[] productCdsList) throws Exception {
		return orderDAO.selectListCartProductList(productCdsList);
	}

	@Override
	public void addOrder(OrderDTO orderDTO, int point) throws Exception {
		// TODO Auto-generated method stub
	}
	

	
}
