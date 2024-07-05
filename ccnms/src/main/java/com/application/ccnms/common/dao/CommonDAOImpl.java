package com.application.ccnms.common.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.ccnms.digging.dto.DiggingDTO;
import com.application.ccnms.shop.dto.ShopDTO;
import com.application.ccnms.user.dto.UserDTO;

@Repository
public class CommonDAOImpl implements CommonDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<DiggingDTO> selectListDiggingList(Map<String, Object> sortMap) throws Exception {
		return sqlSession.selectList("common.selectListDiggingList", sortMap);
	}

	@Override
	public int selectOneAllDiggingCnt() throws Exception {
		return sqlSession.selectOne("common.selectOneAllDiggingCnt");
	}

	@Override
	public void updateThumbsUp(long diggingId) throws Exception {
		 sqlSession.update("common.updateThumbsUp", diggingId);
	}
	
	@Override
	public int selectThumbsUp(long diggingId) throws Exception {
		return sqlSession.selectOne("common.selectThumbsUp",diggingId);
	}
	
	@Override
	public List<DiggingDTO> selectListHeadList() throws Exception {
		return sqlSession.selectList("common.selectListHeadList");
	}

	@Override
	public List<ShopDTO> selectListPopulerShopList() throws Exception {
		return sqlSession.selectList("common.selectListPopulerShopList");
	}

	@Override
	public List<DiggingDTO> selectListDiggingSearch(String search) throws Exception {
		return sqlSession.selectList("common.selectListDiggingSearch", search);
	}

	@Override
	public List<ShopDTO> selectListShopSearch(String search) throws Exception {
		return sqlSession.selectList("common.selectListShopSearch", search);
	}



}
