package com.application.ccnms.digging.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class SubTitleDTO {
	private int subId;
	private int mainId;
	private String subTitle;
	private Date createDt;
	public int getSubId() {
		return subId;
	}
	public void setSubId(int subId) {
		this.subId = subId;
	}
	public int getMainId() {
		return mainId;
	}
	public void setMainId(int mainId) {
		this.mainId = mainId;
	}
	public String getSubTitle() {
		return subTitle;
	}
	public void setSubTitle(String subTitle) {
		this.subTitle = subTitle;
	}
	public Date getCreateDt() {
		return createDt;
	}
	public void setCreateDt(Date createDt) {
		this.createDt = createDt;
	}
	@Override
	public String toString() {
		return "SubTitleDTO [subId=" + subId + ", mainId=" + mainId + ", subTitle=" + subTitle + ", createDt="
				+ createDt + "]";
	}
	
}
