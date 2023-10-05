package com.application.ccnms.digging.dao;

import java.util.List;

import com.application.ccnms.digging.dto.DiggingDTO;
import com.application.ccnms.reply.dto.ReplyDTO;

public interface DiggingDAO {
	public void insertDigging(DiggingDTO diggingDTO) throws Exception ;
	public List<DiggingDTO> selectListDiggingList()throws Exception ;
	public DiggingDTO selectDiggingDetail(long diggingId)throws Exception ;
	public void updateThumbsUp(long diggingId)throws Exception ;
	public int selectOneAllReplyCnt(long diggingId)throws Exception ;
	public List<ReplyDTO> selectListReplyList(long diggingId)throws Exception ;





}
