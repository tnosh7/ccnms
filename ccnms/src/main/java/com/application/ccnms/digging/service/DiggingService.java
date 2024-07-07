package com.application.ccnms.digging.service;

import java.util.List;
import java.util.Map;

import com.application.ccnms.digging.dto.DiggingDTO;
import com.application.ccnms.digging.dto.JoinTitleDTO;
import com.application.ccnms.digging.dto.MainTitleDTO;
import com.application.ccnms.digging.dto.SubTitleDTO;
import com.application.ccnms.reply.dto.ReplyDTO;
import com.application.ccnms.user.dto.UserDTO;

public interface DiggingService {
	public List<JoinTitleDTO> getJoinTitleList()throws Exception;
	public List<MainTitleDTO> getMainTitle()throws Exception;
	public List<SubTitleDTO> getSubTitle()throws Exception;
	public List<DiggingDTO> getPopulerList(int mainTitle) throws Exception;
	public List<UserDTO> getUser(String writer)throws Exception;
	public List<DiggingDTO> getDigList(String diggingTopic)throws Exception;
	public void addDigging(DiggingDTO diggingDTO) throws Exception;
	public Map<String,Object> getDiggingDetail(long diggingId) throws Exception;
	public int upThumbsUp(long diggingId)throws Exception;	
	public int getallReplyCnt(long diggingId)throws Exception;	 
	public List<ReplyDTO> getReplyList(long diggingId)throws Exception;	 
	public void updateDigging(DiggingDTO diggingDTO) throws Exception;
	public List<DiggingDTO> getDiggingList(int mainTitle) throws Exception;
	
	

		 
}
