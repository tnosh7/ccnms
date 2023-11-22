package com.application.ccnms.admin.service;


import com.application.ccnms.admin.dto.AdminDTO;

public interface AdminService {
	public AdminDTO loginAdmin(AdminDTO adminDTO) throws Exception ;
	public void addRegisterAdmin(AdminDTO adminDTO) throws Exception ;
	public void todayCnt() throws Exception;
	public int getDiggingCnt() throws Exception; 
	public int getUserCnt() throws Exception; 
	public int getShopCnt() throws Exception; 
	public int getSaleCnt() throws Exception; 
}
