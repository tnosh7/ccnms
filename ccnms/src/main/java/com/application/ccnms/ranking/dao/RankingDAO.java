package com.application.ccnms.ranking.dao;

import java.util.List;
import java.util.Map;
import com.application.ccnms.digging.dto.DiggingDTO;


public interface RankingDAO {
	public List<Map<String, Object>> selectListRankingList() throws Exception;
	public List<DiggingDTO> selectListDiggingList(String userId) throws Exception;
	public List<Map<String, Object>> selectListDiggingRank() throws Exception;
}
