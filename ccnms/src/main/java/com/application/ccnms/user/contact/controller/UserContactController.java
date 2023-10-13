package com.application.ccnms.user.contact.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.application.ccnms.user.contact.service.UserContactService;

@Controller
@RequestMapping("/contact")
public class UserContactController {

	@Autowired
	private UserContactService userContactService;
	
	@GetMapping("/user")
	public ModelAndView userContact() {
		return new ModelAndView("/contact/user");
	}
	
}
