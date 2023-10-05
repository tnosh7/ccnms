package com.application.ccnms.common.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.application.ccnms.common.service.CommonService;

@Controller
public class CommonController {
	@Autowired
	private CommonService commonService;
	
	@GetMapping("/")
	public ModelAndView home() throws Exception {
	
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/common/main");
		
		/*
		 * Map<String, String> diggingList = new HashMap<String, String>();
		 * diggingList.put("sort", "all");
		 * 
		 * mv.addObject("newDiggingCnt", commonService.getNewDiggingCnt());
		 * mv.addObject("allDiggingCnt", commonService.getAllDiggingCnt());
		 * mv.addObject("replyCnt", commonService.getReplyCnt());
		 * mv.addObject("thumbsUpCnt", commonService.getThumbsUpCnt()); ///상점 정렬 Cnt
		 * 추가할것
		 */		
		return mv;
	}
	
}
