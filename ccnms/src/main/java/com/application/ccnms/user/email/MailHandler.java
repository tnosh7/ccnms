package com.application.ccnms.user.email;

import java.io.UnsupportedEncodingException;

import javax.activation.DataSource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class MailHandler {
	private JavaMailSender mailSender;
	private MimeMessage message;
	private MimeMessageHelper messageHelper;
	
	public MailHandler(JavaMailSender mailSender) throws MessagingException {
		this.mailSender = mailSender;
		message = this.mailSender.createMimeMessage();
		messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		
	}
	public void setSubject(String subject) throws MessagingException {
		messageHelper.setSubject(subject);
	}
	public void setText(String content, boolean tt) throws MessagingException {
		messageHelper.setText(content, true);
	}
	public void setFrom(String email) throws MessagingException, UnsupportedEncodingException {
		messageHelper.setFrom(email);
	}
	public void setTo(String email) throws MessagingException {
		messageHelper.setTo(email);
	}
	public void addInline(String contentId, DataSource dataSource) throws MessagingException {
		messageHelper.addInline(contentId, dataSource);
	}
	public void send() {
		try {
			mailSender.send(message);
		} catch(Exception e) {e.printStackTrace();}
	}
}
