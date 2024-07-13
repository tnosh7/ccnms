package com.application.ccnms.myshop.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.application.ccnms.myshop.dto.CartDTO;
import com.application.ccnms.myshop.dto.KeepDTO;
import com.application.ccnms.myshop.service.MyShopService;
import com.application.ccnms.user.service.UserService;

@Controller
@RequestMapping("/myShop")
public class MyShopController {
	
	private MyShopService myShopService;
	private UserService userService;
	
	@Autowired
	public MyShopController(MyShopService myShopService, UserService userService) {
		this.myShopService = myShopService;
		this.userService = userService;
	}

	@GetMapping("/myCart")
	public ModelAndView myCart(@RequestParam("productCd") long productCd) throws Exception{
		ModelAndView mv = new ModelAndView("/myShop/myCart");
		mv.addObject("shopDTO", myShopService.getShopDTO(productCd));
		return mv;
	}
	
	@GetMapping("/addMyCart")
	public @ResponseBody String addMyCart(@RequestParam("productCd") long productCd, @RequestParam("cartQty") int cartQty, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		CartDTO cartDTO = new CartDTO();
		cartDTO.setUserId(userId);
		cartDTO.setProductCd(productCd);
		cartDTO.setCartQty(cartQty);
		
		String result = "duple";
		if (!myShopService.checkDuplicatedCart(cartDTO)) {
			myShopService.addMyCart(cartDTO);
			session.setAttribute("myCartCnt", userService.getMyCartCnt(userId));
			result = "notDuple";
		}
		return result;
	}
	
	@GetMapping("/cartList")
	public ModelAndView cartList(HttpServletRequest request) throws Exception{
		ModelAndView mv= new ModelAndView("/myShop/cartList");
		HttpSession session = request.getSession();
		mv.addObject("cartList", myShopService.getCartList((String)session.getAttribute("userId")));
		return mv;
	}
	
	@GetMapping("/removeCart")
	public ResponseEntity<Object> removeCart(@RequestParam("cartCdList") String cartCdList, HttpServletRequest request) throws Exception{
		String []temp = cartCdList.split(",");
		int [] removeCartCdList = new int[temp.length];
		
		for (int i = 0; i < temp.length; i++) {
			removeCartCdList[i] = Integer.parseInt(temp[i]);
		}
		myShopService.removeCart(removeCartCdList);
		HttpSession session = request.getSession();
		session.setAttribute("myCartCnt",userService.getMyCartCnt((String)session.getAttribute("userId")));
		
		String jsScript = "<script>";
			   jsScript +="location.href='cartList'";
			   jsScript +="</script>";
			
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type","text/html; charset=UTF-8");
		
		return new ResponseEntity<Object> (jsScript, responseHeaders, HttpStatus.OK);
	}
	
	@GetMapping("/modifyCartQty")
	public ResponseEntity<Object> modifyCartQty(@RequestParam Map<String,Object> updateMap)throws Exception{
		myShopService.modifyCartProductQty(updateMap);
		return new ResponseEntity<Object>(HttpStatus.OK);
	}
	
	@GetMapping("/myKeep")
	public ModelAndView myKeep (HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/myShop/myKeep");
		
		HttpSession session = request.getSession();
		mv.addObject("myKeepList", myShopService.getMyKeepList((String)session.getAttribute("userId")));
		
		return mv;
	}
	
	@GetMapping("/addMyKeep")
	public @ResponseBody String addMyKeep(@RequestParam("productCd") long productCd, @RequestParam("keepQty") int keepQty, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		KeepDTO keepDTO = new KeepDTO();
		keepDTO.setProductCd(productCd);
		keepDTO.setKeepQty(keepQty);
		keepDTO.setUserId(userId);
		
		String result = "duple";
		if (!myShopService.checkDuplicatedKeep(keepDTO)) {
			myShopService.addMyKeep(keepDTO);
			session.setAttribute("myKeepCnt", userService.getMyKeepCnt(userId));
			result ="notDuple";
		}
		return result;
	}
	
	@GetMapping("/removeKeep")
	public ResponseEntity<Object> removeKeep(@RequestParam("keepCdList") String keepCdList, HttpServletRequest request) throws Exception{
		String []temp = keepCdList.split(",");
		int [] removeKeepCdList = new int[temp.length];
		
		for (int i = 0; i < temp.length; i++) {
			removeKeepCdList[i] = Integer.parseInt(temp[i]);
		}
		HttpSession session = request.getSession();
		myShopService.removeKeep(removeKeepCdList);
		session.setAttribute("myKeepCnt", userService.getMyKeepCnt((String)session.getAttribute("userId")));
		String jsScript = "<script>";
			   jsScript +="location.href='myKeep'";
			   jsScript +="</script>";
			
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type","text/html; charset=UTF-8");
		return new ResponseEntity<Object> (jsScript, responseHeaders, HttpStatus.OK);
	}
	
	@GetMapping("/orderList")
	public ModelAndView orderList (HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView("/myShop/orderList");
		mv.addObject("orderList", myShopService.getOrderList((String)session.getAttribute("userId")));
		return mv;
	}
	
	@GetMapping("/orderDetail")
	public ModelAndView orderDetail (@RequestParam Map<String,Object> orderDetailMap, HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView("/myShop/orderDetail");
		mv.addObject("orderDTO", myShopService.getOrderDetail(orderDetailMap));
		mv.addObject("userId", (String)session.getAttribute("userId"));
		return mv;
	}
	
	@GetMapping("/saleList")
	public ModelAndView saleList (HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView("/myShop/saleList");
		mv.addObject("saleList", myShopService.getSaleList((String)session.getAttribute("userId")));
		return mv;
	}
	
	@GetMapping("/saleExcelExport")
	public void saleExcelExport(HttpServletResponse response, HttpServletRequest request) throws Exception {
		  
		SimpleDateFormat orderTime = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		SimpleDateFormat fileSdf = new SimpleDateFormat("yyyy_MM_dd_hh_mm");
		String makeFileTime = fileSdf.format(new Date());
		String makeFileName = makeFileTime + "_saleList.xls";
		
	    Workbook wb = new HSSFWorkbook();
	    Sheet sheet = wb.createSheet("판매리스트");
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
	    cell.setCellValue("포장여부");
	    cell = row.createCell(6);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("주문날짜");
	    
	    HttpSession session = request.getSession();
		for (Map<String,Object>orderMap: myShopService.getSaleList((String)session.getAttribute("userId"))) {
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
	        cell.setCellValue((String)orderMap.get("giftWrapping"));
	        cell = row.createCell(6);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(orderTime.format(orderMap.get("payOrderTime")));
	        
		} 
	    response.setContentType("ms-vnd/excel");
	    response.setHeader("Content-Disposition", "attachment;filename="+makeFileName);
	    wb.write(response.getOutputStream());
	    wb.close();
	}
	
	@GetMapping("/changeDeliveryStatus") 
	public ModelAndView changeDeliveryStatus (@RequestParam("deliveryList") String deliveryList) throws Exception {
		String []temp = deliveryList.split(",");
		int[]changeDeliveryList = new int[temp.length];
		for (int i = 0; i < temp.length; i++) {
			changeDeliveryList[i] = Integer.parseInt(temp[i]);
		}
		myShopService.changeDeliveryStatus(changeDeliveryList);
		return new ModelAndView("redirect:/myShop/mySaleList");
	}
	
	@GetMapping("/mySaleList")
	public ModelAndView mySaleList (HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		mv.addObject("mySaleList", myShopService.getUserSaleList((String)session.getAttribute("userId")));
		mv.setViewName("/myShop/mySaleList");
		return mv;
	}
	@GetMapping("/removeMySale")
	public ModelAndView removeMySale (@RequestParam("removeMySaleList") String removeMySaleList) throws Exception {
		String[]temp = removeMySaleList.split(",");
		int [] removeMySale = new int[temp.length];
		for (int i = 0; i < temp.length; i++) {
			removeMySale[i] = Integer.parseInt(temp[i]);
		}
		myShopService.removeMySaleList(removeMySale);
		return new ModelAndView("redirect:/myShop/mySaleList");
	}
	
	
}
