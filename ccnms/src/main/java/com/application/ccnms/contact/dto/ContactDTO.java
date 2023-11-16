package com.application.ccnms.contact.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class ContactDTO {
	
	private int contactCd;
	private String userId;
	private String subject;
	private String content;
	private String reply;
	private String replyYN;
	private Date regDt ;
	private String category;
	public int getContactCd() {
		return contactCd;
	}
	public void setContactCd(int contactCd) {
		this.contactCd = contactCd;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public String getReplyYN() {
		return replyYN;
	}
	public void setReplyYN(String replyYN) {
		this.replyYN = replyYN;
	}
	public Date getRegDt() {
		return regDt;
	}
	public void setRegDt(Date regDt) {
		this.regDt = regDt;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	@Override
	public String toString() {
		return "ContactDTO [contactCd=" + contactCd + ", userId=" + userId + ", subject=" + subject + ", content="
				+ content + ", reply=" + reply + ", replyYN=" + replyYN + ", regDt=" + regDt + ", category=" + category
				+ "]";
	}
	
	
}
