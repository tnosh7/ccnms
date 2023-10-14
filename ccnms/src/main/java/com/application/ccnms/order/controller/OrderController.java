package com.application.ccnms.order.controller;

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
import com.application.ccnms.order.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired 
	private OrderService orderService;
	
	@GetMapping("/myCart")
	public ModelAndView myCart(@RequestParam("productId") long productId) throws Exception {
		ModelAndView mv= new ModelAndView();
		mv.addObject("shopDTO", orderService.getShopDTO(productId));
		mv.setViewName("/order/myCart");
		return mv;
	}
	
	@GetMapping("/addMyKeep")
	public @ResponseBody String addMyKeep(@RequestParam("productId") long productId, @RequestParam("keepQty") int keepQty, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		CartDTO cartDTO = new CartDTO(); 
		cartDTO.setProductId(productId);
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
}
