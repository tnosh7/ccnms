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
import com.application.ccnms.shop.dto.ShopDTO;
import com.application.ccnms.user.dto.UserDTO;

import net.coobird.thumbnailator.Thumbnails;

@Controller
public class CommonController {
	@Autowired
	private CommonService commonService;
	
//	private final String FILE_REPO_PATH = "C:\\ccnms_file_repo\\";
	private final String FILE_REPO_PATH = "/var/lib/tomcat9/file_repo/";
	
	
	@GetMapping("/")
	public ModelAndView home(@RequestParam(required = false, value = "sort") String sort) throws Exception {

	    ModelAndView mv = new ModelAndView();

	    // 필터링을 위한 파라미터 설정
	    Map<String, Object> sortMap = new HashMap<>();
	    sortMap.put("sort", sort);

	    // 서비스로부터 데이터를 가져오기
	    mv.addObject("diggingList", commonService.getDiggingList(sortMap));
	    mv.addObject("sort", sort);

	    // 추가 정보 가져오기
	    mv.addObject("headList", commonService.getHeadList());
	    List<ShopDTO> populerShopList = commonService.getPopulerShopList();
	    mv.addObject("populerShopList", populerShopList);
	 
	    // 뷰 설정
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
