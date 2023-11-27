package com.application.ccnms.myPage.controller;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import com.application.ccnms.digging.dto.DiggingDTO;
import com.application.ccnms.myPage.service.MyPageService;
import com.application.ccnms.user.dto.UserDTO;
import com.application.ccnms.user.service.UserService;

import net.coobird.thumbnailator.Thumbnails;

@Controller
@RequestMapping("/myPage")
public class MyPageController {
	
	private final String FILE_REPO_PATH = "C:\\ccnms_file_repo\\";
//	private final String FILE_REPO_PATH = "/var/lib/tomcat9/file_repo/";
	
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
	public ModelAndView authenticationUser(HttpServletRequest request, @RequestParam("menu")String menu, @ModelAttribute UserDTO userDTO) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		if (myPageService.checkAuthenticationUser(userDTO)) {
			HttpSession session = request.getSession();
			session.setAttribute("userId", userDTO.getUserId());
			session.setAttribute("role", "user");

			if(menu.equals("update")) {
				mv.setViewName("/myPage/modifyMyPage");
			}
			else if (menu.equals("delete")) {
				myPageService.removeUser(userDTO);
				session.invalidate();
				mv.setViewName("redirect:/");
			}
		}
		else {
			mv.setViewName("/myPage/main");
		}
		return mv;
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
			   jsScript +="location.href='" + request.getContextPath() + "/myPage/main'" ;
			   jsScript +="</script>";
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
	}
	
	@GetMapping("/myLog") 
	public ModelAndView myLog (HttpServletRequest request, @RequestParam("userId") String userId) throws Exception {
		ModelAndView mv= new ModelAndView("/myPage/myLog");
		HttpSession session = request.getSession();
		session.setAttribute("userId", userId);
		mv.addObject("diggingList", myPageService.getDiggingList(userId));
		mv.addObject("replyList", myPageService.getReplyList(userId));
		
		return mv;
	}
	
	@GetMapping("/myContact")
	public ModelAndView myContact (HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/myPage/myContact");
		HttpSession session = request.getSession();
		mv.addObject("myContactList", myPageService.getMyContactList((String)session.getAttribute("userId")));
		
		return mv;
	}
	
	@GetMapping("/removeDigging")
	public ResponseEntity<Object> removeDigging(@RequestParam("diggingIdList") String diggingIdList, HttpServletRequest request) throws Exception {
		
		String[] temp = diggingIdList.split(",");
		int[] delDiggingIdList = new int[temp.length];
		for (int i = 0; i < temp.length; i++) {
			delDiggingIdList[i] = Integer.parseInt(temp[i]);
		}
		myPageService.removeDigging(delDiggingIdList);
		
		String jsScript ="<script>";
			   jsScript +="location.href='" + request.getContextPath() + "/myPage/main'"; 
			   jsScript +="</script>";
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
	}

	@GetMapping("/removeReply")
	public ResponseEntity<Object> removeReply(@RequestParam("replyIdList") String replyIdList, HttpServletRequest request) throws Exception {
		
		String[] temp = replyIdList.split(",");
		int[] delReplyIdList = new int[temp.length];
		for (int i = 0; i < temp.length; i++) {
			delReplyIdList [i] = Integer.parseInt(temp[i]);
		}
		myPageService.removeReply(delReplyIdList);
		
		String jsScript ="<script>";
			   jsScript +="location.href='" + request.getContextPath() + "/myPage/main'"; 
			   jsScript +="</script>";
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
	}
}