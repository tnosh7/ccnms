package com.application.ccnms.reply.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.ccnms.reply.dto.ReplyDTO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int selectOneAllReplyCnt(long diggingId) throws Exception {
		return sqlSession.selectOne("reply.selectOneAllReplyCnt", diggingId);
	}

	@Override
	public void insertReply(ReplyDTO replyDTO) throws Exception {
		sqlSession.insert("reply.insertReply", replyDTO);
	}
	
}
