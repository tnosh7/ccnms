package com.application.ccnms.order.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.application.ccnms.myshop.dto.CartDTO;
import com.application.ccnms.myshop.dto.KeepDTO;
import com.application.ccnms.order.dao.OrderDAO;
import com.application.ccnms.order.dto.OrderDTO;
import com.application.ccnms.shop.dto.ShopDTO;
import com.application.ccnms.user.dto.UserDTO;

@Service
public class OrderServiceImpl implements OrderService {
	
	
	private OrderDAO orderDAO;
	
	@Autowired
	public OrderServiceImpl(OrderDAO orderDAO) {
		this.orderDAO = orderDAO;
	}

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
	
	@Transactional
	@Override
	public void addCartOrder(Map<String, Object> orderListMap) throws Exception {
		List<OrderDTO> orderList = new ArrayList<>();
        List<Integer> productCdList = parseStringToIntList((String) orderListMap.get("productCdList"));
        List<Integer> cartQtyList = parseStringToIntList((String) orderListMap.get("cartQtyList"));
        List<Integer> cartCdList = parseStringToIntList((String) orderListMap.get("cartCdList"));
        List<Integer> paymentAmtList = parseStringToIntList((String) orderListMap.get("paymentAmtList"));
        List<String> deliveryMethodList = parseStringToStringList((String) orderListMap.get("deliveryMethodList"));

        for (int i = 0; i < productCdList.size(); i++) {
            OrderDTO orderDTO = new OrderDTO();
            orderDTO.setAccount((String) orderListMap.get("account"));
            orderDTO.setAccountCompanyNm((String) orderListMap.get("accountCompanyNm"));
            orderDTO.setCardCompanyNm((String) orderListMap.get("cardCompanyNm"));
            orderDTO.setCardPayMonth((String) orderListMap.get("cardPayMonth"));
            orderDTO.setDeliveryMessage((String) orderListMap.get("deliveryMessage"));
            orderDTO.setDeliveryMethod(deliveryMethodList.get(i));
            orderDTO.setGiftWrapping((String) orderListMap.get("package"));
            orderDTO.setJibunAddress((String) orderListMap.get("jibunAddress"));
            orderDTO.setRoadAddress((String) orderListMap.get("roadAddress"));
            orderDTO.setNamujiAddress((String) orderListMap.get("namujiAddress"));
            orderDTO.setZipcode((String) orderListMap.get("zipcode"));
            orderDTO.setOrderCd(cartCdList.get(i));
            orderDTO.setOrderQty(cartQtyList.get(i));
            orderDTO.setOrdererHp((String) orderListMap.get("ordererHp"));
            orderDTO.setOrdererNm((String) orderListMap.get("ordererNm"));
            orderDTO.setPaymentAmt(paymentAmtList.get(i));
            orderDTO.setPayMethod((String) orderListMap.get("payMethod"));
            orderDTO.setPayOrdererHp((String) orderListMap.get("payOrdererHp"));
            orderDTO.setProductCd(productCdList.get(i));
            orderDTO.setReceiverHp((String) orderListMap.get("receiverHp"));
            orderDTO.setReceiverNm((String) orderListMap.get("receiverNm"));
            orderDTO.setUserId((String) orderListMap.get("userId"));
            orderList.add(orderDTO);
        }

        List<Map<String, Integer>> productMapList = new ArrayList<>();
        for (int i = 0; i < productCdList.size(); i++) {
            Map<String, Integer> productMap = new HashMap<>();
            productMap.put("productCd", productCdList.get(i));
            productMap.put("orderQty", cartQtyList.get(i));
            productMapList.add(productMap);
        }

        orderDAO.updateStockCnt(productMapList);
        orderDAO.insertOrderByCart(orderList);
        orderDAO.deleteCartByOrder(cartCdList.stream().mapToInt(i -> i).toArray());
    }

    private List<Integer> parseStringToIntList(String input) {
        List<Integer> resultList = new ArrayList<>();
        for (String str : input.split(",")) {
            resultList.add(Integer.parseInt(str));
        }
        return resultList;
    }

    private List<String> parseStringToStringList(String input) {
        List<String> resultList = new ArrayList<>();
        for (String str : input.split(",")) {
            resultList.add(str);
        }
        return resultList;
    }

	
}
