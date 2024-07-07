package com.application.ccnms.order.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.ccnms.myShop.dto.CartDTO;
import com.application.ccnms.myShop.dto.KeepDTO;
import com.application.ccnms.order.dto.OrderDTO;
import com.application.ccnms.shop.dto.ShopDTO;
import com.application.ccnms.user.dto.UserDTO;

@Repository
public class OrderDAOImpl implements OrderDAO {

	
	private SqlSession sqlSession;

	
	@Autowired
	public OrderDAOImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public ShopDTO selectOneShopDTO(long productCd) throws Exception {
		return sqlSession.selectOne("order.selectOneShop", productCd);
	}

	@Override
	public UserDTO selectOneUser(String userId) throws Exception {
		return sqlSession.selectOne("order.selectOneUser", userId);
	}

	@Override
	public List<ShopDTO> selectListCartProductList(int[] productCdsList) throws Exception {
		return sqlSession.selectList("order.selectListCartProductList", productCdsList);
	}

	@Override
	public void updateShopStockCnt(Map<String, Object> orderMap) throws Exception {
		sqlSession.update("order.updateShopStockCnt", orderMap);
	}

	@Override
	public void insertOrder(OrderDTO orderDTO) throws Exception {
		sqlSession.insert("order.insertOrder", orderDTO);
	}

	@Override
	public void insertOrderByCart(List<OrderDTO> orderList)throws Exception {
		sqlSession.insert("order.insertOrderByCart", orderList);
	}

	@Override
	public void deleteCartByOrder(int[] cartCdList)throws Exception {
		sqlSession.delete("order.deleteCartByOrder", cartCdList);
	}

	@Override
	public void updateStockCnt(List<Map<String, Integer>> productMapList) throws Exception {
		sqlSession.update("order.updateStockCnt", productMapList);
	}


	


}
