package com.application.ccnms.myshop.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class CartDTO {
	
	private long cartCd;
	private String userId;
	private long productCd;
	private int cartQty;
	private Date enrollDT;
	
	public long getCartCd() {
		return cartCd;
	}
	public void setCartCd(long cartCd) {
		this.cartCd = cartCd;
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
	public int getCartQty() {
		return cartQty;
	}
	public void setCartQty(int cartQty) {
		this.cartQty = cartQty;
	}
	public Date getEnrollDT() {
		return enrollDT;
	}
	public void setEnrollDT(Date enrollDT) {
		this.enrollDT = enrollDT;
	}
	@Override
	public String toString() {
		return "CartDTO [cartCd=" + cartCd + ", userId=" + userId + ", productCd=" + productCd + ", cartQty=" + cartQty
				+ ", enrollDT=" + enrollDT + "]";
	}
	
	
	
}