package com.application.ccnms.reply.dao;

import java.util.List;

import com.application.ccnms.reply.dto.ReplyDTO;

public interface ReplyDAO {
	public int selectOneAllReplyCnt(long diggingId) throws Exception;
	public void insertReply(ReplyDTO replyDTO)throws Exception;

}
