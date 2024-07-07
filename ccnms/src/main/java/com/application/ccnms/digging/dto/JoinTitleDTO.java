package com.application.ccnms.digging.dto;

import org.springframework.stereotype.Component;

@Component
public class JoinTitleDTO {
	
	private int mainId;
    private String mainTitle;
    private int subId;
    private String subTitle;
    
	public int getMainId() {
		return mainId;
	}
	public void setMainId(int mainId) {
		this.mainId = mainId;
	}
	public String getMainTitle() {
		return mainTitle;
	}
	public void setMainTitle(String mainTitle) {
		this.mainTitle = mainTitle;
	}
	public int getSubId() {
		return subId;
	}
	public void setSubId(int subId) {
		this.subId = subId;
	}
	public String getSubTitle() {
		return subTitle;
	}
	public void setSubTitle(String subTitle) {
		this.subTitle = subTitle;
	}
	@Override
	public String toString() {
		return "JoinTitleDTO [mainId=" + mainId + ", mainTitle=" + mainTitle + ", subId=" + subId + ", subTitle="
				+ subTitle + "]";
	}
    
}
