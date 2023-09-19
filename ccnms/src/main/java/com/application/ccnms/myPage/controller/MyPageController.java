package com.application.ccnms.myPage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.application.ccnms.myPage.service.MyPageService;

@Controller
@RequestMapping("/myPage")
public class MyPageController {
	
	@Autowired
	private MyPageService myPageService;
	
	@GetMapping("/main")
	public ModelAndView myPage() {
		return new ModelAndView("/myPage/main");
	}
	
}
