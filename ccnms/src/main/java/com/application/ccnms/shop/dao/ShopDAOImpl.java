package com.application.ccnms.shop.dao;

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
}
