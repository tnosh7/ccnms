package com.application.ccnms.reply.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.application.ccnms.reply.dto.ReplyDTO;
import com.application.ccnms.reply.service.ReplyService;

@Controller
@RequestMapping("/reply")
public class ReplyController {
	@Autowired
	private ReplyService replyService;
	
	@GetMapping("/addReply")
	public void addReply (@RequestParam("writer") String writer,@RequestParam("diggingId")long diggingId, @RequestParam("content")String content) throws Exception {
		ReplyDTO replyDTO = new ReplyDTO();
		replyDTO.setWriter(writer);
		replyDTO.setDiggingId(diggingId);
		replyDTO.setContent(content);
		
		replyService.addReply(replyDTO);
	}
	
	
}
