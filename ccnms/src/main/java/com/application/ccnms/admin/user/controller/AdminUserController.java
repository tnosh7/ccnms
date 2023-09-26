package com.application.ccnms.admin.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.application.ccnms.admin.user.service.AdminUserService;

@Controller
@RequestMapping("/admin/management")
public class AdminUserController {

	@Autowired
	private AdminUserService adminUserService;
	
	@GetMapping("/user")
	public ModelAndView user() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/management/user");
		mv.addObject("userList", adminUserService.getUserList());
		return mv;
	}
	@GetMapping("/admin")
	public ModelAndView admin() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/management/admin");
		mv.addObject("adminList", adminUserService.getAdminList());
		return mv;
	}
}
