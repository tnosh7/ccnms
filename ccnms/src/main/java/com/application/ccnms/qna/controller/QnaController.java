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

	@Autowired
	private QnaService qnaService; 
	
	@Autowired
	private ShopService shopService;
	
	@GetMapping("addQna")
	public @ResponseBody String addQna(@RequestParam("productCd") String productCd, @RequestParam("qna") String qna, HttpServletRequest request)  throws Exception{
		HttpSession session = request.getSession();
		QnaDTO qnaDTO = new QnaDTO();
		qnaDTO.setWriter((String)session.getAttribute("userId"));
		qnaDTO.setContent(qna);
		qnaDTO.setProductCd(Long.parseLong(productCd));
		
		qnaService.addQna(qnaDTO);
		qnaService.setQnaCnt(Long.parseLong(productCd));
		
		String jsScript = "<script>";
				jsScript += "history.go(-1)";
				jsScript +="</script>";
		return jsScript;
	}
	
	@GetMapping("/replyQna") 
	public @ResponseBody String replyQna(@RequestParam("qnaCd") String qnaCd, @RequestParam("qnaReply")String qnaReply) throws Exception {
		
		QnaDTO qnaDTO = new QnaDTO();
		qnaDTO.setQnaReply(qnaReply);
		qnaDTO.setQnaCd(Long.parseLong(qnaCd));
		qnaService.updateQnaReply(qnaDTO);
		
		String jsScript = "<script>";
		jsScript += "history.go(-1)";
		jsScript +="</script>";
		return jsScript;
	}
}
