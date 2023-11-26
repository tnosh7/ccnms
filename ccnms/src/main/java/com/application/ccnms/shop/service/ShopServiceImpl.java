package com.application.ccnms.shop.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.ccnms.qna.dto.QnaDTO;
import com.application.ccnms.shop.dao.ShopDAO;
import com.application.ccnms.shop.dto.ShopDTO;

@Service
public class ShopServiceImpl implements ShopService {
	@Autowired
	private ShopDAO shopDAO;

	@Override
	public void addProduct(ShopDTO shopDTO) throws Exception {
		shopDAO.insertProduct(shopDTO);
	}

	@Override
	public List<ShopDTO> getProductList() throws Exception {
		return shopDAO.selectListProductList() ;
	}
	
	@Override
	public List<ShopDTO> sortList(String sort) throws Exception {
		return shopDAO.selectListSortList(sort);
	}

	@Override
	public ShopDTO getProductDetail(long productCd) throws Exception {
		shopDAO.updateReadCnt(productCd);
		return shopDAO.selectOneProductDetail(productCd);
	}

	@Override
	public List<ShopDTO> bestSortList(String bestSort) throws Exception {
		return shopDAO.selectListbestSort(bestSort);
	}

	@Override
	public List<QnaDTO> getQnaList(long productCd) throws Exception {
		return shopDAO.selectListQnaList(productCd);
	}


}
