package com.application.ccnms.common.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.ccnms.digging.dto.DiggingDTO;

@Repository
public class CommonDAOImpl implements CommonDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int selectOneNewDiggingCnt() throws Exception {
		return sqlSession.selectOne("common.selectOneNewDiggingCnt");
	}

	@Override
	public int selectOneAllDiggingCnt() throws Exception {
		return sqlSession.selectOne("common.selectOneAllDiggingCnt");
	}

	@Override
	public int selectOneReplyCnt() throws Exception {
		return sqlSession.selectOne("common.selectOneReplyCnt");
	}

	@Override
	public int selectOneThumbsUpCnt() throws Exception {
		return sqlSession.selectOne("common.selectOneThumbsUpCnt");
	}

	@Override
	public List<DiggingDTO> selectListDiggingList() throws Exception {
		return sqlSession.selectList("common.selectListDiggingList");
	}

	@Override
	public List<DiggingDTO> selectListThumbsUpList() throws Exception {
		return sqlSession.selectList("common.selectListThumbsUpList");
	}

	@Override
	public List<DiggingDTO> selectListRecentList() throws Exception {
		return sqlSession.selectList("common.selectListRecentList");
	}

	@Override
	public int updateThumbsUp(long diggingId) throws Exception {
		 return sqlSession.update("common.updateThumbsUp", diggingId);
	}

}
