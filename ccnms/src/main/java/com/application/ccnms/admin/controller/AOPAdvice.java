package com.application.ccnms.admin.controller;

import java.text.SimpleDateFormat;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.application.ccnms.admin.service.AdminServiceImpl;
@Component
@Aspect
public class AOPAdvice {

	@Autowired
	private static Logger logger = LoggerFactory.getLogger(AdminServiceImpl.class);
	
	@AfterReturning("execution(* com.application.ccnms.user.service.UserServiceImpl.loginUser(..))")
	public void getInfo(JoinPoint jp) {
		Object[]temp =  jp.getArgs();
		long millis = System.currentTimeMillis();
		String time = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss").format(millis);
		logger.info("현재시간 : " + time);
		logger.info("유저 로그인 :" +  temp[1]);
		
	}
	@AfterReturning("execution(* com.application.ccnms.user.service.UserServiceImpl.userLogout(..))")
	public void getLogoutInfo(JoinPoint jp) {
		Object[]temp =  jp.getArgs();
		long millis = System.currentTimeMillis();
		String time = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss").format(millis);
		logger.info("현재시간 : " + time);
		logger.info("유저 로그아웃 : " + temp[0]);
	}
}
