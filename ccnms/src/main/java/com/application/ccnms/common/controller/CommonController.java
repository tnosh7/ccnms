package com.application.ccnms.common.controller;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.application.ccnms.common.service.CommonService;
import com.application.ccnms.digging.dto.DiggingDTO;
import com.application.ccnms.user.dto.UserDTO;

import net.coobird.thumbnailator.Thumbnails;

@Controller
public class CommonController {
	@Autowired
	private CommonService commonService;
	
//	private final String FILE_REPO_PATH = "C:\\ccnms_file_repo\\";
	private final String FILE_REPO_PATH = "/var/lib/tomcat9/file_repo/";
	
	
	@GetMapping("/")
	public ModelAndView home(@RequestParam(required =false, value="sort") String sort, HttpServletRequest request) throws Exception {
	
		ModelAndView mv = new ModelAndView();
		int onePageViewCnt = 10;
		if (request.getParameter("onePageViewCnt") != null) {
			onePageViewCnt = Integer.parseInt(request.getParameter("onePageViewCnt"));
		}

		String temp = request.getParameter("currentPageNumber");
		if (temp == null) {
			temp="1";
		}
		int currentPageNumber = Integer.parseInt(temp);

		int allDiggingCnt = commonService.getAllDiggingCnt();
		
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
		
		Map<String, Object> sortMap = new HashMap<String, Object>();
		sortMap.put("onePageViewCnt", onePageViewCnt);
		sortMap.put("startDiggingIdx", startDiggingIdx);
		sortMap.put("sort", sort);
		mv.addObject("diggingList", commonService.getDiggingList(sortMap));
		mv.addObject("sort", sort);
		
		mv.addObject("headList", commonService.getHeadList());
		mv.addObject("recentShopList", commonService.getRecentShopList());
		mv.addObject("populerShopList", commonService.getPopulerShopList());
		mv.addObject("exchangeShopList", commonService.getExchangeShopList());
		
		mv.setViewName("/common/main");
		return mv;
	}

	@GetMapping("/updateThumbsUp")
	public @ResponseBody String updateThumbsUp(@RequestParam("diggingId") String diggingId) throws Exception {
		commonService.upThumbsUp(Long.parseLong(diggingId));
		String data = Integer.toString(commonService.countThumbsUp(Long.parseLong(diggingId)));
		return data;
	}
	
	
	@GetMapping("/thumbnails")
	public void thumbnails(@RequestParam("file") String file, HttpServletResponse response) throws IOException {
		OutputStream out = response.getOutputStream();
		String filePath = FILE_REPO_PATH + file;
		
		File image = new File(filePath);
		if (image.exists()) { 
			Thumbnails.of(image).size(800,800).outputFormat("png").toOutputStream(out);
		}
		byte[] buffer = new byte[1024 * 8];
		out.write(buffer);
		out.close();
	}
	
	
	@GetMapping("/search")
	public ModelAndView search (@RequestParam("search") String search) throws Exception {
		ModelAndView mv = new ModelAndView("/search");
		mv.addObject("diggingList", commonService.getDiggingSearch(search));
		mv.addObject("shopList", commonService.getShopSearch(search));
		return mv;
		
	}
}
