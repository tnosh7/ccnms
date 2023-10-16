package com.application.ccnms.shop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.ccnms.shop.dto.ShopDTO;

@Repository
public class ShopDAOImpl implements ShopDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertProduct(ShopDTO shopDTO) {
		sqlSession.insert("shop.insertProduct", shopDTO);
	}

	@Override
	public List<ShopDTO> selectListProductList() {
		return sqlSession.selectList("shop.selectListProductList");
	}

	@Override
	public List<ShopDTO> selectListSortList(String sort) throws Exception {
		return sqlSession.selectList("shop.selectListSortList", sort);
	}

	@Override
	public ShopDTO selectOneProductDetail(long productCd) throws Exception {
		return sqlSession.selectOne("shop.selectOneProductDetai", productCd);
	}

	@Override
	public List<ShopDTO> selectListdiscountRateList() throws Exception {
		return sqlSession.selectList("shop.selectListdiscountRateList");
	}

	@Override
	public void updateReadCnt(long productCd) throws Exception {
		sqlSession.update("shop.updateReadCnt", productCd);
	}
}
