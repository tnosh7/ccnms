package com.application.ccnms.ranking.service;

import java.util.List;

import com.application.ccnms.digging.dto.DiggingDTO;
import com.application.ccnms.user.dto.UserDTO;

public interface RankingService {
	
	public List<UserDTO> getRankingList() throws Exception;
	public List<DiggingDTO> getDiggingList(String userId) throws Exception;
	public List<DiggingDTO> getDiggingRankList()throws Exception;
}
