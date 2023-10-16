package com.application.ccnms.shop.dao;

import java.util.List;

import com.application.ccnms.shop.dto.ShopDTO;

public interface ShopDAO {
	public List<ShopDTO> selectListProductList() throws Exception ;
	public List<ShopDTO> selectListdiscountRateList() throws Exception ;
	public void insertProduct(ShopDTO shopDTO) throws Exception ;
	public List<ShopDTO> selectListSortList(String sort) throws Exception ;
	public ShopDTO selectOneProductDetail(long productCd) throws Exception ;
	public void updateReadCnt(long productCd)throws Exception ;

}
