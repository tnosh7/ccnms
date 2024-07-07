package com.application.ccnms.shop.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.ccnms.qna.dto.QnaDTO;
import com.application.ccnms.shop.dao.ShopDAO;
import com.application.ccnms.shop.dto.ShopDTO;

@Service
public class ShopServiceImpl implements ShopService {
	
	private ShopDAO shopDAO;
	
	@Autowired
	public ShopServiceImpl(ShopDAO shopDAO) {
		this.shopDAO = shopDAO;
	}

	@Override
	public void addProduct(ShopDTO shopDTO) throws Exception {
		shopDAO.insertProduct(shopDTO);
	}

	@Override
	public List<ShopDTO> getProductList() throws Exception {
		return shopDAO.selectListProductList() ;
	}
	@Override
	public List<ShopDTO> getLatestList() throws Exception {
		return shopDAO.selectListLatestList() ;
	}

	@Override
	public List<ShopDTO> getSortLatestList(Map<String,String>sortMap) throws Exception {
		return shopDAO.selectListSortLatestList(sortMap);
	}

	
	@Override
	public List<ShopDTO> sortList(Map<String,String>sortMap) throws Exception {
		return shopDAO.selectListSortList(sortMap);
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
