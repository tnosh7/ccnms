package com.application.ccnms.order.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.application.ccnms.order.dto.OrderDTO;
import com.application.ccnms.order.service.OrderService;
import com.application.ccnms.shop.dto.ShopDTO;
import com.application.ccnms.user.dto.UserDTO;
import com.application.ccnms.user.service.UserService;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired 
	private OrderService orderService;
	
	@Autowired
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
		
		mv.addObject("userDTO",  orderService.getUserDTO((String)session.getAttribute("userId")));
		mv.addObject("productList",  orderService.getProductListByCart(productCdsList));
		mv.addObject("cartCdList", cartCdList);
		mv.addObject("productCdsList", productCdList);
		mv.addObject("cartQtyList", cartQtyList);
		return mv;
	}
	
	@PostMapping("/cartOrderSheet")
	public ResponseEntity<Object> cartOrderSheet (@RequestParam Map<String,Object> orderListMap ,  HttpServletRequest request) throws Exception{
		
		orderService.addCartOrder(orderListMap);
		HttpSession session = request.getSession();
		session.setAttribute("myOrderCnt", userService.getMyOrderCnt((String)session.getAttribute("userId")));
		session.setAttribute("myCartCnt", userService.getMyCartCnt((String)session.getAttribute("userId")));
		String jsScript = "<script>";
			   jsScript+= "location.href='" + request.getContextPath() + "/shop/'";
			   jsScript+= "</script>";	
			   
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		return new ResponseEntity<Object> (jsScript, responseHeaders, HttpStatus.OK);
	}
	
	@GetMapping("/orderSheet") 
	public ModelAndView orderSheet(@RequestParam("shopCd") String shopCd, OrderDTO orderDTO, HttpServletRequest request, @RequestParam("orderQty") String orderQty) throws Exception {
		int productCd = Integer.parseInt(shopCd);
		ModelAndView mv= new ModelAndView();
		HttpSession session = request.getSession();
		mv.addObject("shopDTO", orderService.getShopDTO(productCd));
		mv.addObject("userDTO", orderService.getUserDTO((String) session.getAttribute("userId")));
		mv.addObject("orderQty", orderQty);
		mv.setViewName("/order/orderSheet");
		return mv;
	}
	@PostMapping("/orderSheet")
	public ResponseEntity<Object> orderSheet(UserDTO userDTO, OrderDTO orderDTO, HttpServletRequest request) throws Exception{
		orderService.addOrder(orderDTO);
		HttpSession session = request.getSession();
		session.setAttribute("myOrderCnt", userService.getMyOrderCnt(userDTO.getUserId()));
		String jsScript = "<script>";
			   jsScript+= "location.href='" + request.getContextPath() + "/shop/shopDetail?productCd=" + orderDTO.getProductCd() +"';";
			   jsScript+= "</script>";
			   
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
	}
	

	
}
