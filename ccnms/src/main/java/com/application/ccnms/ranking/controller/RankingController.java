package com.application.ccnms.ranking.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.application.ccnms.digging.dto.DiggingDTO;
import com.application.ccnms.digging.dto.JoinTitleDTO;
import com.application.ccnms.mypage.service.MyPageService;
import com.application.ccnms.ranking.service.RankingService;


@Controller
@RequestMapping("/ranking")
public class RankingController {
	
	private RankingService rankingService;
	
	@Autowired
	public RankingController(RankingService rankingService) {
		this.rankingService = rankingService;
	}

	@GetMapping("/ranking")
	public ModelAndView ranking()throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("rankingMap", rankingService.getRankingList());
		mv.addObject("diggingRankMap", rankingService.getDiggingRankList());
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
