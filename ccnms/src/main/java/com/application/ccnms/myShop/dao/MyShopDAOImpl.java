package com.application.ccnms.myShop.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.ccnms.myShop.dto.CartDTO;
import com.application.ccnms.myShop.dto.KeepDTO;
import com.application.ccnms.shop.dto.ShopDTO;

@Repository
public class MyShopDAOImpl implements MyShopDAO {

	
	private SqlSession sqlSession;

	
	@Autowired
	public MyShopDAOImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public ShopDTO selectOneShopDTO(long productCd) throws Exception {
		return sqlSession.selectOne("myShop.selectOneShopDTO", productCd);
	}

	@Override
	public CartDTO selectOneDuplicatedCart(CartDTO cartDTO) throws Exception {
		return sqlSession.selectOne("myShop.selectOneDuplicatedCart", cartDTO);
	}

	@Override
	public void insertMyCart(CartDTO cartDTO) throws Exception {
		sqlSession.insert("myShop.insertMyCart", cartDTO);
	}

	@Override
	public List<Map<String, Object>> selectListCartList(String userId) throws Exception {
		return sqlSession.selectList("myShop.selectListCartList", userId);
	}

	@Override
	public void updateCartProductQty(Map<String, Object> updateMap) throws Exception {
		sqlSession.update("myShop.updateCartProductQty", updateMap);
	}

	@Override
	public void deleteCart(int[] removeCartCdList) throws Exception {
		sqlSession.delete("myShop.deleteCart", removeCartCdList);
	}

	@Override
	public KeepDTO selectOneDuplicatedKeep(KeepDTO keepDTO) throws Exception {
		return sqlSession.selectOne("myShop.selectOneDuplicatedKeep", keepDTO);
	}

	@Override
	public void insertMyKeep(KeepDTO keepDTO) throws Exception {
		sqlSession.insert("myShop.insertMyKeep", keepDTO);
		
	}

	@Override
	public List<Map<String,Object>> selectListKeepList(String userId) throws Exception {
		return sqlSession.selectList("myShop.selectListKeepList", userId);
	}

	@Override
	public void deleteKeep(int[] removeKeepCdList) throws Exception {
		sqlSession.delete("myShop.deleteKeep", removeKeepCdList);
	}

	@Override
	public List<Map<String, Object>> selectListOrderList(String userId) throws Exception {
		return sqlSession.selectList("myShop.selectListOrderList", userId);
	}

	@Override
	public Map<String, Object> selectOneOrderDetail(Map<String, Object> orderDetailMap) throws Exception {
		return sqlSession.selectOne("myShop.selectOneOrderDetail", orderDetailMap);
	}

	@Override
	public List<Map<String, Object>> selectListSaleList(String userId) throws Exception {
		return sqlSession.selectList("myShop.selectListSaleList", userId);
	}

	@Override
	public void updateDeliveryStatus(int[] changeDeliveryList) throws Exception {
		sqlSession.update("myShop.updateDeliveryStatus",changeDeliveryList);
	}
	
	@Override
	public List<ShopDTO> selectListUserSaleList(String userId) throws Exception {
		return sqlSession.selectList("myShop.selectListUserSaleList", userId);
	}

	@Override
	public void deleteMySale(int[] removeMySale) throws Exception {
		sqlSession.delete("myShop.deleteMySale", removeMySale);
	}



}
