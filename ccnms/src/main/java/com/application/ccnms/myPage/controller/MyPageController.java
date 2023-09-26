package com.application.ccnms.myPage.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.application.ccnms.myPage.service.MyPageService;
import com.application.ccnms.user.dto.UserDTO;
import com.application.ccnms.user.service.UserService;

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
	public @ResponseBody String authenticationUser(HttpServletRequest request, @RequestParam("menu")String menu, @ModelAttribute UserDTO userDTO) throws Exception {
		String jsScript="";
		if (myPageService.checkAuthenticationUser(userDTO)) {
			HttpSession session = request.getSession();
			session.setAttribute("userId", userDTO.getUserId());
			session.setAttribute("role", "user");

			if(menu.equals("update")) {
				jsScript = "<script>";
				jsScript+= "location.href='" + request.getContextPath() + "/myPage/modifyMyPage'";	
				jsScript+="</script>";
			}
			else if (menu.equals("delete")) {
				jsScript = "<script>";
				jsScript+= "location.href='" + request.getContextPath() + "/myPage/main'";	
				jsScript+="</script>";
			}
		}
		else {
			jsScript = "<script>";
			jsScript+= "history.go(-1);";
			jsScript+="</script>";
		}
		return jsScript;
	}
	
	@GetMapping("/modifyMyPage") 
	public ModelAndView modifyMyPage(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		ModelAndView mv= new ModelAndView();
		mv.setViewName("/myPage/modifyMyPage");
		mv.addObject("userDTO", myPageService.getUserDetail((String)session.getAttribute("userId")));
		mv.addObject("role", "user");
		return mv;
	}
	
	@PostMapping("modifyMyPage") 
	public ResponseEntity<Object> modifyMyPage(HttpServletRequest request, MultipartHttpServletRequest multipartRequest ) throws Exception {
		
		Iterator<String> fileList = multipartRequest.getFileNames();
		String fileName= "";
		if (fileList.hasNext()) {
			MultipartFile uploadFile = multipartRequest.getFile(fileList.next());
			if(!uploadFile.getOriginalFilename().isEmpty()) {
				SimpleDateFormat fmt = new SimpleDateFormat("yyyymmdd");
				fileName= fmt.format(new Date()) + "_" + UUID.randomUUID() + "_" + uploadFile.getOriginalFilename();
				uploadFile.transferTo(new File(FILE_REPO_PATH+fileName));
				new File(FILE_REPO_PATH + multipartRequest.getParameter("beforeFileName")).delete();
			}
		}
		UserDTO userDTO = new UserDTO();
		userDTO.setUserId(multipartRequest.getParameter("userId"));
		userDTO.setUserNm(multipartRequest.getParameter("userNm"));
		userDTO.setEmail(multipartRequest.getParameter("email"));
		userDTO.setBirthDT(multipartRequest.getParameter("birthDT"));
		userDTO.setHp(multipartRequest.getParameter("hp"));
		userDTO.setZipcode(multipartRequest.getParameter("zipcode"));
		userDTO.setRoadAddress(multipartRequest.getParameter("roadAddress"));
		userDTO.setJibunAddress(multipartRequest.getParameter("jibunAddress"));
		userDTO.setNamujiAddress(multipartRequest.getParameter("namujiAddress"));
		userDTO.setProfile(fileName);
		myPageService.getModify(userDTO);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		String jsScript ="<script>";
				jsScript +="alert('OK');";
			   jsScript +="</script>";
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
	}
}
