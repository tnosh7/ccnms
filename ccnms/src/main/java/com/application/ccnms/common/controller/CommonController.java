package com.application.ccnms.common.controller;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.application.ccnms.common.service.CommonService;
import com.application.ccnms.user.dto.UserDTO;

import net.coobird.thumbnailator.Thumbnails;

@Controller
public class CommonController {
	@Autowired
	private CommonService commonService;
	
	private final String FILE_REPO_PATH = "C:\\ccnms_file_repo\\";
	
	@GetMapping("/")
	public ModelAndView home(@RequestParam(required =false, value="sort") String sort,HttpServletRequest request) throws Exception {
	
		ModelAndView mv = new ModelAndView();
		int onePageViewCnt = 10;
		String temp = request.getParameter("currentPageNumber");
		if (temp == null) {
			temp="1";
		}
		int currentPageNumber = Integer.parseInt(temp);
		int allDiggingCnt = commonService.getAllDiggingCnt();
		int allPageCnt = allDiggingCnt / onePageViewCnt +1;
		if (allDiggingCnt % onePageViewCnt == 0) allPageCnt--;
		int startPage = (currentPageNumber -1)/ 5 * 5 +1;
		if (startPage == 0) {
			startPage = 1;
		}
		int endPage = startPage + 4;
		if (endPage >allPageCnt) endPage = allPageCnt;
		int startDiggingIdx = (currentPageNumber -1) * onePageViewCnt;
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("allDiggingCnt", allDiggingCnt);
		mv.addObject("allPageCnt", allPageCnt);
		mv.addObject("onePageViewCnt", onePageViewCnt);
		mv.addObject("currentPageNumber", currentPageNumber);
		mv.addObject("startDiggingIdx",startDiggingIdx);
		
		if (sort==null) {
			mv.addObject("diggingList", commonService.getDiggingList());
		}
		else {
			mv.addObject("diggingList", commonService.getDiggingList(sort));
		}
		mv.setViewName("/common/main");
		return mv;
	}
	@GetMapping("/sortDigging")
	public ModelAndView sortDigging(@RequestParam Map<String, Object> sortMap) throws Exception {
		ModelAndView mv= new ModelAndView();
		mv.setViewName("redirect:/");
		return mv;
	}

	@PostMapping("/thumbsUp")
	public ModelAndView thumbsUp(@RequestParam("diggingId") long diggingId) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("thumbsUp", commonService.upThumbsUp(diggingId));
		return mv;
		
	}
	@PostMapping("/userInfo")
	public List<UserDTO> userInfo(@RequestParam("writer")String writer) throws Exception {
		
		return commonService.getUserInfo(writer);
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
