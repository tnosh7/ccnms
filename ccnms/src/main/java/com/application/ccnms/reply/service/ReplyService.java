package com.application.ccnms.reply.service;

import com.application.ccnms.reply.dto.ReplyDTO;

public interface ReplyService {
	public int getAllReplyCnt(long diggingId) throws Exception;
	public void addReply(ReplyDTO replyDTO)throws Exception;
	public void updateReplyCnt(long diggingId)throws Exception;
	public void removeReply(long replyId)throws Exception;







}
