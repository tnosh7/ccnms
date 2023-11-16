package com.application.ccnms.admin.shop.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.ccnms.shop.dto.ShopDTO;


@Repository
public class AdminShopDAOImpl implements AdminShopDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<ShopDTO> selectListShop() throws Exception {
		return sqlSession.selectList("adminShop.selectListShop");
	}
	@Override
	public List<Map<String,Object>> selectListOrder() throws Exception {
		return sqlSession.selectList("adminShop.selectListOrder");
	}
	@Override
	public Map<String,Object> selectOneOrderDetail(Map<String, Object> adminOrderDetailMap) throws Exception {
		return sqlSession.selectOne("adminShop.selectOneOrder", adminOrderDetailMap);
	}
	
	
	
}
