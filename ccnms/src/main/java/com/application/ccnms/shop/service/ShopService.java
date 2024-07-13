package com.application.ccnms.shop.service;

import java.util.List;
import java.util.Map;

import com.application.ccnms.qna.dto.QnaDTO;
import com.application.ccnms.shop.dto.ShopDTO;

public interface ShopService {
	public List<ShopDTO> getProductList() throws Exception ;
	public List<ShopDTO> getLatestList() throws Exception ;
	public void addProduct(ShopDTO shopDTO) throws Exception ;
	public List<ShopDTO> sortList(Map<String,String>sortMap) throws Exception ;
	public List<ShopDTO> getSortLatestList(Map<String,String>sortMap) throws Exception ;
	public ShopDTO getProductDetail(long productCd) throws Exception ;
	public List<ShopDTO> bestSortList(String bestSort) throws Exception ;
	public List<QnaDTO> getQnaList(long productCd) throws Exception ;
}
