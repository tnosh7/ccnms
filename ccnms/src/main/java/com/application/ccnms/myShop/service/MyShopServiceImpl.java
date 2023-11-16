package com.application.ccnms.myShop.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.ccnms.myShop.dao.MyShopDAO;
import com.application.ccnms.myShop.dto.CartDTO;
import com.application.ccnms.myShop.dto.KeepDTO;
import com.application.ccnms.shop.dto.ShopDTO;

@Service
public class MyShopServiceImpl implements MyShopService {

	@Autowired
	private MyShopDAO myShopDAO;

	@Override
	public ShopDTO getShopDTO(long productCd) throws Exception {
		return myShopDAO.selectOneShopDTO(productCd);
	}

	@Override
	public boolean checkDuplicatedCart(CartDTO cartDTO) throws Exception {
		if ( myShopDAO.selectOneDuplicatedCart(cartDTO) == null ) return false;
		else return true;
	}

	@Override
	public void addMyCart(CartDTO cartDTO) throws Exception {
		myShopDAO.insertMyCart(cartDTO);
	}

	@Override
	public int getMyCartCnt(String userId) throws Exception {
		return myShopDAO.selectOneMyCartCnt(userId);
	}

	@Override
	public List<Map<String, Object>> getCartList(String userId) throws Exception {
		return myShopDAO.selectListCartList(userId);
	}

	@Override
	public void modifyCartQty(Map<String, Object> updateMap) throws Exception {
		myShopDAO.updateCartQty(updateMap);
	}

	@Override
	public void removeCart(int[] removeCartCdList) throws Exception {
		myShopDAO.deleteCart(removeCartCdList);
	}

	@Override
	public boolean checkDuplicatedKeep(KeepDTO keepDTO) throws Exception {
		if (myShopDAO.selectOneDuplicatedKeep(keepDTO) == null) return false;
		else return true;
	}

	@Override	
	public void addMyKeep(KeepDTO keepDTO) throws Exception {
		myShopDAO.insertMyKeep(keepDTO);
	}

	@Override
	public int getMyKeepCnt(String userId) throws Exception {
		return myShopDAO.selectOneMyKeepCnt(userId);
	}

	@Override
	public List<Map<String,Object>> getMyKeepList(String userId) throws Exception {
		return myShopDAO.selectListKeepList(userId);
	}

	@Override
	public void removeKeep(int[] removeKeepCdList) throws Exception {
		myShopDAO.deleteKeep(removeKeepCdList);
	}

	@Override
	public List<Map<String, Object>> getOrderList(String userId) throws Exception {
		return myShopDAO.selectListOrderList(userId);
	}

	@Override
	public Map<String, Object> getOrderDetail(Map<String, Object> orderDetailMap) throws Exception {
		return myShopDAO.selectOneOrderDetail(orderDetailMap);
	}

	@Override
	public List<Map<String, Object>> getSaleList(String userId) throws Exception {
		return myShopDAO.selectListSaleList(userId);
	}

	@Override
	public void changeDeliveryStatus(int[] changeDeliveryList) throws Exception {
		myShopDAO.updateDeliveryStatus(changeDeliveryList);
	}
}
