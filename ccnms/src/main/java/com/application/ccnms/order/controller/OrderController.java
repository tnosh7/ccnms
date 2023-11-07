package com.application.ccnms.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.application.ccnms.order.dto.OrderDTO;
import com.application.ccnms.order.service.OrderService;
import com.application.ccnms.user.service.UserService;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired 
	private OrderService orderService;
	private UserService userService;
	
	
	@GetMapping("/cartOrderSheet")
	public ModelAndView orderCart (@RequestParam("cartCdList") String cartCdList , 
								   @RequestParam("productCdList") String productCdList , 
								   @RequestParam("cartQtyList") String cartQtyList ,
								   HttpServletRequest request) throws Exception{
		String[] temp = productCdList.split(",");
		int[] productCdsList = new int[temp.length];
		
		for (int i = 0; i < temp.length; i++) {
			productCdsList[i] = Integer.parseInt(temp[i]);
		}
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/order/cartOrderSheet");
		
		HttpSession session = request.getSession();
		session.setAttribute("myOrderCnt", userService.getMyOrderCnt((String)session.getAttribute("userId")));
		session.setAttribute("myCartCnt", userService.getMyCartCnt((String)session.getAttribute("userId")));
		
		mv.addObject("userDTO",  orderService.getUserDTO((String)session.getAttribute("userId")));
		mv.addObject("productList",  orderService.getProductListByCart(productCdsList));
		mv.addObject("cartCdList", cartCdList);
		mv.addObject("productCdsList", productCdList);
		mv.addObject("cartQtyList", cartQtyList);
		return mv;
	}
	
	@GetMapping("/orderSheet") 
	public ModelAndView orderSheet(@RequestParam("productCd") long productCd, OrderDTO orderDTO, HttpServletRequest request) throws Exception {
		
		ModelAndView mv= new ModelAndView();
		HttpSession session = request.getSession();
		mv.addObject("shopDTO", orderService.getShopDTO(productCd));
		mv.addObject("userDTO", orderService.getUserDTO((String) session.getAttribute("userId")));
		mv.setViewName("/order/orderSheet");
		return mv;
	}
	
}
