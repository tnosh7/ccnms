package com.application.ccnms.admin.shop.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.application.ccnms.admin.shop.service.AdminShopService;
import com.application.ccnms.shop.dto.ShopDTO;

@Controller
@RequestMapping("/admin/shop")
public class AdminShopController {

	@Autowired
	private AdminShopService adminShopService;
	
	
	@GetMapping("/shopList")
	public ModelAndView shopManagement(@RequestParam(required =false, value="searchWord")String searchWord, @RequestParam(required =false, value="searchKey")String searchKey) throws Exception{
		ModelAndView mv = new ModelAndView();
		if (searchWord == null) {
			mv.addObject("shopList", adminShopService.getShopList());
		}
		else {
			Map<String,Object> searchMap= new HashMap<String, Object>();
			searchMap.put("searchWord", searchWord);
			searchMap.put("searchKey", searchKey);
			mv.addObject("shopList", adminShopService.getSearchShopList(searchMap));
		}
		mv.setViewName("/admin/shop/shopList");
		return mv;
	}
	
	@GetMapping("/productAdd")
	public ModelAndView productAdd() throws Exception {
		return new ModelAndView("/admin/shop/productAdd");
	}
	
	@GetMapping("/orderList")
	public ModelAndView orderList(@RequestParam(required =false, value="searchWord")String searchWord, @RequestParam(required =false, value="searchKey")String searchKey) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		if (searchWord == null) {
			mv.addObject("orderList", adminShopService.getOrderList());
		}
		else {
			Map<String,Object> searchMap= new HashMap<String, Object>();
			searchMap.put("searchWord", searchWord);
			searchMap.put("searchKey", searchKey);
			mv.addObject("orderList", adminShopService.getSearchOrderList(searchMap));
		}
		mv.setViewName("/admin/shop/orderList");
		return mv;
	}
	
	@GetMapping("/removeProduct") 
	public ModelAndView removeProduct(@RequestParam("removeProductList") String removeProductList)throws Exception {
		
		String []temp = removeProductList.split(",");
		int [] removeProduct = new int[temp.length];
		for (int i = 0; i < temp.length; i++) {
			removeProduct[i] = Integer.parseInt(temp[i]);
		}
		adminShopService.removeProductList(removeProduct);
		return new ModelAndView("redirect:/admin/shop/shopList");
		
	}

	@GetMapping("/shopExcelExport")
	public void shopExcelExport(HttpServletResponse response) throws Exception {
		  
		SimpleDateFormat enrollTime = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat fileSdf = new SimpleDateFormat("yyyy_MM_dd_hh_mm");
		String makeFileTime = fileSdf.format(new Date());
		String makeFileName = makeFileTime + "_shopList.xls";
		
	    Workbook wb = new HSSFWorkbook();
	    Sheet sheet = wb.createSheet("전체상품 리스트");
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
	    cell.setCellValue("판매자");
	    cell = row.createCell(1);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("상품이름");
	    cell = row.createCell(2);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("가격");
	    cell = row.createCell(3);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("할인률");
	    cell = row.createCell(4);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("재고");
	    cell = row.createCell(5);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("배송방법");
	    cell = row.createCell(6);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("배송비");
	    cell = row.createCell(7);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("분류");
	    cell = row.createCell(8);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("태그");
	    cell = row.createCell(9);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("조회수");
	    cell = row.createCell(10);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("등록일");
	    
		for (ShopDTO shopDTO :  adminShopService.getShopList()) {
			row = sheet.createRow(rowNo++);
	        cell = row.createCell(0);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(shopDTO.getWriter());
	        cell = row.createCell(1);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(shopDTO.getProductNm());
	        cell = row.createCell(2);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(shopDTO.getPrice());
	        cell = row.createCell(3);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(shopDTO.getDiscountRate());
	        cell = row.createCell(4);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(shopDTO.getStock());
	        cell = row.createCell(5);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(shopDTO.getDeliveryMethod());
	        cell = row.createCell(6);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(shopDTO.getDeliveryPrice());
	        cell = row.createCell(7);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(shopDTO.getSort());
	        cell = row.createCell(8);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(shopDTO.getTag());
	        cell = row.createCell(9);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(shopDTO.getReadCnt());
	        cell = row.createCell(10);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(enrollTime.format(shopDTO.getEnrollDt()));
		} 
	    response.setContentType("ms-vnd/excel");
	    response.setHeader("Content-Disposition", "attachment;filename="+makeFileName);
	    wb.write(response.getOutputStream());
	    wb.close();
	}
	
	@GetMapping("/orderExcelExport")
	public void orderExcelExport(HttpServletResponse response) throws Exception {
		
		SimpleDateFormat orderTime = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat fileSdf = new SimpleDateFormat("yyyy_MM_dd_hh_mm");
		String makeFileTime = fileSdf.format(new Date());
		String makeFileName = makeFileTime + "_orderList.xls";
		
		Workbook wb = new HSSFWorkbook();
		Sheet sheet = wb.createSheet("주문 리스트");
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
		    cell.setCellValue("주문번호");
		    cell = row.createCell(1);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("상품명");
		    cell = row.createCell(2);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("주문자");
		    cell = row.createCell(3);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("수량");
		    cell = row.createCell(4);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("총액");
		    cell = row.createCell(5);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("주문날짜");
		
		for (Map<String,Object>orderMap :  adminShopService.getOrderList()) {
			row = sheet.createRow(rowNo++);
	        cell = row.createCell(0);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue((Long)orderMap.get("orderCd"));
	        cell = row.createCell(1);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue((String)orderMap.get("productNm"));
	        cell = row.createCell(2);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue((String)orderMap.get("userId"));
	        cell = row.createCell(3);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue((Integer)orderMap.get("orderQty"));
	        cell = row.createCell(4);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue((Integer)orderMap.get("paymentAmt"));
	        cell = row.createCell(5);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(orderTime.format(orderMap.get("payOrderTime")));
	        
		} 
		response.setContentType("ms-vnd/excel");
		response.setHeader("Content-Disposition", "attachment;filename="+makeFileName);
		wb.write(response.getOutputStream());
		wb.close();
	}
	
	
}
