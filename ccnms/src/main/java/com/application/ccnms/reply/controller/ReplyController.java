package com.application.ccnms.reply.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.application.ccnms.reply.dto.ReplyDTO;
import com.application.ccnms.reply.service.ReplyService;

@Controller
@RequestMapping("/reply")
public class ReplyController {
	
	private ReplyService replyService;
	
	@Autowired
	public ReplyController(ReplyService replyService) {
		this.replyService = replyService;
	}

	@GetMapping("/addReply")
	public ModelAndView addReply (@RequestParam("writer") String writer,@RequestParam("diggingId")long diggingId, @RequestParam("content")String content) throws Exception {
		ReplyDTO replyDTO = new ReplyDTO();
		replyDTO.setWriter(writer);
		replyDTO.setDiggingId(diggingId);
		replyDTO.setContent(content);
		replyService.addReply(replyDTO);
		replyService.updateReplyCnt(diggingId);
		ModelAndView mv = new ModelAndView();
		mv.addObject("diggingId", diggingId);
		mv.setViewName("redirect:/digging/diggingDetail?diggingId=" + diggingId);
		
		return mv;
		
	}
	
	@GetMapping("/removeReply")
	public ModelAndView removeReply(@RequestParam("replyId") String replyId,@RequestParam("diggingId")long diggingId)throws Exception {
		replyService.removeReply(Long.parseLong(replyId));
		ModelAndView mv = new ModelAndView();
		mv.addObject("diggingId", diggingId);
		mv.setViewName("redirect:/digging/diggingDetail?diggingId=" + diggingId);
		return mv;
	}
	
}
