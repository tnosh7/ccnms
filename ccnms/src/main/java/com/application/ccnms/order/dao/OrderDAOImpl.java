package com.application.ccnms.order.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.ccnms.order.dto.CartDTO;
import com.application.ccnms.shop.dto.ShopDTO;

@Repository
public class OrderDAOImpl implements OrderDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public ShopDTO selectOneShopDTO(long productId) throws Exception {
		return sqlSession.selectOne("order.selectOneShopDTO", productId);
	}
	
	@Override
	public CartDTO selectOneDuplicatedKeep(CartDTO cartDTO) throws Exception {
		return sqlSession.selectOne("order.selectOneDuplicatedKeep", cartDTO);
	}

	@Override
	public void insertMyKeep(CartDTO cartDTO) throws Exception {
		sqlSession.insert("insertMyKeep", cartDTO);
	}

	@Override
	public int selectOneMyCartCnt() throws Exception {
		return sqlSession.selectOne("order.selectOneMyCartCnt");
	}

}
