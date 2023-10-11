package com.application.ccnms.common.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.ccnms.digging.dto.DiggingDTO;
import com.application.ccnms.user.dto.UserDTO;

@Repository
public class CommonDAOImpl implements CommonDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<DiggingDTO> selectListDiggingList() throws Exception {
		return sqlSession.selectList("common.selectListDiggingList");
	}
	@Override
	public List<DiggingDTO> selectListDiggingList(String sort) throws Exception {
		return sqlSession.selectList("common.selectListSortDiggingList", sort);
	}
	@Override
	public int selectOneNewDiggingCnt() throws Exception {
		return sqlSession.selectOne("common.selectOneNewDiggingCnt");
	}

	@Override
	public int selectOneAllDiggingCnt() throws Exception {
		return sqlSession.selectOne("common.selectOneAllDiggingCnt");
	}

	@Override
	public int selectOneReplyCnt(long diggingId) throws Exception {
		return sqlSession.selectOne("common.selectOneReplyCnt", diggingId);
	}

	@Override
	public int selectOneThumbsUpCnt() throws Exception {
		return sqlSession.selectOne("common.selectOneThumbsUpCnt");
	}


	@Override
	public int updateThumbsUp(long diggingId) throws Exception {
		 return sqlSession.update("common.updateThumbsUp", diggingId);
	}
	@Override
	public List<UserDTO> selectOneUserInfo(String writer) throws Exception {
		return sqlSession.selectOne("common.selectOneUserInfo", writer);
	}
	@Override
	public List<DiggingDTO> selectListHeadList() throws Exception {
		return sqlSession.selectList("common.selectListHeadList");
	}

}
