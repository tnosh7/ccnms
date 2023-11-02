package com.application.ccnms.order.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.ccnms.order.dto.CartDTO;
import com.application.ccnms.shop.dto.ShopDTO;
import com.application.ccnms.user.dto.UserDTO;

@Repository
public class OrderDAOImpl implements OrderDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public ShopDTO selectOneShopDTO(long productCd) throws Exception {
		return sqlSession.selectOne("order.selectOneShopDTO", productCd);
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
	public UserDTO selectOneUser(String userId) throws Exception {
		return sqlSession.selectOne("selectOneUser", userId);
	}
	
	@Override
	public int selectOneMyCartCnt() throws Exception {
		return sqlSession.selectOne("order.selectOneMyCartCnt");
	}


}
