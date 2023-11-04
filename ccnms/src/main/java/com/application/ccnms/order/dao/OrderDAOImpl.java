package com.application.ccnms.order.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.ccnms.order.dto.CartDTO;
import com.application.ccnms.order.dto.KeepDTO;
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
	public CartDTO selectOneDuplicatedCart(CartDTO cartDTO) throws Exception {
		return sqlSession.selectOne("order.selectOneDuplicatedCart", cartDTO);
	}

	@Override
	public void insertMyCart(CartDTO cartDTO) throws Exception {
		sqlSession.insert("insertMyCart", cartDTO);
	}
	@Override
	public int selectOneMyCartCnt() throws Exception {
		return sqlSession.selectOne("order.selectOneMyCartCnt");
	}
	
	@Override
	public KeepDTO selectOneDuplicatedKeep(KeepDTO keepDTO) throws Exception {
		return sqlSession.selectOne("order.selectOneDuplicatedKeep", keepDTO);
	}
	
	@Override
	public void insertMyKeep(KeepDTO keepDTO) throws Exception {
		sqlSession.insert("insertMyKeep", keepDTO);
	}

	@Override
	public int selectOneMyKeepCnt() throws Exception {
		return sqlSession.selectOne("order.selectOneMyKeepCnt");
	}

	@Override
	public UserDTO selectOneUser(String userId) throws Exception {
		return sqlSession.selectOne("selectOneUser", userId);
	}

	@Override
	public List<Map<String,Object>> selectListCartList(String userId) throws Exception {
		return sqlSession.selectList("selectListCartList", userId);
	}

	@Override
	public void updateCartQty(Map<String, Object> updataMap) throws Exception {
		sqlSession.update("updateCartQty", updataMap);
	}

	@Override
	public void deleteCart(int[] deleteCartCdList) throws Exception {
		sqlSession.delete("deleteCart", deleteCartCdList);
	}
	


}
