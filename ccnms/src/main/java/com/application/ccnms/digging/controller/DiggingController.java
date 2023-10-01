package com.application.ccnms.digging.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.application.ccnms.digging.dto.DiggingDTO;
import com.application.ccnms.digging.service.DiggingService;

@Controller
@RequestMapping("/digging")
public class DiggingController {
	@Autowired
	private DiggingService diggingService;
	
	private final String FILE_REPO_PATH = "C:\\ccnms_content_file_repo\\";
	
	@GetMapping("/main")
	public ModelAndView main(HttpServletRequest request)throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/digging/main");
		
		int onePageViewCnt = 10;
		if(request.getParameter("onePageViewCnt") != null ) {
			onePageViewCnt = Integer.parseInt(request.getParameter("onePageViewCnt"));
		}
		
		
		return mv;
	}
	
	@GetMapping("/ranking")
	public ModelAndView ranking()throws Exception {
		return new ModelAndView("/digging/ranking");
	}
	@GetMapping("/addDigging")
	public ModelAndView addDigging()throws Exception {
		return new ModelAndView("/digging/addDigging");
	}
	
	@PostMapping("/addDigging")
	public @ResponseBody String addDigging(HttpServletRequest request, MultipartHttpServletRequest multipartRequest) throws Exception{
		DiggingDTO diggingDTO = new DiggingDTO();
		HttpSession session = request.getSession();
		
		Iterator<String> fileList = multipartRequest.getFileNames();
		String fileName="";
		while(fileList.hasNext()) {
			MultipartFile uploadFile = multipartRequest.getFile(fileList.next()); // 하나의 <input type="file">를 반환한다.
			if (!uploadFile.getOriginalFilename().isEmpty()) {
				SimpleDateFormat fmt = new SimpleDateFormat("yyyyMMdd");
				fileName = fmt.format(new Date()) + "_" + UUID.randomUUID() + "_" + uploadFile.getOriginalFilename();
				uploadFile.transferTo(new File(FILE_REPO_PATH + fileName)); 
			}
		}
		diggingDTO.setDiggingTopic(request.getParameter("diggingTopic"));
		diggingDTO.setSubject(request.getParameter("subject"));
		diggingDTO.setWriter(String.valueOf(session.getAttribute("userId")));
		diggingDTO.setContent(request.getParameter("content"));
		diggingDTO.setFile(fileName);
		
		System.out.println(diggingDTO);
		diggingService.addDigging(diggingDTO);
		
		String jsScript ="<script>";
			   jsScript +="location.href='" + request.getContextPath() + "/'";
			   jsScript +="</script>";
		return jsScript;
	}
	
	
}		
