package com.application.ccnms.digging.service;

import java.util.List;

import com.application.ccnms.digging.dto.DiggingDTO;
import com.application.ccnms.reply.dto.ReplyDTO;

public interface DiggingService {
	public List<DiggingDTO> getDiggingList() throws Exception;
	public void addDigging(DiggingDTO diggingDTO) throws Exception;
	public DiggingDTO getDiggingDetail(long diggingId) throws Exception;
	public void ThumbsUp(long diggingId)throws Exception;	 
	public int getallReplyCnt(long diggingId)throws Exception;	 
	public List<ReplyDTO> getReplyList(long diggingId)throws Exception;	 


}
