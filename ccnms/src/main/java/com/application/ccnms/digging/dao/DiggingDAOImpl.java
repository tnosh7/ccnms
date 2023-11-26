package com.application.ccnms.digging.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.ccnms.digging.dto.DiggingDTO;
import com.application.ccnms.reply.dto.ReplyDTO;
import com.application.ccnms.user.dto.UserDTO;

@Repository
public class DiggingDAOImpl implements DiggingDAO  {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertDigging(DiggingDTO diggingDTO) throws Exception {
		sqlSession.insert("digging.insertDigging", diggingDTO);	
	}

	@Override
	public List<DiggingDTO> selectListDiggingList(Map<String, Object> searchMap) throws Exception {
		return sqlSession.selectList("digging.selectListDiggingList", searchMap);
	}
	@Override
	public List<DiggingDTO> selectListPopulerList(Map<String, Object> searchMap) throws Exception {
		return sqlSession.selectList("digging.selectListPopulerList", searchMap);
	}
	@Override
	public List<UserDTO> selectListUser(String writer) throws Exception {
		return sqlSession.selectList("digging.selectListUser", writer);
	}
	@Override
	public int selectOneDiggingCnt(String diggingTopic) throws Exception {
		return sqlSession.selectOne("digging.selectOneDiggingCnt", diggingTopic);
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
	public List<DiggingDTO> selectListRecentList(String diggingTopic) throws Exception {
		return sqlSession.selectList("digging.selectListRecentList", diggingTopic);
	}

	@Override
	public void updateModifyDigging(DiggingDTO diggingDTO) throws Exception {
		sqlSession.update("digging.updateModifyDigging", diggingDTO);
	}

	@Override
	public void deleteDigging(long diggingId) throws Exception {
		sqlSession.delete("digging.deleteDigging", diggingId);
	}

	

}
