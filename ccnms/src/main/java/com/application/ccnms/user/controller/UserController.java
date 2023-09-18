package com.application.ccnms.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.application.ccnms.user.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/checkDuplicateId") 
	public ResponseEntity<String> checkDuplicateId(@RequestParam("userId") String userId) {
		return new  ResponseEntity<String>(userService.getCheckDuplicateId(userId), HttpStatus.OK);
	}
	
}
