package com.application.ccnms.admin.shop.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.application.ccnms.admin.shop.service.AdminShopService;

@Controller
@RequestMapping("/admin/shop")
public class AdminShopController {

	@Autowired
	private AdminShopService adminShopService;
	
	
	@GetMapping("/shopList")
	public ModelAndView shopManagement(@RequestParam(required =false, value="searchWord")String searchWord, @RequestParam(required =false, value="searchKey")String searchKey) throws Exception{
		ModelAndView mv = new ModelAndView();
		if (searchWord == null) {
			mv.addObject("shopList", adminShopService.getShopList());
		}
		else {
			Map<String,Object> searchMap= new HashMap<String, Object>();
			searchMap.put("searchWord", searchWord);
			searchMap.put("searchKey", searchKey);
			mv.addObject("shopList", adminShopService.getSearchShopList(searchMap));
		}
		mv.setViewName("/admin/shop/shopList");
		return mv;
	}
	
	@GetMapping("/productAdd")
	public ModelAndView productAdd() throws Exception {
		return new ModelAndView("/admin/shop/productAdd");
	}
	
	@GetMapping("/orderList")
	public ModelAndView orderList(@RequestParam(required =false, value="searchWord")String searchWord, @RequestParam(required =false, value="searchKey")String searchKey) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		if (searchWord == null) {
			mv.addObject("orderList", adminShopService.getOrderList());
		}
		else {
			Map<String,Object> searchMap= new HashMap<String, Object>();
			searchMap.put("searchWord", searchWord);
			searchMap.put("searchKey", searchKey);
			mv.addObject("orderList", adminShopService.getSearchOrderList(searchMap));
		}
		mv.setViewName("/admin/shop/orderList");
		return mv;
	}
	
	@GetMapping("/removeProduct") 
	public ModelAndView removeProduct(@RequestParam("removeProductList") String removeProductList)throws Exception {
		
		String []temp = removeProductList.split(",");
		int [] removeProduct = new int[temp.length];
		for (int i = 0; i < temp.length; i++) {
			removeProduct[i] = Integer.parseInt(temp[i]);
		}
		adminShopService.removeProductList(removeProduct);
		return new ModelAndView("redirect:/admin/shop/shopList");
		
	}
	
}
