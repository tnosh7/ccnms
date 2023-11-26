package com.application.ccnms.admin.service;


import java.util.List;
import java.util.Map;

import com.application.ccnms.admin.dto.AdminDTO;
import com.application.ccnms.digging.dto.DiggingDTO;

public interface AdminService {
	public AdminDTO loginAdmin(AdminDTO adminDTO) throws Exception ;
	public void addRegisterAdmin(AdminDTO adminDTO) throws Exception ;
	public void todayCnt() throws Exception;
	public int getDiggingCnt() throws Exception; 
	public int getUserCnt() throws Exception; 
	public int getShopCnt() throws Exception; 
	public int getSaleCnt() throws Exception; 
	public List<Map<String,Object>>getUserStaticList()throws Exception; 
	public List<DiggingDTO> getNoticeList()throws Exception; 
	public int getMonthOrder()throws Exception; 
}
