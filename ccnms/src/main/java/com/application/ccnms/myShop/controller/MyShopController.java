package com.application.ccnms.myShop.controller;

import java.util.Map;

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

import com.application.ccnms.myShop.dto.CartDTO;
import com.application.ccnms.myShop.dto.KeepDTO;
import com.application.ccnms.myShop.service.MyShopService;

@Controller
@RequestMapping("/myShop")
public class MyShopController {
	
	@Autowired
	private MyShopService myShopService;
	
	@GetMapping("/myCart")
	public ModelAndView myCart(@RequestParam("productCd") long productCd) throws Exception{
		ModelAndView mv = new ModelAndView("/myShop/myCart");
		mv.addObject("shopDTO", myShopService.getShopDTO(productCd));
		return mv;
	}
	
	@GetMapping("/addMyCart")
	public @ResponseBody String addMyCart(@RequestParam("productCd") long productCd, @RequestParam("cartQty") int cartQty, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		CartDTO cartDTO = new CartDTO();
		cartDTO.setUserId(userId);
		cartDTO.setProductCd(productCd);
		cartDTO.setCartQty(cartQty);
		
		String result = "duple";
		if (!myShopService.checkDuplicatedCart(cartDTO)) {
			myShopService.addMyCart(cartDTO);
			session.setAttribute("myCartCnt", myShopService.getMyCartCnt(userId));
			result = "notDuple";
		}
		return result;
	}
	
	@GetMapping("/cartList")
	public ModelAndView cartList(HttpServletRequest request) throws Exception{
		ModelAndView mv= new ModelAndView("/myShop/cartList");
		HttpSession session = request.getSession();
		mv.addObject("cartList", myShopService.getCartList((String)session.getAttribute("userId")));
		return mv;
	}
	
	@GetMapping("/modifyCartQty")
	public ResponseEntity<Object> modifyCartQty(@RequestParam Map<String, Object> updateMap) throws Exception{
		myShopService.modifyCartQty(updateMap);
		return new ResponseEntity<Object> (HttpStatus.OK);
	}
	
	@GetMapping("/removeCart")
	public ResponseEntity<Object> removeCart(@RequestParam("cartCdList") String cartCdList) throws Exception{
		String []temp = cartCdList.split(",");
		int [] removeCartCdList = new int[temp.length];
		
		for (int i = 0; i < temp.length; i++) {
			removeCartCdList[i] = Integer.parseInt(temp[i]);
		}
		
		myShopService.removeCart(removeCartCdList);
		String jsScript = "<script>";
			   jsScript +="location.href='cartList'";
			   jsScript +="</script>";
			
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type","text/html; charset=UTF-8");
		
		return new ResponseEntity<Object> (jsScript, responseHeaders, HttpStatus.OK);
	}
	
	@GetMapping("/myKeep")
	public ModelAndView myKeep (HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/myShop/myKeep");
		
		HttpSession session = request.getSession();
		mv.addObject("myKeepList", myShopService.getMyKeepList((String)session.getAttribute("userId")));
		
		return mv;
	}
	
	@GetMapping("/addMyKeep")
	public @ResponseBody String addMyKeep(@RequestParam("productCd") long productCd, @RequestParam("keepQty") int keepQty, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		KeepDTO keepDTO = new KeepDTO();
		keepDTO.setProductCd(productCd);
		keepDTO.setKeepQty(keepQty);
		keepDTO.setUserId(userId);
		
		String result = "duple";
		if (!myShopService.checkDuplicatedKeep(keepDTO)) {
			myShopService.addMyKeep(keepDTO);
			session.setAttribute("myKeepCnt", myShopService.getMyKeepCnt(userId));
			result ="notDuple";
		}
		return result;
	}
	
	@GetMapping("/removeKeep")
	public ResponseEntity<Object> removeKeep(@RequestParam("keepCdList") String keepCdList) throws Exception{
		String []temp = keepCdList.split(",");
		int [] removeKeepCdList = new int[temp.length];
		
		
		for (int i = 0; i < temp.length; i++) {
			removeKeepCdList[i] = Integer.parseInt(temp[i]);
		}
		
		myShopService.removeKeep(removeKeepCdList);
		String jsScript = "<script>";
			   jsScript +="location.href='myKeep'";
			   jsScript +="</script>";
			
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type","text/html; charset=UTF-8");
		
		return new ResponseEntity<Object> (jsScript, responseHeaders, HttpStatus.OK);
	}
	
	@GetMapping("/orderList")
	public ModelAndView orderList (HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView("/myShop/orderList");
		mv.addObject("orderList", myShopService.getOrderList((String)session.getAttribute("userId")));
		
		return mv;
	}
	
	@GetMapping("/orderDetail")
	public ModelAndView orderDetail (@RequestParam Map<String,Object> orderDetailMap) throws Exception{
		ModelAndView mv = new ModelAndView("/myShop/orderDetail");
		mv.addObject("orderDTO", myShopService.getOrderDetail(orderDetailMap));
		
		return mv;
	}
	
}
