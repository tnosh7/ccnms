package com.application.ccnms.user.service;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	@Transactional
	public boolean addUser(UserDTO userDTO) throws Exception{
		userDTO.setPasswd(bCryptPasswordEncoder.encode(userDTO.getPasswd()));
		userDAO.insertUser(userDTO);
		return true;
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

	public void getEmailCheck(String email, String userId) throws Exception {
		
		ranNumber();
		String setFrom = "modudig@gmail.com";
		String toEmail = email;
		String subject = "모두디깅의 회원가입 인증 메시지입니다.";
		String content = "<h4>인증번호는 " + emailAuthentication + "입니다.</h4>";
			   content += "<br>";
			   content += "해당 인증번호를 로그인 후에 인증번호 확인란에 입력해주세요.";
		MailHandler mailHandler = new MailHandler(mailSender);	  
        mailHandler.setFrom(setFrom);
	    mailHandler.setSubject(subject);
	    mailHandler.setText(content,true);
	    mailHandler.setTo(toEmail);
	    mailHandler.send();
	    System.out.println("============================");
	    System.out.println(Integer.toString(emailAuthentication));
	    System.out.println("============================");
	    Map<String,Object> emailMap = new HashMap<String,Object>();
	    emailMap.put("userId", userId);
	    emailMap.put("emailAuthentication", Integer.toString(emailAuthentication));
	    System.out.println("=============");
	    System.out.println("emailMAp: " + emailMap );
	    System.out.println("=============");
	    userDAO.updateEmailCheck(emailMap);
	}

	@Override
	public int getMyOrderCnt(String userId) throws Exception {
		return userDAO.selectOneMyOrderCnt(userId);
	}
	
	@Override
	public int getMyCartCnt(String userId) throws Exception {
		return userDAO.selectOneMyCartCnt(userId);
	}

	@Override
	public boolean getEmailIdentify(String userId) throws Exception {
		if (!userDAO.selectOneEmailIdentify(userId)) return false;
		else return true;
	}

	@Override
	public boolean emailAuthentication(UserDTO userDTO) throws Exception {
		if (!userDAO.selectOneEmailAuthentication(userDTO)) return false;
		else return true;
	}


	
	



}
