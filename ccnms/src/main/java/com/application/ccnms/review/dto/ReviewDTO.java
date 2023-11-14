package com.application.ccnms.review.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class ReviewDTO {
	
	private long reviewCd;
	private String writer;
	private String content;
	private Date enrollDt;
	private int star;
	private long productCd;
	
	public long getReviewCd() {
		return reviewCd;
	}
	public void setReviewCd(long reviewCd) {
		this.reviewCd = reviewCd;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getEnrollDt() {
		return enrollDt;
	}
	public void setEnrollDt(Date enrollDt) {
		this.enrollDt = enrollDt;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public long getProductCd() {
		return productCd;
	}
	public void setProductCd(long productCd) {
		this.productCd = productCd;
	}
	@Override
	public String toString() {
		return "ReviewDTO [reviewCd=" + reviewCd + ", writer=" + writer + ", content=" + content + ", enrollDt="
				+ enrollDt + ", star=" + star + ", productCd=" + productCd + "]";
	}
	
}
