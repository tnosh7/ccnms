package com.application.ccnms.order.controller;

import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.application.ccnms.order.dto.CartDTO;
import com.application.ccnms.order.dto.KeepDTO;
import com.application.ccnms.order.dto.OrderDTO;
import com.application.ccnms.order.service.OrderService;
import com.application.ccnms.user.service.UserService;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired 
	private OrderService orderService;
	private UserService userService;
	
	@GetMapping("/myCart")
	public ModelAndView myCart(@RequestParam("productCd") long productCd) throws Exception {
		ModelAndView mv= new ModelAndView();
		mv.addObject("shopDTO", orderService.getShopDTO(productCd));
		mv.setViewName("/order/myCart");
		return mv;
	}
	
	@GetMapping("/addMyCart")
	public @ResponseBody String addMyCart(@RequestParam("productCd") long productCd, @RequestParam("cartQty") int cartQty, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		CartDTO cartDTO = new CartDTO(); 
		cartDTO.setProductCd(productCd);
		cartDTO.setUserId(userId);
		cartDTO.setCartQty(cartQty);
		
		String result= "duple";
		if(!orderService.checkDuplicatedCart(cartDTO)) {
			orderService.addMyCart(cartDTO);
			session.setAttribute("myCartCnt", orderService.getMyCartCnt(userId));
			result = "notDuple";
		}
		return result;
	}
	@GetMapping("/addMyKeep")
	public @ResponseBody String addMyKeep(@RequestParam("productCd") long productCd, @RequestParam("keepQty") int keepQty, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		KeepDTO keepDTO = new KeepDTO();
		keepDTO.setProductCd(productCd);
		keepDTO.setUserId(userId);
		keepDTO.setKeepQty(keepQty);
		
		String result= "duple";
		if(!orderService.checkDuplicatedKeep(keepDTO)) {
			orderService.addMyKeep(keepDTO);
			session.setAttribute("myKeepCnt", orderService.getMyKeepCnt(userId));
			result = "notDuple";
		}
		return result;
	}
	
	@GetMapping("/cartList")
	public ModelAndView cartList(HttpServletRequest requset) throws Exception {
		ModelAndView mv= new ModelAndView();
		HttpSession session = requset.getSession();
		mv.setViewName("/order/cartList");
		mv.addObject("cartList", orderService.getCartList((String)session.getAttribute("userId")));
		return mv;
	}
	
	@GetMapping("/modifyCartQty")
	public ResponseEntity<Object> modifyCartQty(@RequestParam Map<String,Object> updateMap) throws Exception{
		orderService.modifyCartQty(updateMap);
		return new ResponseEntity<Object>(HttpStatus.OK);
	}
	
	@GetMapping("/removeCart")
	public ResponseEntity<Object> removeCart(@RequestParam("cartCdList") String cartCdList) throws Exception{
		String[]temp = cartCdList.split(",");
		int[] deleteCartCdList = new int[temp.length];
		
		for (int i = 0; i < temp.length; i++) {
			deleteCartCdList[i] = Integer.parseInt(temp[i]);
		}
		orderService.removeCart(deleteCartCdList);
		String jsScript="<script>";
			   jsScript+="location.href='cartList'";
			   jsScript+="</script>";
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
	}
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
	@GetMapping("/myKeep")
	public ModelAndView myKeep() {
		return new ModelAndView("/order/myKeep");
	}
	
}
