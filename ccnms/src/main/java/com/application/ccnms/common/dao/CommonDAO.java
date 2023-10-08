package com.application.ccnms.common.dao;

import java.util.List;

import com.application.ccnms.digging.dto.DiggingDTO;

public interface CommonDAO {
	public List<DiggingDTO> selectListDiggingList() throws Exception ;
	public List<DiggingDTO> selectListThumbsUpList() throws Exception ;
	public List<DiggingDTO> selectListRecentList() throws Exception ;

	public int updateThumbsUp(long diggingId)throws Exception ;
	public int selectOneNewDiggingCnt() throws Exception ;
	public int selectOneAllDiggingCnt() throws Exception ;
	public int selectOneReplyCnt() throws Exception ;
	public int selectOneThumbsUpCnt() throws Exception ;
}
