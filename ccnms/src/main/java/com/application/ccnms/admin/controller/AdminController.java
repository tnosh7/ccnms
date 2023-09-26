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

	@Autowired
	private AdminService adminService;
	
	@GetMapping("/main") 
	public String main () {
		return "/admin/main";
	}
	
	@GetMapping("/loginAdmin")
	public ModelAndView loginAdmin() {
		return new ModelAndView("/admin/loginAdmin");
	}
	
	@PostMapping("/loginAdmin")
	public @ResponseBody String loginAdmin(HttpServletRequest request, AdminDTO adminDTO) { 
		String jsScript="";
		
		if(adminService.loginAdmin(adminDTO) != null) {
			HttpSession session = request.getSession();
			session.setAttribute("adminId", adminDTO.getAdminId());
			session.setAttribute("role", "admin");
			jsScript = "<script>";
		    jsScript +="alert('login');";
		    jsScript +="location.href='" + request.getContextPath() + "/admin/main'";
		    jsScript +="</script>";
		}
		else {
			jsScript = "<script>";
		    jsScript +="history.go(-1);";
		    jsScript +="</script>";
		}
		
		return jsScript;
	}
	
	@GetMapping("/logout") 
	public @ResponseBody String logout(HttpServletRequest request) {
		
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
	public @ResponseBody String registerAdmin(HttpServletRequest request, AdminDTO adminDTO) {
		System.out.println(adminDTO);
		adminService.addRegisterAdmin(adminDTO);
		HttpSession session = request.getSession();
		session.setAttribute("adminId", adminDTO.getAdminId());
		session.setAttribute("role", "admin");
		
		String jsScript = "<script>";
			   jsScript +="location.href='" + request.getContextPath() + "/admin/main'";
			   jsScript +="</script>";
	    
		return jsScript;
	}
	
	

}
