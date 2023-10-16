package com.application.ccnms.common.dao;

import java.util.List;
import java.util.Map;

import com.application.ccnms.digging.dto.DiggingDTO;
import com.application.ccnms.shop.dto.ShopDTO;
import com.application.ccnms.user.dto.UserDTO;

public interface CommonDAO {
	public List<DiggingDTO> selectListDiggingList(Map<String,Object> search) throws Exception ;
	public List<DiggingDTO> selectListHeadList()throws Exception ;
	public List<ShopDTO> selectListRecentShopList()throws Exception ;
	public int updateThumbsUp(long diggingId)throws Exception ;
	public int selectOneAllDiggingCnt(String search) throws Exception ;
}
