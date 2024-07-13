package com.application.ccnms.digging.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.ccnms.digging.dto.DiggingDTO;
import com.application.ccnms.digging.dto.JoinTitleDTO;
import com.application.ccnms.digging.dto.MainTitleDTO;
import com.application.ccnms.digging.dto.SubTitleDTO;
import com.application.ccnms.reply.dto.ReplyDTO;
import com.application.ccnms.user.dto.UserDTO;

@Repository
public class DiggingDAOImpl implements DiggingDAO  {

	private SqlSession sqlSession;

	@Autowired
	public DiggingDAOImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	//토픽 분류
	@Override
	public List<JoinTitleDTO> selectListJoinTitleList() throws Exception {
		return sqlSession.selectList("digging.selectListJoinTitleList");
	}	
	@Override
	public List<MainTitleDTO> selectListMainTitle() throws Exception {
		return sqlSession.selectList("digging.selectListMainTitle");
	}
	@Override
	public List<SubTitleDTO> selectListSubTitle() throws Exception {
		return sqlSession.selectList("digging.selectListSubTitle");
	}
////정렬, 페이징
	@Override
	public List<DiggingDTO> selectListDiggingList(Map<String, Object> searchMap) throws Exception {
		return sqlSession.selectList("digging.selectListDiggingList", searchMap);
	}
	
	@Override
	public List<DiggingDTO> selectListPopulerList(Map<String, Object> searchMap) throws Exception {
		return sqlSession.selectList("digging.selectListPopulerList", searchMap);
	}
	@Override
	public List<DiggingDTO> selectListSubTitleList(Map<String, Object> searchMap) throws Exception {
		return sqlSession.selectList("digging.selectListDigList", searchMap);
	}
	@Override
	public int selectListAllDiggingCnt(int mainTitle) throws Exception {
		return sqlSession.selectOne("digging.selectListAllDiggingCnt", mainTitle);
	}
	@Override
	public List<UserDTO> selectListUser(String writer) throws Exception {
		return sqlSession.selectList("digging.selectListUser", writer);
	}
	@Override
	public void insertDigging(DiggingDTO diggingDTO) throws Exception {
		sqlSession.insert("digging.insertDigging", diggingDTO);	
	}
	@Override
	public Map<String,Object> selectDiggingDetail(long diggingId) throws Exception {
		return sqlSession.selectOne("digging.selectDiggingDetail", diggingId);
	}

	@Override
	public int updateThumbsUp(long diggingId) throws Exception {
		return sqlSession.update("digging.updateThumbsUp", diggingId);
	}

	@Override
	public int selectOneAllReplyCnt(long diggingId) throws Exception {
		return sqlSession.selectOne("digging.selectOneAllReplyCnt",diggingId);
	}

	@Override
	public List<ReplyDTO> selectListReplyList(long diggingId) throws Exception {
		return sqlSession.selectList("digging.selectListReplyList",diggingId);
	}

	@Override
	public int updateReadCnt(long diggingId) throws Exception {
		return sqlSession.update("digging.updateReadCnt", diggingId);
	}

	@Override
	public void updateModifyDigging(DiggingDTO diggingDTO) throws Exception {
		sqlSession.update("digging.updateModifyDigging", diggingDTO);
	}
	



	




}
