package com.application.ccnms.ranking.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.ccnms.digging.dto.DiggingDTO;
import com.application.ccnms.ranking.dao.RankingDAO;
import com.application.ccnms.user.dto.UserDTO;

@Service
public class RankingServiceImpl implements RankingService {
	
	private RankingDAO rankingDAO;
	
	@Autowired
	public RankingServiceImpl(RankingDAO rankingDAO) {
		this.rankingDAO = rankingDAO;
	}

	@Override
	public List<Map<String, Object>> getRankingList() throws Exception {
		return rankingDAO.selectListRankingList();
	}

	@Override
	public List<DiggingDTO> getDiggingList(String userId) throws Exception {
		return rankingDAO.selectListDiggingList(userId);
	}

	@Override
	public List<Map<String, Object>> getDiggingRankList() throws Exception {
		return rankingDAO.selectListDiggingRank();
	}
}
