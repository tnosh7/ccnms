package com.application.ccnms.shop.service;

import org.springframework.stereotype.Service;

import com.application.ccnms.shop.dao.ShopDAO;
import com.application.ccnms.shop.dto.ShopDTO;

@Service
public class ShopServiceImpl implements ShopService {

	private ShopDAO shopDAO;

	@Override
	public void addProduct(ShopDTO shopDTO) throws Exception {
		shopDAO.insertProduct(shopDTO);
	}
}
