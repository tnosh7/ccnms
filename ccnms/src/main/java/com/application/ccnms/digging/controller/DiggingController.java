package com.application.ccnms.digging.controller;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.application.ccnms.digging.dto.DiggingDTO;
import com.application.ccnms.digging.dto.JoinTitleDTO;
import com.application.ccnms.digging.service.DiggingService;

import net.coobird.thumbnailator.Thumbnails;

@Controller
@RequestMapping("/digging")
public class DiggingController {
	
	private DiggingService diggingService;
	
	@Autowired	
	public DiggingController(DiggingService diggingService) {
		this.diggingService = diggingService;
	}

	//	private final String FILE_REPO_PATH = "C:\\ccnms_file_repo\\";
	private final String FILE_REPO_PATH = "/var/lib/tomcat9/file_repo/";

	@GetMapping("/main")
	public ModelAndView main(HttpServletRequest request, 
							@RequestParam("mainTitle") int mainTitle,
							@RequestParam(required =false, value="sort") 		String sort, 
							@RequestParam(required=false,  value="subTitle") 	Integer  subTitle, 
							@RequestParam(required =false, value="diggingCnt")  String diggingCnt) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<JoinTitleDTO> joinedTitleList = diggingService.getJoinTitleList();
	    mv.addObject("joinedTitleList", joinedTitleList);
		mv.addObject("currentMainId", mainTitle);
		mv.setViewName("/digging/main");
		
		
		// 페이징 처리
		// 한 페이지에 표시할 항목 수를 기본값 10으로 설정
		int onePageViewCnt = 10;

		// request 파라미터로부터 onePageViewCnt 값을 가져와서 설정 (null이 아닌 경우)
		if (request.getParameter("onePageViewCnt") != null) {
		    try {
		        onePageViewCnt = Integer.parseInt(request.getParameter("onePageViewCnt"));
		    } catch (NumberFormatException e) {
		        onePageViewCnt = 10;
		    }
		}
		// request 파라미터로부터 현재 페이지 번호를 가져옴 (null인 경우 1로 설정)
		String temp = request.getParameter("currentPageNumber");
		if (temp == null) {
		    temp = "1";
		}
		int currentPageNumber;
		try {
		    currentPageNumber = Integer.parseInt(temp);
		} catch (NumberFormatException e) {
		    currentPageNumber = 1;
		}
		// diggingTopic에 해당하는 전체 항목 수를 가져옴
		int allDiggingCnt = diggingService.getAllDiggingCnt(mainTitle);

		// 전체 페이지 수를 계산
		int allPageCnt = (int) Math.ceil((double) allDiggingCnt / onePageViewCnt);

		// 페이지 네비게이션의 시작 페이지 번호를 계산
		int startPage = ((currentPageNumber - 1) / 10) * 10 + 1;
		// 시작 페이지 번호가 0일 경우 1로 설정
		if (startPage <= 0) {
		    startPage = 1;
		}

		// 페이지 네비게이션의 끝 페이지 번호를 계산
		int endPage = startPage + 9;
		// 끝 페이지 번호가 전체 페이지 수를 초과할 경우 조정
		if (endPage > allPageCnt) {
		    endPage = allPageCnt;
		}

		// 현재 페이지에서 시작하는 항목의 인덱스를 계산
		int startDiggingIdx = (currentPageNumber - 1) * onePageViewCnt;

		// ModelAndView 객체에 계산된 페이지 정보 추가
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("allDiggingCnt", allDiggingCnt);
		mv.addObject("allPageCnt", allPageCnt);
		mv.addObject("onePageViewCnt", onePageViewCnt);
		mv.addObject("currentPageNumber", currentPageNumber);
		mv.addObject("startDiggingIdx", startDiggingIdx);

		// 검색 조건을 담을 맵 객체 생성
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("onePageViewCnt", onePageViewCnt);
		searchMap.put("startDiggingIdx", startDiggingIdx);
		String mainTitle1 = String.valueOf(mainTitle);
		searchMap.put("mainTitle", mainTitle1);
		// 정렬 조건이 있는 경우 맵에 추가
		if (sort != null) searchMap.put("sort", sort);
		// dig 조건이 있는 경우 맵에 추가, 없는 경우 빈 문자열로 설정
		if (subTitle != null) {
		    searchMap.put("subTitle", subTitle);
		} else {
		    searchMap.put("subTitle", null);
		}

		// ModelAndView 객체에 검색 조건과 결과 추가
		mv.addObject("sort", sort);
		mv.addObject("diggingList", diggingService.getDiggingList(searchMap));
		mv.addObject("populerList", diggingService.getPopulerList(searchMap));
		mv.addObject("mainTitle", mainTitle);
		mv.addObject("subTitleList", diggingService.getSubTitleList(searchMap));

		return mv;
	}

	@GetMapping("/addDigging")
	public ModelAndView addDigging() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("mainTitleDTO", diggingService.getMainTitle());
		mv.addObject("subTitleDTO", diggingService.getSubTitle());
		mv.setViewName("/digging/addDigging");
		return mv;
	}

	@PostMapping("/addDigging")
	public @ResponseBody String addDigging(HttpServletRequest request, MultipartHttpServletRequest multipartRequest,@RequestParam int mainId)
			throws Exception {
		DiggingDTO diggingDTO = new DiggingDTO();
		HttpSession session = request.getSession();
		Iterator<String> fileList = multipartRequest.getFileNames();
		String fileName = "";
		while (fileList.hasNext()) {
			MultipartFile uploadFile = multipartRequest.getFile(fileList.next());
			if (!uploadFile.getOriginalFilename().isEmpty()) {
				SimpleDateFormat fmt = new SimpleDateFormat("yyyyMMdd");
				fileName = fmt.format(new Date()) + "_" + UUID.randomUUID() + "_" + uploadFile.getOriginalFilename();
				uploadFile.transferTo(new File(FILE_REPO_PATH + fileName));
			}
		}
		diggingDTO.setSubject(request.getParameter("subject"));
		diggingDTO.setWriter(String.valueOf(session.getAttribute("userId")));
		diggingDTO.setContent(request.getParameter("content"));
		int subId = Integer.parseInt(request.getParameter(("subId")));
		diggingDTO.setSubTitleId(subId);
		diggingDTO.setMainTitleId(mainId);

		String content = request.getParameter("content");
		int idx = content.indexOf("/embed/");
		if (idx >= 0) {
			int idx2 = content.indexOf("></oembed>");
			String url = content.substring(idx + 7, idx2 - 1);
			diggingDTO.setVideoYn("Y");
			diggingDTO.setVideoId(url);
		} else {
			diggingDTO.setVideoYn("N");
			diggingDTO.setVideoId("");
		}
		diggingDTO.setFile(fileName);
		diggingService.addDigging(diggingDTO);

		String jsScript = "<script>";
		jsScript += "location.href='" + request.getContextPath() + "/'";
		jsScript += "</script>";
		return jsScript;
	}

	@GetMapping("diggingDetail")
	public ModelAndView diggingDetail(@RequestParam("diggingId") long diggingId) throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("/digging/diggingDetail");
		mv.addObject("diggingDTO", diggingService.getDiggingDetail(diggingId));
		List<JoinTitleDTO> joinedTitleList = diggingService.getJoinTitleList();
	    mv.addObject("joinedTitleList", joinedTitleList);
		mv.addObject("allReplyCnt", diggingService.getallReplyCnt(diggingId));
		mv.addObject("replyList", diggingService.getReplyList(diggingId));
		return mv;
	}

	@GetMapping("/modifyDigging")
	public ModelAndView modify(@RequestParam("diggingId") long diggingId) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("diggingDTO", diggingService.getDiggingDetail(diggingId));
		mv.setViewName("/digging/modifyDigging");
		return mv;
	}

	@PostMapping("/modifyDigging")
	public ModelAndView modifyDigging(DiggingDTO diggingDTO, MultipartHttpServletRequest multipartRequest,
			HttpServletRequest request) throws Exception {
		Iterator<String> fileList = multipartRequest.getFileNames();
		String fileName = "";
		while (fileList.hasNext()) {
			MultipartFile uploadFile = multipartRequest.getFile(fileList.next());
			if (!uploadFile.getOriginalFilename().isEmpty()) {
				SimpleDateFormat fmt = new SimpleDateFormat("yyyyMMdd");
				fileName = fmt.format(new Date()) + "_" + UUID.randomUUID() + "_" + uploadFile.getOriginalFilename();
				uploadFile.transferTo(new File(FILE_REPO_PATH + fileName));
			}
		}
		diggingDTO.setFile(fileName);
		diggingService.updateDigging(diggingDTO);
		diggingService.getDiggingDetail(diggingDTO.getDiggingId());
		ModelAndView mv = new ModelAndView();
		long diggingId = diggingDTO.getDiggingId();
		mv.setViewName("redirect:/digging/diggingDetail?diggingId=" + diggingId);
		mv.addObject("diggingDTO", diggingService.getDiggingDetail(diggingDTO.getDiggingId()));
		mv.addObject("allReplyCnt", diggingService.getallReplyCnt(diggingDTO.getDiggingId()));
		mv.addObject("replyList", diggingService.getReplyList(diggingDTO.getDiggingId()));
		return mv;
	}

	@GetMapping("/thumbnails")
	public void thumbnails(@RequestParam("file") String file, HttpServletResponse response) throws IOException {
		OutputStream out = response.getOutputStream();
		String filePath = FILE_REPO_PATH + file;

		File image = new File(filePath);
		if (image.exists()) {
			Thumbnails.of(image).size(200, 200).outputFormat("png").toOutputStream(out);
		}
		byte[] buffer = new byte[1024 * 8];
		out.write(buffer);
		out.close();
	}

}
