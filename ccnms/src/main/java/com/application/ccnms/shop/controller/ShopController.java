package com.application.ccnms.shop.controller;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.application.ccnms.shop.dto.ShopDTO;
import com.application.ccnms.shop.service.ShopService;

import net.coobird.thumbnailator.Thumbnails;

@Controller
@RequestMapping("/shop")
public class ShopController {

	
	private ShopService shopService;
	
//	private final String FILE_REPO_PATH = "C:\\ccnms_file_repo\\";
	private final String FILE_REPO_PATH = "/var/lib/tomcat9/file_repo/";
	
	@Autowired
	public ShopController(ShopService shopService) {
	this.shopService = shopService;
}

	@GetMapping("/")
	public ModelAndView shop(@RequestParam(required =false, value="sort") String sort, HttpServletRequest request, 
							 @RequestParam(required = false, value="bestSort") String bestSort) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		
		if (sort == null) {
			mv.addObject("shopList", shopService.getProductList());
			mv.addObject("latestList", shopService.getLatestList());
		}
		else {
			Map<String,String> sortMap = new HashMap<String,String>();
			sortMap.put("sort", sort);
			if (bestSort != null) {
				sortMap.put("bestSort", bestSort);
			}
			mv.addObject("shopList", shopService.sortList(sortMap));
			mv.addObject("latestList", shopService.getSortLatestList(sortMap));
		}
		mv.setViewName("/shop/main");
		return mv; 
	}
	
	@GetMapping("/addProduct")
	public ModelAndView addProduct()throws Exception {
		return new ModelAndView("/shop/addProduct"); 
	}
	
	@PostMapping("/addProduct")
	public @ResponseBody String addProduct(MultipartHttpServletRequest multipartRequest, HttpServletRequest request) throws Exception {
		ShopDTO shopDTO = new ShopDTO();
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
		shopDTO.setProductNm(request.getParameter("productNm"));
		shopDTO.setPrice(Integer.parseInt(request.getParameter("price")));
		shopDTO.setWriter(String.valueOf(session.getAttribute("userId")));
		shopDTO.setDiscountRate(Integer.parseInt(request.getParameter("discountRate")));
		shopDTO.setStock(Integer.parseInt(request.getParameter("stock")));
		shopDTO.setDeliveryPrice(Integer.parseInt(request.getParameter("deliveryPrice")));
		shopDTO.setDeliveryMethod(request.getParameter("deliveryMethod"));
		shopDTO.setSort(request.getParameter("sort"));
		shopDTO.setContent(request.getParameter("content"));
		shopDTO.setProductFile(fileName);
		shopService.addProduct(shopDTO);
		
		String jsScript = "<script>";		
			   jsScript +="location.href='" + request.getContextPath() + "/myShop/saleList'"; 
			   jsScript +="</script>";
		return jsScript;
	}
	@GetMapping("/shopDetail")
	public ModelAndView shopDetail (@RequestParam("productCd") long productCd, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("shopDTO", shopService.getProductDetail(productCd));
		mv.addObject("qnaList", shopService.getQnaList(productCd));
		mv.setViewName("/shop/shopDetail");
		
		return mv;
	}
	
}
