package com.application.ccnms.ranking.dao;

import java.util.List;

import com.application.ccnms.user.dto.UserDTO;

public interface RankingDAO {
	public List<UserDTO> selectListRankingList();
}
