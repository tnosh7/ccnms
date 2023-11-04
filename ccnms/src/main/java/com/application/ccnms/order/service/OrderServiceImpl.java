package com.application.ccnms.order.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.ccnms.order.dao.OrderDAO;
import com.application.ccnms.order.dto.CartDTO;
import com.application.ccnms.order.dto.KeepDTO;
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
	public boolean checkDuplicatedCart(CartDTO cartDTO) throws Exception {
		if (orderDAO.selectOneDuplicatedCart(cartDTO) == null) return false;
		else return true;
	}

	@Override
	public void addMyCart(CartDTO cartDTO) throws Exception {
		orderDAO.insertMyCart(cartDTO);
	}
	@Override
	public int getMyCartCnt(String userId) throws Exception {
		return orderDAO.selectOneMyCartCnt();
	}
	
	@Override
	public boolean checkDuplicatedKeep(KeepDTO keepDTO) throws Exception {
		if (orderDAO.selectOneDuplicatedKeep(keepDTO) == null) return false;
		else return true;
	}
	
	@Override
	public void addMyKeep(KeepDTO keepDTO) throws Exception {
		orderDAO.insertMyKeep(keepDTO);
	}
	@Override
	public int getMyKeepCnt(String userId) throws Exception {
		return orderDAO.selectOneMyKeepCnt();
	}

	@Override
	public UserDTO getUserDTO(String userId) throws Exception {
		return orderDAO.selectOneUser(userId);
	}

	@Override
	public List<Map<String,Object>> getCartList(String userId) throws Exception {
		return orderDAO.selectListCartList(userId);
	}

	@Override
	public void modifyCartQty(Map<String, Object> updateMap) throws Exception {
		orderDAO.updateCartQty(updateMap);
	}

	@Override
	public void removeCart(int[] deleteCartCdList) throws Exception {
		orderDAO.deleteCart(deleteCartCdList);
	}
	

	
}
