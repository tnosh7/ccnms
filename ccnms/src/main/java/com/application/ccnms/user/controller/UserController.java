package com.application.ccnms.user.controller;

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
	public ModelAndView registerUser() throws Exception {
		return new ModelAndView("/user/register");
	}
	
	@PostMapping("/register")
	public @ResponseBody String register(HttpServletRequest request, UserDTO userDTO) throws Exception {
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
		userService.addUser(userDTO);

		String jsScript = "<script>";
			   jsScript +="history.go(-1);";
			   jsScript +="</script>";
		
		return jsScript;
	}
	
	@PostMapping("/duplicateUserId")
	public @ResponseBody String duplicateUserId(@RequestParam("userId") String userId) throws Exception{
		System.out.println(userId);
		return userService.checkDuplicateUserId(userId);
	}
	
	
	@GetMapping("/loginUser")
	public ModelAndView loginMember() throws Exception {
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
		    jsScript +="location.href='" + request.getContextPath() + "/'";
		    jsScript +="</script>";
		}
		else {
			jsScript = "<script>";
			jsScript +="alert('X');";
		  	jsScript +="</script>";
		}
		return jsScript;
	}
	
	@GetMapping("/logout")
	public @ResponseBody String logout(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		session.invalidate();
		String jsScript = "<script>";
			   jsScript +="location.href='" + request.getContextPath() + "/'";
		       jsScript +="</script>";
	
		return jsScript;
	}
}
