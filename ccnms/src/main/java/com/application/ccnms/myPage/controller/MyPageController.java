package com.application.ccnms.myPage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.application.ccnms.myPage.service.MyPageService;
import com.application.ccnms.user.dto.UserDTO;

@Controller
@RequestMapping("/myPage")
public class MyPageController {
	
	private String FILE_REPO_PATH = "C:\\ccnms_file_repo\\";
	
	@Autowired
	private MyPageService myPageService;
	
	
	@GetMapping("/main")
	public ModelAndView myPage(HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession();
		ModelAndView mv= new ModelAndView();
		mv.setViewName("/myPage/main");
		mv.addObject("userDTO", myPageService.getUserDetail((String)session.getAttribute("userId")));
		
		return mv;
	}
	
	
	@GetMapping("/authenticationUser") 
	public ModelAndView authenticationUser(HttpServletRequest request, @RequestParam("menu") String menu) throws Exception {
		HttpSession session = request.getSession();
		ModelAndView mv= new ModelAndView();
		mv.setViewName("/myPage/authenticationUser");
		mv.addObject("userDTO", myPageService.getUserDetail((String)session.getAttribute("userId")));
		mv.addObject("menu", menu);
		return mv;
	}
	
	@PostMapping("/authenticationUser") 
	public @ResponseBody String authenticationUser(HttpServletRequest request, @RequestParam("menu")String menu, @ModelAttribute UserDTO userDTO) {
		
		if (myPageService.checkAuthenticationUser(userDTO)) {
			
			if(menu.equals("update")) {
				
			}
			else if (menu.equals("delete")) {
				
			}
		}
		else {
			
		}
		
		
	}
}