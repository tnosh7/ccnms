package com.application.ccnms.digging.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/digging")
public class DiggingController {

	@GetMapping("/main")
	public ModelAndView main() {
		return new ModelAndView("/digging/main");
	}
	@GetMapping("/ranking")
	public ModelAndView ranking() {
		return new ModelAndView("/digging/ranking");
	}
	@GetMapping("/addDigging")
	public ModelAndView addDigging() {
		return new ModelAndView("/digging/addDigging");
	}
}
