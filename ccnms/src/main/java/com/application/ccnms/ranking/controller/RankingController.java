package com.application.ccnms.ranking.controller;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.application.ccnms.ranking.service.RankingService;

import net.coobird.thumbnailator.Thumbnails;

@Controller
@RequestMapping("/ranking")
public class RankingController {
	@Autowired
	private RankingService rankingService;

	private final String FILE_REPO_PATH = "C:\\ccnms_file_repo\\";
	
	@GetMapping("/ranking")
	public ModelAndView ranking()throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("rankingList", rankingService.getRankingList());
		mv.setViewName("/ranking/ranking");
		return mv;
	
	}
	@GetMapping("/thumbnails")
	public void thumbnails(@RequestParam("file") String file, HttpServletResponse response) throws IOException {
		OutputStream out = response.getOutputStream();
		File image= new File(FILE_REPO_PATH + file);
		if (image.exists()) {
			Thumbnails.of(image).size(1000,1000).outputFormat("png").toOutputStream(out);
		}
		byte[] buffer = new byte[1024*8];
		out.write(buffer);
		out.close();
	}





}
