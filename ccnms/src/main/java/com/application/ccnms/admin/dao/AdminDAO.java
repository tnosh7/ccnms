package com.application.ccnms.admin.dao;

import java.util.List;
import java.util.Map;

import com.application.ccnms.admin.dto.AdminDTO;
import com.application.ccnms.digging.dto.DiggingDTO;

public interface AdminDAO {
	public AdminDTO selectOneLoginAdmin(AdminDTO adminDTO)throws Exception;
	public AdminDTO selectOneAuthenticationAdmin(String adminId)throws Exception;
	public void insertRegisterAdmin(AdminDTO adminDTO)throws Exception;
	public int selectOneTodayReplyCnt(String today)throws Exception;
	public int selectOneTodayDiggingCnt(String today)throws Exception;
	public int selectOneTodayUserCnt(String today)throws Exception;
	public int selectOneTodayShopCnt(String today)throws Exception;
	public int selectOneTodaySaleCnt(String today)throws Exception;
	public List<Map<String,Object>> selectListUserStatic()throws Exception;
	public List<DiggingDTO> selectListNoticeList()throws Exception;
	public Integer selectOneMonthOrder()throws Exception;
	
}
