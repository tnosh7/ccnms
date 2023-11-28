package com.application.ccnms.admin.user.controller;

import java.io.File;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.application.ccnms.admin.user.service.AdminUserService;
import com.application.ccnms.user.dto.UserDTO;

import net.coobird.thumbnailator.Thumbnails;

@Controller
@RequestMapping("/admin/management")
public class AdminUserController {
	
	private final String FILE_REPO_PATH = "C:\\ccnms_file_repo\\";
//	private final String FILE_REPO_PATH = "/var/lib/tomcat9/file_repo/";
	
	@Autowired
	private AdminUserService adminUserService;
	
	@GetMapping("/")
	public ModelAndView user(@RequestParam(required =false, value="searchWord")String searchWord, @RequestParam(required =false, value="searchKey")String searchKey) throws Exception {
		ModelAndView mv = new ModelAndView();
		if (searchWord == null) {
			mv.addObject("userList", adminUserService.getUserList());
		}
		else {
			Map<String,Object> searchMap= new HashMap<String, Object>();
			searchMap.put("searchWord", searchWord);
			searchMap.put("searchKey", searchKey);
			mv.addObject("userList", adminUserService.getSearchUserList(searchMap));
		}
		mv.setViewName("/management/user");
		return mv;
	}
	
	
	@GetMapping("/userExcelExport")
	public void userExcelExport(HttpServletResponse response) throws Exception {
		  
		SimpleDateFormat joinTime = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat fileSdf = new SimpleDateFormat("yyyy_MM_dd_hh_mm");
		String makeFileTime = fileSdf.format(new Date());
		String makeFileName = makeFileTime + "_userList.xls";
		
	    Workbook wb = new HSSFWorkbook();
	    Sheet sheet = wb.createSheet("회원리스트");
	    Row row = null;
	    Cell cell = null;

	    int rowNo = 0;

	    CellStyle headStyle = wb.createCellStyle();
	    headStyle.setBorderTop(BorderStyle.THIN);
	    headStyle.setBorderBottom(BorderStyle.THIN);
	    headStyle.setBorderLeft(BorderStyle.THIN);
	    headStyle.setBorderRight(BorderStyle.THIN);

	    headStyle.setFillForegroundColor(HSSFColorPredefined.AQUA.getIndex());
	    headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

	    headStyle.setAlignment(HorizontalAlignment.CENTER);

	    CellStyle bodyStyle = wb.createCellStyle();
	    bodyStyle.setBorderTop(BorderStyle.THIN);
	    bodyStyle.setBorderBottom(BorderStyle.THIN);
	    bodyStyle.setBorderLeft(BorderStyle.THIN);
	    bodyStyle.setBorderRight(BorderStyle.THIN);

	    row = sheet.createRow(rowNo++);
	    cell = row.createCell(0);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("유저 아이디");
	    cell = row.createCell(1);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("유저 이름");
	    cell = row.createCell(2);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("유저 생일");
	    cell = row.createCell(3);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("핸드폰 번호");
	    cell = row.createCell(4);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("이메일");
	    cell = row.createCell(5);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("성별");
	    cell = row.createCell(6);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("수신동의");
	    cell = row.createCell(7);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("프로필");
	    cell = row.createCell(8);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("주소");
	    cell = row.createCell(9);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("LIKE포인트");
	    cell = row.createCell(10);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("가입일");
	    
		for (UserDTO userDTO :  adminUserService.getUserList()) {
			row = sheet.createRow(rowNo++);
	        cell = row.createCell(0);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(userDTO.getUserId());
	        cell = row.createCell(1);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(userDTO.getUserNm());
	        cell = row.createCell(2);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(userDTO.getBirthDT());
	        cell = row.createCell(3);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(userDTO.getHp());
	        cell = row.createCell(4);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(userDTO.getEmail());
	        cell = row.createCell(5);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(userDTO.getSex());
	        cell = row.createCell(6);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(userDTO.getEmailYN());
	        cell = row.createCell(7);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(userDTO.getProfile());
	        cell = row.createCell(8);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(userDTO.getZipcode() +" "+ userDTO.getRoadAddress() +" " + userDTO.getNamujiAddress());
	        cell = row.createCell(9);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(userDTO.getLikePoint());
	        cell = row.createCell(10);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(joinTime.format(userDTO.getJoinDT()));
		} 
	    response.setContentType("ms-vnd/excel");
	    response.setHeader("Content-Disposition", "attachment;filename="+makeFileName);
	    wb.write(response.getOutputStream());
	    wb.close();
	}
	
	@GetMapping("/removeUser")
	public ModelAndView delUser(@RequestParam("removeUserIdList") String removeUserIdList) throws Exception{
		
		String[] temp= removeUserIdList.split(",");
		String[] delUserIdList = new String[temp.length];
		for (int i = 0; i < temp.length; i++) {
			delUserIdList[i] = temp[i];
		}
		adminUserService.deleteUserList(delUserIdList);
		return new ModelAndView("redirect:/admin/management/");
		
	}
	
	
	@GetMapping("/thumbnails")
	public void thumbnails(@RequestParam("fileName") String fileName, HttpServletResponse response) throws Exception {
	
		OutputStream out = response.getOutputStream();
		String filePath = FILE_REPO_PATH + fileName;
		
		File image = new File(filePath);
		if (image.exists()) { 
			Thumbnails.of(image).size(800,800).outputFormat("png").toOutputStream(out);
		}
		byte[] buffer = new byte[1024 * 8];
		out.write(buffer);
		out.close();
	}
	
	@GetMapping("/admindModifyUser")
	public ModelAndView admindModifyUser (@RequestParam("userId") String userId) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("userDTO", adminUserService.getOneUserInfo(userId));
		mv.setViewName("/management/adminModifyUser");
		return mv;
	}
	
	@PostMapping("/admindModifyUser")
	public ModelAndView admindModifyUser (HttpServletRequest request, MultipartHttpServletRequest multipartRequest ) throws Exception {
		Iterator<String> fileList = multipartRequest.getFileNames();
		String fileName= "";
		if (fileList.hasNext()) {
			MultipartFile uploadFile = multipartRequest.getFile(fileList.next());
			if(!uploadFile.getOriginalFilename().isEmpty()) {
				SimpleDateFormat fmt = new SimpleDateFormat("yyyymmdd");
				fileName= fmt.format(new Date()) + "_" + UUID.randomUUID() + "_" + uploadFile.getOriginalFilename();
				uploadFile.transferTo(new File(FILE_REPO_PATH+fileName));
				new File(FILE_REPO_PATH + multipartRequest.getParameter("beforeFileName")).delete();
			}
		}
		UserDTO userDTO = new UserDTO();
		userDTO.setUserId(multipartRequest.getParameter("userId"));
		userDTO.setUserNm(multipartRequest.getParameter("userNm"));
		userDTO.setEmail(multipartRequest.getParameter("email"));
		userDTO.setBirthDT(multipartRequest.getParameter("birthDT"));
		userDTO.setHp(multipartRequest.getParameter("hp"));
		userDTO.setZipcode(multipartRequest.getParameter("zipcode"));
		userDTO.setRoadAddress(multipartRequest.getParameter("roadAddress"));
		userDTO.setJibunAddress(multipartRequest.getParameter("jibunAddress"));
		userDTO.setNamujiAddress(multipartRequest.getParameter("namujiAddress"));
		userDTO.setProfile(fileName);
		adminUserService.modifyUser(userDTO);
		return new ModelAndView("redirect:/admin/management/");
	}
}
