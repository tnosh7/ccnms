package com.application.ccnms.order.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.ccnms.order.dao.OrderDAO;
import com.application.ccnms.order.dto.CartDTO;
import com.application.ccnms.shop.dto.ShopDTO;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderDAO orderDAO;
	
	@Override
	public ShopDTO getShopDTO(long productId) throws Exception {
		return orderDAO.selectOneShopDTO(productId);
	}
	
	@Override
	public boolean checkDuplicatedKeep(CartDTO cartDTO) throws Exception {
		if (orderDAO.selectOneDuplicatedKeep(cartDTO) == null) return false;
		else return true;
	}

	@Override
	public void addMyKeep(CartDTO cartDTO) throws Exception {
		orderDAO.insertMyKeep(cartDTO);
	}

	@Override
	public int getMyCartCnt(String userId) throws Exception {
		return orderDAO.selectOneMyCartCnt();
	}

	
}
