package com.application.ccnms.user.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.application.ccnms.user.dto.UserDTO;
import com.application.ccnms.user.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/register")
	public ModelAndView registerUser()  {
		return new ModelAndView("/user/register");
	}
	
	@PostMapping("/register")
	public @ResponseBody String register(HttpServletRequest request, UserDTO userDTO) {
		//email동의 
		String emailYN = request.getParameter("emailYN");
		if (emailYN == null) {
			emailYN = "N";
		}
		else emailYN = "Y";
		userDTO.setEmailYN(emailYN);
		
		//email도메인 email값에 추가
		String emailDomain = request.getParameter("emailDomain");
		String email = request.getParameter("email");
		if (emailDomain != "") {
			email += emailDomain;
		}
		userDTO.setEmail(email);
		
		String jsScript = "<script>";
			   jsScript +="alert('wow');";
			   jsScript +="history.go(-1);";
			   jsScript +="</script>";
		
		//체크용
		//System.out.println(userDTO);	   
		return jsScript;
	}
	@GetMapping("/loginUser")
	public ModelAndView loginMember() {
		return new ModelAndView("/user/loginUser");
	}
	
	@PostMapping("/loginUser")
	public @ResponseBody String loginUser(HttpServletRequest request, UserDTO userDTO) throws Exception {
		String jsScript = "";
		if(userService.loginUser(userDTO) != null) {
			HttpSession session = request.getSession();
			session.setAttribute("userId", userDTO.getUserId());
			session.setAttribute("role", "user");
			
		    jsScript = "<script>";
		    jsScript +="alert('login');";
		    jsScript +="location.href='" + request.getContextPath() + "/'";
		    jsScript +="</script>";
		}
		else {
			jsScript = "<script>";
			jsScript +="alert('X');";
			jsScript +="history.go(-1);";
		  	jsScript +="</script>";
		}
		return jsScript;
	}
}
