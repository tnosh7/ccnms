package com.application.ccnms.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CommonController {
	
	@GetMapping("/")
	public ModelAndView home() {
		return new ModelAndView("/common/main");
	}
	
	@GetMapping("/blog") 
	public ModelAndView blog() {
		return new ModelAndView("/common/blog");
	}
	@GetMapping("/register") 
	public ModelAndView register() {
		return new ModelAndView("/common/register");
	}
	@GetMapping("/login") 
	public ModelAndView login() {
		return new ModelAndView("/common/login");
	}
}
