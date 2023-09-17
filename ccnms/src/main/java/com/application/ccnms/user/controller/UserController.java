package com.application.ccnms.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.application.ccnms.user.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
}
