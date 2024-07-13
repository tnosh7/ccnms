package com.application.ccnms.qna.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.application.ccnms.qna.dto.QnaDTO;
import com.application.ccnms.qna.service.QnaService;
import com.application.ccnms.shop.service.ShopService;

@Controller
@RequestMapping("/qna")
public class QnaController {

	private QnaService qnaService; 
	private ShopService shopService;
	
	@Autowired
	public QnaController(QnaService qnaService, ShopService shopService) {
		this.qnaService = qnaService;
		this.shopService = shopService;
	}

	@GetMapping("/qnaList")
	public ModelAndView qnaList(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		if (session.getAttribute("admin")!= "") {
			mv.addObject("myQnaList", qnaService.getMyQnaList("ModuDigging"));
			mv.addObject("qnaList", qnaService.getQnaList("ModuDigging"));
		}
		else {
			mv.addObject("myQnaList", qnaService.getMyQnaList((String)session.getAttribute("userId")));
			mv.addObject("qnaList", qnaService.getQnaList((String)session.getAttribute("userId")));
		}
		mv.setViewName("/qna/qnaList");
		return mv;
	}
	
	@GetMapping("/addQna")
	public ModelAndView addQna(@RequestParam("productCd") String productCd, @RequestParam("qna") String qna, HttpServletRequest request)  throws Exception{
		HttpSession session = request.getSession();
		QnaDTO qnaDTO = new QnaDTO();
		qnaDTO.setWriter((String)session.getAttribute("userId"));
		qnaDTO.setContent(qna);
		qnaDTO.setProductCd(Long.parseLong(productCd));
		ModelAndView mv = new ModelAndView();
		if (!qnaService.authenticationQna((String)session.getAttribute("userId"))) {
			qnaService.addQna(qnaDTO);
			qnaService.setQnaCnt(Long.parseLong(productCd));
		}
		else {
			mv.addObject("authenticationQna", "true");
		}
		mv.addObject("shopDTO", shopService.getProductDetail(Long.parseLong(productCd)));
		mv.addObject("qnaList", shopService.getQnaList(Long.parseLong(productCd)));
		mv.addObject("productCd", productCd);
		mv.setViewName("/shop/shopDetail");
		return mv;
	}
	
	@GetMapping("/replyQna") 
	public @ResponseBody String replyQna(QnaDTO qnaDTO, HttpServletRequest request) throws Exception {
		
		qnaService.updateQnaReply(qnaDTO);
		String jsScript = "<script>";
			   jsScript += "location.href='" + request.getContextPath() + "/qna/qnaList'"; 
			   jsScript +="</script>";
		return jsScript;
	}
	
	@GetMapping("/removeQna")
	public ModelAndView removeQna(@RequestParam("removeQnaList") String removeQnaList, 
								  @RequestParam("updateQnaCntList") String updateQnaCntList) throws Exception {
		String[] temp1 = removeQnaList.split(",");
		int[] removeQna = new int[temp1.length];
		for (int i = 0; i < temp1.length; i++) {
			removeQna[i] = Integer.parseInt(temp1[i]);
		}
		String[] temp2 = updateQnaCntList.split(",");
		int[] productCd = new int[temp2.length];
		for (int i = 0; i < temp2.length; i++) {
			productCd[i] = Integer.parseInt(temp2[i]);
		}
		qnaService.reduceQnaCnt(productCd);
		qnaService.removeQnaList(removeQna);
		return new ModelAndView("redirect:/qna/qnaList");
	}
}
