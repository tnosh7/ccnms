package com.application.ccnms.digging.dao;

import java.util.List;
import java.util.Map;

import com.application.ccnms.digging.dto.DiggingDTO;
import com.application.ccnms.reply.dto.ReplyDTO;
import com.application.ccnms.user.dto.UserDTO;

public interface DiggingDAO {
	public void insertDigging(DiggingDTO diggingDTO) throws Exception ;
	public List<DiggingDTO> selectListDiggingList(Map<String, Object> searchMap)throws Exception ;
	public List<DiggingDTO> selectListPopulerList(Map<String, Object> searchMap)throws Exception ;
	public int selectOneDiggingCnt(String search) throws Exception ;
	public List<UserDTO> selectListUser(String writer)throws Exception ;
	public int updateReadCnt(long diggingId)throws Exception ;
	public DiggingDTO selectDiggingDetail(long diggingId)throws Exception ;
	public int updateThumbsUp(long diggingId)throws Exception ;
	public int updateLikePoint(String writer) throws Exception ;
	public int selectOneAllReplyCnt(long diggingId)throws Exception ;
	public List<ReplyDTO> selectListReplyList(long diggingId)throws Exception ;
	public List<DiggingDTO> selectListRecentList(String diggingTopic) throws Exception ;
	public void updateModifyDigging(DiggingDTO diggingDTO) throws Exception ;
	public void deleteDigging(long diggingId) throws Exception ;




}
