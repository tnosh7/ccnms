package com.application.ccnms.reply.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.ccnms.reply.dao.ReplyDAO;
import com.application.ccnms.reply.dto.ReplyDTO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyDAO replyDAO;

	@Override
	public int getAllReplyCnt(long diggingId) throws Exception {
		return replyDAO.selectOneAllReplyCnt(diggingId);
	}

	@Override
	public void addReply(ReplyDTO replyDTO) throws Exception {
		replyDAO.insertReply(replyDTO);
	}

	@Override
	public void updateReplyCnt(long diggingId) throws Exception {
		replyDAO.updateReplyCnt(diggingId);
	}

	@Override
	public void removeReply(long replyId) throws Exception {
		replyDAO.deleteReply(replyId);
	}
}
