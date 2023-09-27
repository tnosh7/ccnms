package com.application.ccnms.digging.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.application.ccnms.digging.dto.DiggingDTO;
import com.application.ccnms.digging.service.DiggingService;

@Controller
@RequestMapping("/digging")
public class DiggingController {
	@Autowired
	private DiggingService diggingService;
	
	@GetMapping("/main")
	public ModelAndView main()throws Exception {
		return new ModelAndView("/digging/main");
	}
	
	@GetMapping("/ranking")
	public ModelAndView ranking()throws Exception {
		return new ModelAndView("/digging/ranking");
	}
	@GetMapping("/addDigging")
	public ModelAndView addDigging()throws Exception {
		return new ModelAndView("/digging/addDigging");
	}
	
	@PostMapping("/addDigging")
	public @ResponseBody String addDigging(@ModelAttribute("userId") String userId, HttpServletRequest request) throws Exception{
		
		DiggingDTO diggingDTO = new DiggingDTO();
		int increment =1;
		diggingDTO.setDiggingId(increment);
		diggingDTO.setDiggingTopic(request.getParameter("diggingTopic"));
		diggingDTO.setSubject(request.getParameter("subject"));
		diggingDTO.setWriter(userId);
		diggingDTO.setContent(request.getParameter("content"));
		
		diggingService.addDigging(diggingDTO);
		
		String jsScript="<script>";
			   jsScript+="history.go(-1)";
			   jsScript+="alert('OK');";
			   jsScript+="</script>";
		return jsScript;
	}
	
}
