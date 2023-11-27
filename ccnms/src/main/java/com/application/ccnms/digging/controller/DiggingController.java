package com.application.ccnms.digging.controller;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.application.ccnms.digging.dto.DiggingDTO;
import com.application.ccnms.digging.service.DiggingService;

import net.coobird.thumbnailator.Thumbnails;

@Controller
@RequestMapping("/digging")
public class DiggingController {
	@Autowired
	private DiggingService diggingService;
	
//	private final String FILE_REPO_PATH = "C:\\ccnms_file_repo\\";
	private final String FILE_REPO_PATH = "/var/lib/tomcat9/file_repo/";
	
	@GetMapping("/main")
	public ModelAndView main(HttpServletRequest request,@RequestParam("diggingTopic") String diggingTopic, 
							@RequestParam(required =false, value="sort") String sort, 
							@RequestParam(required=false,value="dig") String dig) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/digging/main");
		int onePageViewCnt = 10;
		if (request.getParameter("onePageViewCnt") != null) {
			onePageViewCnt = Integer.parseInt(request.getParameter("onePageViewCnt"));
		}

		String temp = request.getParameter("currentPageNumber");
		if (temp == null) {
			temp="1";
		}
		int currentPageNumber = Integer.parseInt(temp);

		int allDiggingCnt = diggingService.getAllDiggingCnt(diggingTopic);
		
		int allPageCnt = allDiggingCnt / onePageViewCnt + 1;
		if (allDiggingCnt % allPageCnt == 0) {
			allPageCnt--;
		}
		
		int startPage = (currentPageNumber - 1) / 10 * 10 + 1;
		if (startPage == 0) {
			startPage = 1;
		}
		int endPage = startPage + 9;
		if (endPage > allPageCnt) endPage = allPageCnt;
		
		int startDiggingIdx = (currentPageNumber -1) * onePageViewCnt;

		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("allDiggingCnt", allDiggingCnt);
		mv.addObject("allPageCnt", allPageCnt);
		mv.addObject("onePageViewCnt", onePageViewCnt);
		mv.addObject("currentPageNumber", currentPageNumber);
		mv.addObject("startDiggingIdx",startDiggingIdx);
		
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("onePageViewCnt", onePageViewCnt);
		searchMap.put("startDiggingIdx", startDiggingIdx);
		searchMap.put("sort", sort);
		searchMap.put("diggingTopic", diggingTopic);
		if (dig != null) {
			searchMap.put("dig", dig);
		}
		else {
			searchMap.put("dig", "");
		}
		mv.addObject("diggingList", diggingService.getDiggingList(searchMap));
		mv.addObject("populerList", diggingService.getPopulerList(searchMap));
		mv.addObject("diggingTopic", diggingTopic);
		mv.addObject("digList",diggingService.getDigList(diggingTopic));
		return mv;
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
			MultipartFile uploadFile = multipartRequest.getFile(fileList.next()); 
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
		System.out.println(request.getParameter("diggingTopic"));
		
		String dig= request.getParameter("diggingTopic");
		diggingDTO.setDig(request.getParameter(dig));
		String content = request.getParameter("content");
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
		diggingDTO.setFile(fileName);
		diggingService.addDigging(diggingDTO);
		
		String jsScript ="<script>";
			   jsScript +="location.href='" + request.getContextPath() + "/'";
			   jsScript +="</script>";
		return jsScript;
	}
	@GetMapping("diggingDetail") 
	public ModelAndView diggingDetail(@RequestParam("diggingId") long diggingId) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/digging/diggingDetail");
		System.out.println(diggingId);
		mv.addObject("diggingDTO", diggingService.getDiggingDetail(diggingId));
		mv.addObject("allReplyCnt", diggingService.getallReplyCnt(diggingId));
		mv.addObject("replyList", diggingService.getReplyList(diggingId));
		return mv;
	}
	@PostMapping("/thumbsUp")
	public int thumbsUp(@RequestParam("diggingId") long diggingId) throws Exception {
		return diggingService.upThumbsUp(diggingId);
		
	}
	
	@GetMapping("/modifyDigging")
	public ModelAndView modify(@RequestParam("diggingId")long diggingId)throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.addObject("diggingDTO", diggingService.getDiggingDetail(diggingId));
		mv.setViewName("/digging/modifyDigging");
		
		return mv;
	}
	@PostMapping("/modifyDigging")
	public @ResponseBody String modifyDigging (DiggingDTO diggingDTO, MultipartHttpServletRequest multipartRequest, HttpServletRequest request) throws Exception{
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
		diggingDTO.setFile(fileName);
		diggingService.updateDigging(diggingDTO); 
		String jsScript="<script>";
			   jsScript+="history.go(-2)";
			   jsScript+="</script>";
		return jsScript;
	}
	
	
}		
