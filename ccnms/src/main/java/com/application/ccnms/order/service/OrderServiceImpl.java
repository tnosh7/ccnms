package com.application.ccnms.order.service;

import java.util.ArrayList;
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
	public void addOrder(OrderDTO orderDTO) throws Exception {
		orderDAO.insertOrder(orderDTO);
	
	}

	@Override
	public void addCartOrder(Map<String, Object> orderListMap) throws Exception {
		List<OrderDTO> orderList = new ArrayList<OrderDTO>();
		
		String[] temp1 = ((String) orderListMap.get("productCdList")).split(",");
		int[]productCdList = new int[temp1.length];
		for (int i = 0; i < temp1.length; i++) {
			productCdList[i] = Integer.parseInt(temp1[i]);
		}
		
		String[] temp2 = ((String) orderListMap.get("cartQtyList")).split(",");
		int[]cartQtyList = new int[temp2.length];
		for (int i = 0; i < temp2.length; i++) {
			cartQtyList[i] = Integer.parseInt(temp2[i]);
		}
		
		String[] temp3 = ((String) orderListMap.get("cartCdList")).split(",");
		int[]cartCdList = new int[temp3.length];
		for (int i = 0; i < temp3.length; i++) {
			cartCdList[i] = Integer.parseInt(temp3[i]);
		}
		String[] temp4 = ((String) orderListMap.get("paymentAmtList")).split(",");
		int[]paymentAmtList = new int[temp4.length];
		for (int i = 0; i < temp4.length; i++) {
			paymentAmtList[i] = Integer.parseInt(temp4[i]);
		}
		String[] temp5 = ((String) orderListMap.get("deliveryMethodList")).split(",");
		String[]deliveryMethodList = new String[temp5.length];
		for (int i = 0; i < temp5.length; i++) {
			deliveryMethodList[i] =temp5[i];
		}
		
		for (int i = 0; i < productCdList.length; i++) {
			OrderDTO orderDTO = new OrderDTO();
			orderDTO.setAccount((String) orderListMap.get("account"));
			orderDTO.setAccountCompanyNm((String) orderListMap.get("accountCompanyNm"));
			orderDTO.setCardCompanyNm((String) orderListMap.get("cardCompanyNm"));
			orderDTO.setCardPayMonth((String) orderListMap.get("cardPayMonth"));
			orderDTO.setDeliveryMessage((String) orderListMap.get("deliveryMessage"));
			orderDTO.setDeliveryMethod(deliveryMethodList[i]);
			orderDTO.setGiftWrapping((String) orderListMap.get("package"));
			orderDTO.setJibunAddress((String) orderListMap.get("jibunAddress"));
			orderDTO.setRoadAddress((String) orderListMap.get("roadAddress"));
			orderDTO.setNamujiAddress((String) orderListMap.get("namujiAddress"));
			orderDTO.setZipcode((String) orderListMap.get("zipcode"));
			orderDTO.setOrderCd(cartCdList[i]);
			orderDTO.setOrderQty(cartQtyList[i]);
			orderDTO.setOrdererHp((String) orderListMap.get("ordererHp"));
			orderDTO.setOrdererNm((String) orderListMap.get("ordererNm"));
			orderDTO.setPaymentAmt(paymentAmtList[i]);
			orderDTO.setPayMethod((String) orderListMap.get("payMethod"));
			orderDTO.setPayOrdererHp((String) orderListMap.get("payOrdererHp"));
			orderDTO.setProductCd(productCdList[i]);
			orderDTO.setReceiverHp((String) orderListMap.get("receiverHp"));
			orderDTO.setReceiverNm((String) orderListMap.get("receiverNm"));
			orderDTO.setUserId((String) orderListMap.get("userId"));
			orderList.add(orderDTO);
		}
		List<Map<String,Integer>> productMapList = new ArrayList<Map<String,Integer>>();
		for (int i = 0; i < productCdList.length; i++) {
			Map<String,Integer> productMap = new HashMap<String,Integer>();
			productMap.put("productCd", productCdList[i]);
			productMap.put("orderQty", cartQtyList[i]);
			productMapList.add(productMap);
		
		}
		orderDAO.updateStockCnt(productMapList);
		orderDAO.insertOrderByCart(orderList);
		orderDAO.deleteCartByOrder(cartCdList);
		
	}


	
}
