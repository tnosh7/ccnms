package com.application.ccnms.myshop.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class KeepDTO {
	
	private long keepCd;
	private String userId;
	private long productCd;
	private int keepQty;
	private Date enrollDT;
	public long getKeepCd() {
		return keepCd;
	}
	public void setKeepCd(long keepCd) {
		this.keepCd = keepCd;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public long getProductCd() {
		return productCd;
	}
	public void setProductCd(long productCd) {
		this.productCd = productCd;
	}
	public int getKeepQty() {
		return keepQty;
	}
	public void setKeepQty(int keepQty) {
		this.keepQty = keepQty;
	}
	public Date getEnrollDT() {
		return enrollDT;
	}
	public void setEnrollDT(Date enrollDT) {
		this.enrollDT = enrollDT;
	}
	@Override
	public String toString() {
		return "KeepDTO [keepCd=" + keepCd + ", userId=" + userId + ", productCd=" + productCd + ", keepQty=" + keepQty
				+ ", enrollDT=" + enrollDT + "]";
	}
}
