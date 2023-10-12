package com.application.ccnms.user.service;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.application.ccnms.user.dao.UserDAO;
import com.application.ccnms.user.dto.UserDTO;
import com.application.ccnms.user.email.MailHandler;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	@Autowired
	private JavaMailSender mailSender; 
	private int emailAuthentication; 
	
	public void ranNumber() {
		Random ran = new Random();
		int temp = ran.nextInt(888888) + 111111;
		emailAuthentication = temp;
	}
	
	@Override
	public void addUser(UserDTO userDTO) throws Exception{
		userDTO.setPasswd(bCryptPasswordEncoder.encode(userDTO.getPasswd()));
		userDAO.insertUser(userDTO);
		
	}

	@Override
	public UserDTO loginUser(UserDTO userDTO) throws Exception {
		UserDTO dbUserDTO = userDAO.selectOneLoginUser(userDTO) ;
		if (dbUserDTO != null) {
			if (bCryptPasswordEncoder.matches(userDTO.getPasswd(), dbUserDTO.getPasswd())) {
				return userDTO;
			}
		}
		return null;
	}
	

	@Override
	public String checkDuplicateUserId(String userId) throws Exception {
		String duplicateUserId = "Y";
		if (userDAO.selectOneDuplicateUserId(userId) == null) {
			duplicateUserId = "N";
		}
		return duplicateUserId;
	}

	@Override
	public String getEmailCheck(String email) throws Exception {
		
		ranNumber();
		String setFrom = "modudig@gmail.com";
		String toEmail = email;
		System.out.println("띄어쓰기 뭐임?" + toEmail);
		String subject = "모두디깅의 회원가입 인증 메시지입니다.";
		String content = "<h4>인증번호는 " + emailAuthentication + "입니다.</h4>";
			   content += "<br>";
			   content += "해당 인증번호를 인증번호 확인란에 입력해주세요.";
		MailHandler mailHandler = new MailHandler(mailSender);	  
       mailHandler.setFrom(setFrom);
	   mailHandler.setSubject(subject);
	   mailHandler.setText(content);
	   mailHandler.setTo(toEmail);
	   mailHandler.send();
		return Integer.toString(emailAuthentication);
	}

	
	



}
