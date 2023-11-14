package com.application.ccnms.qna.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class QnaDTO {
	
	private long qnaCd;
	private String writer;
	private String content;
	private Date enrollDt;
	private String qnaYn;
	private String qnaReply;
	private long productCd;
	public long getQnaCd() {
		return qnaCd;
	}
	public void setQnaCd(long qnaCd) {
		this.qnaCd = qnaCd;
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
	public String getQnaYn() {
		return qnaYn;
	}
	public void setQnaYn(String qnaYn) {
		this.qnaYn = qnaYn;
	}
	public String getQnaReply() {
		return qnaReply;
	}
	public void setQnaReply(String qnaReply) {
		this.qnaReply = qnaReply;
	}
	public long getProductCd() {
		return productCd;
	}
	public void setProductCd(long productCd) {
		this.productCd = productCd;
	}
	@Override
	public String toString() {
		return "QnaDTO [qnaCd=" + qnaCd + ", writer=" + writer + ", content=" + content + ", enrollDt=" + enrollDt
				+ ", qnaYn=" + qnaYn + ", qnaReply=" + qnaReply + ", productCd=" + productCd + "]";
	}
	
}
