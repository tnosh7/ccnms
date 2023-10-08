package com.application.ccnms.reply.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class ReplyDTO {

	private long replyId;
	private String writer;
	private String content;
	private Date enrollDT;
	private long diggingId;
	private int ThumbsUp;
	public long getReplyId() {
		return replyId;
	}
	public void setReplyId(long replyId) {
		this.replyId = replyId;
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
	public Date getEnrollDT() {
		return enrollDT;
	}
	public void setEnrollDT(Date enrollDT) {
		this.enrollDT = enrollDT;
	}
	public long getDiggingId() {
		return diggingId;
	}
	public void setDiggingId(long diggingId) {
		this.diggingId = diggingId;
	}
	public int getThumbsUp() {
		return ThumbsUp;
	}
	public void setThumbsUp(int thumbsUp) {
		ThumbsUp = thumbsUp;
	}
	@Override
	public String toString() {
		return "ReplyDTO [replyId=" + replyId + ", writer=" + writer + ", content=" + content + ", enrollDT=" + enrollDT
				+ ", diggingId=" + diggingId + ", ThumbsUp=" + ThumbsUp + "]";
	}
	
}
