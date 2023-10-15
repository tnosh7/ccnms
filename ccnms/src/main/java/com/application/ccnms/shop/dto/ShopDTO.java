package com.application.ccnms.shop.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class ShopDTO {
	
	private long productCd;
	private String productNm;
	private String writer;
	private int price;
	private int discountRate;
	private int stock;
	private String sort;
	private String deliveryMethod;
	private int deliveryPrice;
	private String content;
	private int point;
	private String productFile;
	private int qnaCnt;
	private Date enrollDt;
	private String tag;
	private int readCnt;
	public long getProductCd() {
		return productCd;
	}
	public void setProductCd(long productCd) {
		this.productCd = productCd;
	}
	public String getProductNm() {
		return productNm;
	}
	public void setProductNm(String productNm) {
		this.productNm = productNm;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getDiscountRate() {
		return discountRate;
	}
	public void setDiscountRate(int discountRate) {
		this.discountRate = discountRate;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getDeliveryMethod() {
		return deliveryMethod;
	}
	public void setDeliveryMethod(String deliveryMethod) {
		this.deliveryMethod = deliveryMethod;
	}
	public int getDeliveryPrice() {
		return deliveryPrice;
	}
	public void setDeliveryPrice(int deliveryPrice) {
		this.deliveryPrice = deliveryPrice;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getProductFile() {
		return productFile;
	}
	public void setProductFile(String productFile) {
		this.productFile = productFile;
	}
	public int getQnaCnt() {
		return qnaCnt;
	}
	public void setQnaCnt(int qnaCnt) {
		this.qnaCnt = qnaCnt;
	}
	public Date getEnrollDt() {
		return enrollDt;
	}
	public void setEnrollDt(Date enrollDt) {
		this.enrollDt = enrollDt;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public int getReadCnt() {
		return readCnt;
	}
	public void setReadCnt(int readCnt) {
		this.readCnt = readCnt;
	}
	@Override
	public String toString() {
		return "ShopDTO [productCd=" + productCd + ", productNm=" + productNm + ", writer=" + writer + ", price="
				+ price + ", discountRate=" + discountRate + ", stock=" + stock + ", sort=" + sort + ", deliveryMethod="
				+ deliveryMethod + ", deliveryPrice=" + deliveryPrice + ", content=" + content + ", point=" + point
				+ ", productFile=" + productFile + ", qnaCnt=" + qnaCnt + ", enrollDt=" + enrollDt + ", tag=" + tag
				+ ", readCnt=" + readCnt + "]";
	}
	
}
