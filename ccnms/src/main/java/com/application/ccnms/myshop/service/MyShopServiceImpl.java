package com.application.ccnms.myshop.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.application.ccnms.myshop.dao.MyShopDAO;
import com.application.ccnms.myshop.dto.CartDTO;
import com.application.ccnms.myshop.dto.KeepDTO;
import com.application.ccnms.shop.dto.ShopDTO;

@Service
public class MyShopServiceImpl implements MyShopService {

	private MyShopDAO myShopDAO;
	
	@Autowired
	public MyShopServiceImpl(MyShopDAO myShopDAO) {
		this.myShopDAO = myShopDAO;
	}
	@Override
	public ShopDTO getShopDTO(long productCd) throws Exception {
		return myShopDAO.selectOneShopDTO(productCd);
	}
	@Override
	public boolean checkDuplicatedCart(CartDTO cartDTO) throws Exception {
		if ( myShopDAO.selectOneDuplicatedCart(cartDTO) == null ) {
			return false;
		}
		else {
			return true;
		}
	}
	
	@Transactional
	@Override
	public void addMyCart(CartDTO cartDTO) throws Exception {
		myShopDAO.insertMyCart(cartDTO);
	}
	@Override
	public List<Map<String, Object>> getCartList(String userId) throws Exception {
		return myShopDAO.selectListCartList(userId);
	}
	@Override
	public void removeCart(int[] removeCartCdList) throws Exception {
		myShopDAO.deleteCart(removeCartCdList);
	}
	@Override
	public void modifyCartProductQty(Map<String, Object> updateMap) throws Exception {
		myShopDAO.updateCartProductQty(updateMap);
	}
	@Override
	public boolean checkDuplicatedKeep(KeepDTO keepDTO) throws Exception {
		if (myShopDAO.selectOneDuplicatedKeep(keepDTO) == null) return false;
		else return true;
	}
	@Transactional
	@Override	
	public void addMyKeep(KeepDTO keepDTO) throws Exception {
		myShopDAO.insertMyKeep(keepDTO);
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

	@Override
	public List<ShopDTO> getUserSaleList(String userId) throws Exception {
		return myShopDAO.selectListUserSaleList(userId);
	}

	@Override
	public void removeMySaleList(int[] removeMySale) throws Exception {
		myShopDAO.deleteMySale(removeMySale);
	}

}
