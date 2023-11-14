package com.application.ccnms.ranking.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.application.ccnms.myPage.service.MyPageService;
import com.application.ccnms.ranking.service.RankingService;


@Controller
@RequestMapping("/ranking")
public class RankingController {
	@Autowired
	private RankingService rankingService;
	
	@GetMapping("/ranking")
	public ModelAndView ranking()throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("rankingList", rankingService.getRankingList());
		mv.addObject("diggingRankList", rankingService.getDiggingRankList());
		mv.setViewName("/ranking/ranking");
		return mv;
	
	}
	
	@GetMapping("/otherUserInfo")
	public ModelAndView otherUserInfo(@RequestParam("userId") String userId) throws Exception {
		ModelAndView mv = new ModelAndView("/otherUserInfo");
		mv.addObject("diggingList", rankingService.getDiggingList(userId));
		mv.addObject("otherUserId", userId);
		return mv;
	}
	
	

}
