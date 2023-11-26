package com.application.ccnms.shop.controller;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
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

	@Autowired
	private ShopService shopService;
	
	private final String FILE_REPO_PATH = "C:\\ccnms_file_repo\\";
//	private final String FILE_REPO_PATH = "/var/lib/tomcat9/file_repo/";
	
	@GetMapping("/")
	public ModelAndView shop(@RequestParam(required =false, value="sort") String sort, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		if (sort == null) {
			mv.addObject("shopList", shopService.getProductList());
			
		}
		else {
			mv.addObject("shopList", shopService.sortList(sort));
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
		System.out.println(shopDTO);
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
	
	@GetMapping("/bestSort")
	public ModelAndView bestSort(@RequestParam("bestSort") String bestSort) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("shopList", shopService.bestSortList(bestSort));
		mv.setViewName("/shop/main");
		return mv;
	}
}
