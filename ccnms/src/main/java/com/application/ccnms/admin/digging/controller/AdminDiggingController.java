package com.application.ccnms.admin.digging.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.application.ccnms.admin.digging.service.AdminDiggingService;

@Controller
@RequestMapping("/admin/digging")
public class AdminDiggingController {

	private AdminDiggingService adminDiggingService;
	
	@GetMapping("diggingAdd")
	public ModelAndView diggingAdd () {
		return new ModelAndView("/admin/digging/diggingAdd");
	}
}
