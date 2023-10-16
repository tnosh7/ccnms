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
	public List<DiggingDTO> selectListDiggingList(Map<String, Object> search) throws Exception {
		return sqlSession.selectList("common.selectListDiggingList", search);
	}

	@Override
	public int selectOneAllDiggingCnt(String search) throws Exception {
		return sqlSession.selectOne("common.selectOneAllDiggingCnt", search);
	}

	@Override
	public int updateThumbsUp(long diggingId) throws Exception {
		 return sqlSession.update("common.updateThumbsUp", diggingId);
	}
	@Override
	public List<DiggingDTO> selectListHeadList() throws Exception {
		return sqlSession.selectList("common.selectListHeadList");
	}

	@Override
	public List<ShopDTO> selectListRecentShopList() throws Exception {
		return sqlSession.selectList("common.selectListRecentShopList");
	}

}
