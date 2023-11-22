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
	
	@GetMapping("/qnaList")
	public ModelAndView qnaList(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		mv.addObject("myQnaList", qnaService.getMyQnaList((String)session.getAttribute("userId")));
		mv.addObject("qnaList", qnaService.getQnaList((String)session.getAttribute("userId")));
		mv.setViewName("/qna/qnaList");
		return mv;
	}
	
	@GetMapping("/addQna")
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
	public @ResponseBody String replyQna(QnaDTO qnaDTO, HttpServletRequest request) throws Exception {
		
		qnaService.updateQnaReply(qnaDTO);
		System.out.println("====================");
		System.out.println(qnaDTO);
		System.out.println("====================");
		String jsScript = "<script>";
			   jsScript += "location.href='" + request.getContextPath() + "/qna/qnaList'"; 
			   jsScript +="</script>";
		return jsScript;
	}
	
	@GetMapping("/removeQna")
	public ModelAndView removeQna(@RequestParam("removeQnaList") String removeQnaList) throws Exception {
		String[] temp = removeQnaList.split(",");
		int[] removeQnaCd = new int[temp.length];
		for (int i = 0; i < temp.length; i++) {
			removeQnaCd[i] = Integer.parseInt(temp[i]);
		}
		qnaService.removeQnaList(removeQnaCd);
		return new ModelAndView("redirect:/qna/qnaList");
	}
}
