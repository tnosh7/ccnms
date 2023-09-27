package com.application.ccnms.digging.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.ccnms.digging.dao.DiggingDAO;

@Service
public class DiggingServiceImpl implements DiggingService {
	
	@Autowired
	private DiggingDAO diggingDAO; 
}
