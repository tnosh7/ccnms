package com.application.ccnms.admin.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.application.ccnms.admin.dto.AdminDTO;
import com.application.ccnms.admin.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	private AdminService adminService;
	
	@Autowired
	public AdminController(AdminService adminService) {
		this.adminService = adminService;
	}

	@GetMapping("/main") 
	public ModelAndView main () throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.addObject("todayDigging", adminService.getDiggingCnt());
		mv.addObject("todayUser", adminService.getUserCnt());
		mv.addObject("todayShop", adminService.getShopCnt());
		mv.addObject("todaySale", adminService.getSaleCnt());
		mv.addObject("userStaticList", adminService.getUserStaticList());
		mv.addObject("noticeList", adminService.getNoticeList());
		if ( adminService.getMonthOrder()==null) {
			mv.addObject("monthOrder", 0);
		}
		else {
			mv.addObject("monthOrder", adminService.getMonthOrder());
		}
		mv.setViewName("/admin/main");
		return mv;
	}
	
	@GetMapping("/loginAdmin")
	public ModelAndView loginAdmin() throws Exception {
		return new ModelAndView("/admin/loginAdmin");
	}
	
	@PostMapping("/loginAdmin")
	public ModelAndView loginAdmin(HttpServletRequest request, AdminDTO adminDTO) throws Exception { 
		ModelAndView mv = new ModelAndView();
		if(adminService.loginAdmin(adminDTO) == true) {
			HttpSession session = request.getSession();
			session.setAttribute("adminId", adminDTO.getAdminId());
			session.setAttribute("role", "admin");
			mv.setViewName("redirect:/admin/main");
		}
		else {
			mv.setViewName("/admin/loginAdmin");
			mv.addObject("menu", "miss");
		}
		return mv;
	}
	
	@GetMapping("/logout") 
	public @ResponseBody String logout(HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		String jsScript = "<script>";
			   jsScript +="location.href='" + request.getContextPath() + "/admin/main'";
		       jsScript +="</script>";
		return jsScript;
	}
	
	@GetMapping("/registerAdmin")
	public ModelAndView registerAdmin() {
		return new ModelAndView("/admin/registerAdmin");
	}
	
	@PostMapping("/registerAdmin")
	public ModelAndView registerAdmin(HttpServletRequest request, AdminDTO adminDTO) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		if (adminService.authenticationAdmin(adminDTO.getAdminId())) {
			mv.setViewName("/admin/registerAdmin");
		}
		else {
			adminService.addRegisterAdmin(adminDTO);
			HttpSession session = request.getSession();
			session.setAttribute("adminId", adminDTO.getAdminId());
			session.setAttribute("role", "admin");
			mv.setViewName("/admin/loginAdmin");
		}
		return mv;
	}
	
	
	
}
