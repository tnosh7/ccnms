package com.application.ccnms.admin.shop.controller;

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
	public ModelAndView shopManagement() throws Exception {
		ModelAndView mv = new ModelAndView("/admin/shop/shopList");
		mv.addObject("shopList", adminShopService.getShopList());
		return mv;
	}
	
	@GetMapping("/productAdd")
	public ModelAndView productAdd() throws Exception {
		return new ModelAndView("/admin/shop/productAdd");
	}
	
	@GetMapping("/orderList")
	public ModelAndView orderList() throws Exception {
		ModelAndView mv = new ModelAndView("/admin/shop/orderList");
		mv.addObject("orderList", adminShopService.getOrderList());
		return mv;
	}
	@GetMapping("/orderDetail")
	public ModelAndView orderDetail(@RequestParam Map<String,Object> adminOrderDetailMap)throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("orderDTO", adminShopService.getOrderDetail(adminOrderDetailMap));
		return mv;
	}
}
