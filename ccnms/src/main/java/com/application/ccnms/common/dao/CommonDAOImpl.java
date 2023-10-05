package com.application.ccnms.common.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
}
