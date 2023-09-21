package com.application.ccnms.admin.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class AdminDTO {

	private String adminId;
	private String passwd;
	private Date joinDT;
	
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public Date getJoinDT() {
		return joinDT;
	}
	public void setJoinDT(Date joinDT) {
		this.joinDT = joinDT;
	}
	@Override
	public String toString() {
		return "AdminDTO [adminId=" + adminId + ", passwd=" + passwd + ", joinDT=" + joinDT + "]";
	}
	
	
}
