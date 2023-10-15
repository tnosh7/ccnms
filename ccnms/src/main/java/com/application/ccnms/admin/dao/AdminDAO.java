package com.application.ccnms.admin.dao;

import com.application.ccnms.admin.dto.AdminDTO;

public interface AdminDAO {
	public AdminDTO selectOneLoginAdmin(AdminDTO adminDTO)throws Exception;
	public void insertRegisterAdmin(AdminDTO adminDTO)throws Exception;
	public int selectOneTodayReplyCnt(String today)throws Exception;
	public int selectOneTodayDiggingCnt(String today)throws Exception;
	public int selectOneTodayUserCnt(String today)throws Exception;
	public int selectOneTodayShopCnt(String today)throws Exception;
	public int selectOneTodaySaleCnt(String today)throws Exception;
}
