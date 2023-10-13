package com.application.ccnms.user.contact.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.ccnms.user.contact.dao.UserContactDAO;

@Service
public class UserContactServiceImpl implements UserContactService {
	@Autowired
	private UserContactDAO userContactDAO; 
}
