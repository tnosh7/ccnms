package com.application.ccnms.common.dao;

import java.util.List;

import com.application.ccnms.digging.dto.DiggingDTO;
import com.application.ccnms.user.dto.UserDTO;

public interface CommonDAO {
	public List<DiggingDTO> selectListDiggingList() throws Exception ;
	public List<DiggingDTO> selectListDiggingList(String sort) throws Exception ;
	public List<DiggingDTO> selectListHeadList()throws Exception ;
	public int updateThumbsUp(long diggingId)throws Exception ;
	public List<UserDTO> selectOneUserInfo(String writer)throws Exception ;
	public int selectOneNewDiggingCnt() throws Exception ;
	public int selectOneAllDiggingCnt() throws Exception ;
	public int selectOneReplyCnt(long diggingId) throws Exception ;
	public int selectOneThumbsUpCnt() throws Exception ;
}
