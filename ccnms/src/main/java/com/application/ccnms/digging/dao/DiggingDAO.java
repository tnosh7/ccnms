package com.application.ccnms.digging.dao;

import java.util.List;
import java.util.Map;

import com.application.ccnms.digging.dto.DiggingDTO;
import com.application.ccnms.digging.dto.JoinTitleDTO;
import com.application.ccnms.digging.dto.MainTitleDTO;
import com.application.ccnms.digging.dto.SubTitleDTO;
import com.application.ccnms.reply.dto.ReplyDTO;
import com.application.ccnms.user.dto.UserDTO;

public interface DiggingDAO {
	public List<JoinTitleDTO> selectListJoinTitleList()throws Exception ;
	public List<MainTitleDTO> selectListMainTitle() throws Exception ;
	public List<SubTitleDTO> selectListSubTitle()throws Exception ;
	public List<DiggingDTO> selectListDigging(int mainTitle)throws Exception ;
	public List<DiggingDTO> selectListPopulerList(int mainTitle)throws Exception ;
	public List<UserDTO> selectListUser(String writer)throws Exception ;
	public List<DiggingDTO> selectListDigList(String diggingTopic)throws Exception ;
	public void insertDigging(DiggingDTO diggingDTO) throws Exception ;
	public int updateReadCnt(long diggingId)throws Exception ;
	public Map<String,Object> selectDiggingDetail(long diggingId)throws Exception ;
	public int updateThumbsUp(long diggingId)throws Exception ;
	public int selectOneAllReplyCnt(long diggingId)throws Exception ;
	public List<ReplyDTO> selectListReplyList(long diggingId)throws Exception ;
	public void updateModifyDigging(DiggingDTO diggingDTO) throws Exception ;


}
