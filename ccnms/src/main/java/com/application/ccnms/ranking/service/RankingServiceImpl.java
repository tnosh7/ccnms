package com.application.ccnms.ranking.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.ccnms.ranking.dao.RankingDAO;
import com.application.ccnms.user.dto.UserDTO;

@Service
public class RankingServiceImpl implements RankingService {
	@Autowired
	private RankingDAO rankingDAO;

	@Override
	public List<UserDTO> getRankingList() {
		return rankingDAO.selectListRankingList();
	}
}
