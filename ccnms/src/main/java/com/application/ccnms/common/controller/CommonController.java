package com.application.ccnms.common.controller;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.application.ccnms.common.service.CommonService;

import net.coobird.thumbnailator.Thumbnails;

@Controller
public class CommonController {
	@Autowired
	private CommonService commonService;
	
	private final String FILE_REPO_PATH = "C:\\ccnms_file_repo\\";
	
	@GetMapping("/")
	public ModelAndView home() throws Exception {
	
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("diggingList", commonService.getDiggingList());
		mv.addObject("thumbsUpList", commonService.getThumbsUpList());
		mv.addObject("recentList", commonService.getRecentList());
		
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
	@PostMapping("/thumbsUp")
	public ModelAndView thumbsUp(@RequestParam("diggingId") long diggingId) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("thumbsUp", commonService.upThumbsUp(diggingId));
		return mv;
		
	}
	@GetMapping("/sortDigging")
	public ModelAndView sortDigging(@RequestParam("sort") String sort) {
		ModelAndView mv= new ModelAndView();
		
		mv.setViewName("redirect://common");
		return mv;
	}
	
	
	@GetMapping("/thumbnails")
	public void thumbnails(@RequestParam("file") String file, HttpServletResponse response) throws IOException {
		OutputStream out = response.getOutputStream();
		File image= new File(FILE_REPO_PATH + file);
		if (image.exists()) {
			Thumbnails.of(image).size(1000,1000).outputFormat("png").toOutputStream(out);
		}
		byte[] buffer = new byte[1024*8];
		out.write(buffer);
		out.close();
	}
	
}
