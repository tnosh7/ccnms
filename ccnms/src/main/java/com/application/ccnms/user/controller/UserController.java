package com.application.ccnms.user.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.application.ccnms.user.dto.UserDTO;
import com.application.ccnms.user.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/register")
	public ModelAndView registerUser() {
		return new ModelAndView("/user/register");
	}
	
	@PostMapping("/register")
	public ResponseEntity<Object> register(HttpServletRequest request, UserDTO userDTO) {
		// DTO set 추가;
		
		userDTO.setUserId(request.getParameter("userID"));
		userDTO.setUserNm(request.getParameter("userNm"));
		userDTO.setBirthDT(request.getParameter("birthDT"));
		userDTO.setPasswd(request.getParameter("passwd"));
		userDTO.setZipcode(request.getParameter("zipcode"));
		userDTO.setRoadAddress(request.getParameter("roadAddress"));
		userDTO.setJibunAddress(request.getParameter("jibunAddress"));
		userDTO.setNamujiAddress(request.getParameter("namujiAddress"));
		userDTO.setSex(request.getParameter("sex"));
		userDTO.setHp(request.getParameter("hp"));
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
		System.out.println(userDTO);
		
		String jsScript = "<script>";
			   jsScript +="alert('성공')";
			   jsScript +="location.href='" + request.getContextPath() + "/'";
			   jsScript +="</script>";
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
	}
	@GetMapping("/loginUser")
	public ModelAndView loginMember() throws Exception {
		return new ModelAndView("/user/loginUser");
	}
	
	@PostMapping("/validateUser")
	public boolean validateUser(@RequestParam("userId") String userId) {
		return userService.checkValidateUser(userId);
	}
}
