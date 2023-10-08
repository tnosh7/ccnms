package com.application.ccnms.ranking.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.ccnms.user.dto.UserDTO;

@Repository
public class RankingDAOImpl implements RankingDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<UserDTO> selectListRankingList() {
		return sqlSession.selectList("ranking.selectListRankingList");
	}
	
}
