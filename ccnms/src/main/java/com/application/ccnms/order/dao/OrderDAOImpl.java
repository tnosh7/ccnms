package com.application.ccnms.order.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.ccnms.myShop.dto.CartDTO;
import com.application.ccnms.myShop.dto.KeepDTO;
import com.application.ccnms.shop.dto.ShopDTO;
import com.application.ccnms.user.dto.UserDTO;

@Repository
public class OrderDAOImpl implements OrderDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public UserDTO selectOneUser(String userId) throws Exception {
		return sqlSession.selectOne("selectOneUser", userId);
	}

	@Override
	public List<ShopDTO> selectListCartProductList(int[] productCdsList) throws Exception {
		return sqlSession.selectList("selectListCartProductList", productCdsList);
	}
	


}
