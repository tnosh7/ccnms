package com.application.ccnms.admin.digging.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
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
import com.application.ccnms.digging.dto.SubTitleDTO;
import com.application.ccnms.digging.service.DiggingService;

@Controller
@RequestMapping("/admin/digging")
public class AdminDiggingController {
	
	private AdminDiggingService adminDiggingService;
	private DiggingService diggingService;
	
	//private final String FILE_REPO_PATH = "C:\\ccnms_file_repo\\";
	private final String FILE_REPO_PATH = "/var/lib/tomcat9/file_repo";

	@Autowired
	public AdminDiggingController(AdminDiggingService adminDiggingService, DiggingService diggingService) {
		this.adminDiggingService = adminDiggingService;
		this.diggingService = diggingService;
	}
	// 게시글 작성
	@GetMapping("/diggingAdd")
	public ModelAndView diggingAdd () throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("mainTitleDTO", adminDiggingService.getMainTitle());
		mv.addObject("subTitleDTO", adminDiggingService.getSubTitle());
		mv.setViewName("/admin/digging/diggingAdd");
		return mv;
	}
	
	// 서브 타이틀 
	@ResponseBody
	@GetMapping("/subTitles")
	public List<SubTitleDTO> subTitles(int mainId) throws NumberFormatException, Exception {
		List<SubTitleDTO> subTitles = adminDiggingService.getSubTitle(mainId);
		return subTitles;
	}
	
	// 게시글 등록
	@PostMapping("/diggingAdd")
	public @ResponseBody String diggingAdd(MultipartHttpServletRequest multipartRequest, HttpServletRequest request,@RequestParam int mainId)throws Exception {
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
		diggingDTO.setSubject(request.getParameter("subject"));
		diggingDTO.setContent(request.getParameter("content"));
		String content = request.getParameter("content");
		int subId = Integer.parseInt(request.getParameter(("subId")));
		diggingDTO.setSubTitleId(subId);
	//	int mainId = Integer.parseInt(request.getParameter(("mainId")));
		diggingDTO.setMainTitleId(mainId);
		System.out.println("-============================");
		System.out.println("subId : " + Integer.parseInt(request.getParameter(("subId"))));
		System.out.println("mainId : " + mainId);
		System.out.println("-============================");
		
		
		// 미디어 url 추출
		int idx=  content.indexOf("/embed/");
		if (idx >= 0) {
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
		String dig= request.getParameter("diggingTopic");
		diggingDTO.setFile(fileName);
		diggingDTO.setEnrollDT(new Date());
		adminDiggingService.addDigging(diggingDTO);
		
		String jsScript ="<script>";
			   jsScript +="location.href='" + request.getContextPath() + "/'";
			   jsScript +="</script>";
		return jsScript;
	}
	
	// 게시글 조회
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
	
	// 게시글 삭제
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
