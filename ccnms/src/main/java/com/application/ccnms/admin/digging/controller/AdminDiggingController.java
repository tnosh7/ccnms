package com.application.ccnms.admin.digging.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.application.ccnms.admin.digging.service.AdminDiggingService;
import com.application.ccnms.digging.dto.DiggingDTO;

@Controller
@RequestMapping("/admin/digging")
public class AdminDiggingController {
	
	@Autowired
	private AdminDiggingService adminDiggingService;

	private final String FILE_REPO_PATH = "C:\\ccnms_file_repo\\";
	
	@GetMapping("/diggingAdd")
	public ModelAndView diggingAdd () {
		return new ModelAndView("/admin/digging/diggingAdd");
	}
	
	@PostMapping("/diggingAdd")
	public @ResponseBody String diggingAdd(MultipartHttpServletRequest multipartRequest, HttpServletRequest request)throws Exception {
		HttpSession session = request.getSession();
		
		Iterator<String> fileList = multipartRequest.getFileNames();
		String fileName="";
		while(fileList.hasNext()) {
			MultipartFile uploadFile = multipartRequest.getFile(fileList.next()); 
			if (!uploadFile.getOriginalFilename().isEmpty()) {
				SimpleDateFormat fmt = new SimpleDateFormat("yyyyMMdd");
				fileName = fmt.format(new Date()) + "_" + UUID.randomUUID() + "_" + uploadFile.getOriginalFilename();
				uploadFile.transferTo(new File(FILE_REPO_PATH + fileName)); 
			}
		}
		DiggingDTO diggingDTO = new DiggingDTO();
		diggingDTO.setDiggingTopic(request.getParameter("diggingTopic"));
		diggingDTO.setSubject(request.getParameter("subject"));
		diggingDTO.setContent(request.getParameter("content"));
		
		String content = request.getParameter("content");
		int idx=  content.indexOf("/embed/");
		if (idx != 0) {
			int idx2 = content.indexOf("></oembed>");
			String url = content.substring(idx+7, idx2-1);	
			diggingDTO.setVideoYn("Y");
			diggingDTO.setVideoId(url);
		}
		else {
			diggingDTO.setVideoYn("N");
			diggingDTO.setVideoId("");
		}
			
		diggingDTO.setWriter("ModuDigging");
		diggingDTO.setFile(fileName);
		diggingDTO.setEnrollDT(new Date());
		adminDiggingService.addDigging(diggingDTO);
		String jsScript ="<script>";
			   jsScript +="location.href='" + request.getContextPath() + "/'";
			   jsScript +="</script>";
		return jsScript;
	}
	
	@GetMapping("/diggingManagement")
	public ModelAndView diggingManagement (@RequestParam(required =false, value="searchWord")String searchWord, @RequestParam(required =false, value="searchKey")String searchKey) throws Exception{
		ModelAndView mv= new ModelAndView();
		if (searchWord == null) {
			mv.addObject("diggingList", adminDiggingService.getDiggingList());
		}
		else {
			Map<String,Object> searchMap= new HashMap<String, Object>();
			searchMap.put("searchWord", searchWord);
			searchMap.put("searchKey", searchKey);
			mv.addObject("diggingList", adminDiggingService.getSearchDiggingList(searchMap));
		}
		mv.setViewName("/admin/digging/diggingManagement");
		return mv;
	}
	
	@GetMapping("/removeDigging")
	public ModelAndView removeDigging (@RequestParam("removeDiggingList") String removeDiggingList) throws Exception  {
		String [] temp =  removeDiggingList.split(",");
		int [] removeDiggingIdList= new int[temp.length];
		for (int i = 0; i < temp.length; i++) {
			removeDiggingIdList[i] = Integer.parseInt(temp[i]);
		}
		adminDiggingService.removeDiggingList(removeDiggingIdList);
		return new ModelAndView("redirect:/admin/digging/diggingManagement");
		
	}
	
}
