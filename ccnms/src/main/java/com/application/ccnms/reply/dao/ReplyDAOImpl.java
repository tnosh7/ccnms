package com.application.ccnms.reply.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.ccnms.reply.dto.ReplyDTO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	private SqlSession sqlSession;

	@Autowired
	public ReplyDAOImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public int selectOneAllReplyCnt(long diggingId) throws Exception {
		return sqlSession.selectOne("reply.selectOneAllReplyCnt", diggingId);
	}

	@Override
	public void insertReply(ReplyDTO replyDTO) throws Exception {
		sqlSession.insert("reply.insertReply", replyDTO);
	}

	@Override
	public void updateReplyCnt(long diggingId) throws Exception {
		sqlSession.update("reply.updateReplyCnt",diggingId);
	}

	@Override
	public void deleteReply(long replyId) throws Exception {
		sqlSession.delete("reply.deleteReply", replyId);
	}

	@Override
	public void deleteReplyCnt(long replyId) {
		sqlSession.update("reply.deleteReplyCnt", replyId);
	}
	
}
