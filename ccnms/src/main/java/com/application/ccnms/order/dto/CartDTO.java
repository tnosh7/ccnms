package com.application.ccnms.order.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class CartDTO {
	
	private long cartCd;
	private String userId;
	private long productId;
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
	public long getProductId() {
		return productId;
	}
	public void setProductId(long productId) {
		this.productId = productId;
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
		return "OrderDTO [cartCd=" + cartCd + ", userId=" + userId + ", productId=" + productId + ", cartQty=" + cartQty
				+ ", enrollDT=" + enrollDT + "]";
	}
	
	
	
	
}
