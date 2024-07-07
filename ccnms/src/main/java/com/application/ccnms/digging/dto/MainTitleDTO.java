package com.application.ccnms.digging.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class MainTitleDTO {
	private int mainId;
	private String mainTitle;
	private Date createDt;
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
	public Date getCreateDt() {
		return createDt;
	}
	public void setCreateDt(Date createDt) {
		this.createDt = createDt;
	}
	@Override
	public String toString() {
		return "MainTitleDTO [mainId=" + mainId + ", mainTitle=" + mainTitle + ", createDt=" + createDt + "]";
	}
	

}
