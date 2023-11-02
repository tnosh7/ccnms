package com.application.ccnms.order.controller;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.application.ccnms.order.dto.CartDTO;
import com.application.ccnms.order.dto.OrderDTO;
import com.application.ccnms.order.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired 
	private OrderService orderService;
	
	@GetMapping("/myCart")
	public ModelAndView myCart(@RequestParam("productCd") long productCd) throws Exception {
		ModelAndView mv= new ModelAndView();
		mv.addObject("shopDTO", orderService.getShopDTO(productCd));
		mv.setViewName("/order/myCart");
		return mv;
	}
	
	@GetMapping("/addMyKeep")
	public @ResponseBody String addMyKeep(@RequestParam("productCd") long productCd, @RequestParam("keepQty") int keepQty, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		CartDTO cartDTO = new CartDTO(); 
		cartDTO.setProductCd(productCd);
		cartDTO.setUserId(userId);
		cartDTO.setCartQty(keepQty);
		
		String result= "duple";
		if(!orderService.checkDuplicatedKeep(cartDTO)) {
			orderService.addMyKeep(cartDTO);
			session.setAttribute("myKeepCnt", orderService.getMyCartCnt(userId));
			result = "notDuple";
		}
		return result;
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
	@GetMapping("/myKeep")
	public ModelAndView myKeep() {
		return new ModelAndView("/order/myKeep");
	}
}
