package com.application.ccnms.digging.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class DiggingDTO {

	private long diggingId;
	private String writer;
	private String subject;
	private String content;
	private int readCnt;
	private String diggingTopic;
	private String dig;
	private String videoYn;
	private String videoId;
	private String file;
	private int replyCnt;
	private int thumbsUp;
	private Date enrollDT;
	public long getDiggingId() {
		return diggingId;
	}
	public void setDiggingId(long diggingId) {
		this.diggingId = diggingId;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
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
	public int getReadCnt() {
		return readCnt;
	}
	public void setReadCnt(int readCnt) {
		this.readCnt = readCnt;
	}
	public String getDiggingTopic() {
		return diggingTopic;
	}
	public void setDiggingTopic(String diggingTopic) {
		this.diggingTopic = diggingTopic;
	}
	public String getDig() {
		return dig;
	}
	public void setDig(String dig) {
		this.dig = dig;
	}
	public String getVideoYn() {
		return videoYn;
	}
	public void setVideoYn(String videoYn) {
		this.videoYn = videoYn;
	}
	public String getVideoId() {
		return videoId;
	}
	public void setVideoId(String videoId) {
		this.videoId = videoId;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public int getReplyCnt() {
		return replyCnt;
	}
	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}
	public int getThumbsUp() {
		return thumbsUp;
	}
	public void setThumbsUp(int thumbsUp) {
		this.thumbsUp = thumbsUp;
	}
	public Date getEnrollDT() {
		return enrollDT;
	}
	public void setEnrollDT(Date enrollDT) {
		this.enrollDT = enrollDT;
	}
	@Override
	public String toString() {
		return "DiggingDTO [diggingId=" + diggingId + ", writer=" + writer + ", subject=" + subject + ", content="
				+ content + ", readCnt=" + readCnt + ", diggingTopic=" + diggingTopic + ", dig=" + dig + ", videoYn="
				+ videoYn + ", videoId=" + videoId + ", file=" + file + ", replyCnt=" + replyCnt + ", thumbsUp="
				+ thumbsUp + ", enrollDT=" + enrollDT + "]";
	}
	
}