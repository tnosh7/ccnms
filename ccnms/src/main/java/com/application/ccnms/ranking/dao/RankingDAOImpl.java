package com.application.ccnms.ranking.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.ccnms.digging.dto.DiggingDTO;
import com.application.ccnms.user.dto.UserDTO;

@Repository
public class RankingDAOImpl implements RankingDAO {
	
	private SqlSession sqlSession;

	@Autowired
	public RankingDAOImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<Map<String, Object>> selectListRankingList() throws Exception {
		return sqlSession.selectList("ranking.selectListRankingList");
	}

	@Override
	public List<DiggingDTO> selectListDiggingList(String userId) throws Exception {
		return sqlSession.selectList("ranking.selectListDiggingList", userId);
	}

	@Override
	public List<Map<String, Object>> selectListDiggingRank() throws Exception {
		return sqlSession.selectList("ranking.selectListDiggingRank");
	}
	
}
