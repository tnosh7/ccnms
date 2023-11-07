package com.application.ccnms.admin.contact.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.application.ccnms.admin.contact.service.AdminContactService;
import com.application.ccnms.contact.dto.ContactDTO;
import com.application.ccnms.contact.service.ContactService;

@Controller
@RequestMapping("/admin/contact")
public class AdminContactController {

	@Autowired
	private AdminContactService adminContactService;

	@GetMapping("/contactList") 
	public ModelAndView contactList() throws Exception {
		ModelAndView mv = new ModelAndView("/contactList");
		mv.addObject("contactList", adminContactService.getContactList());
		
		return mv;
	}
	
	@GetMapping("/contactDetail")
	public ModelAndView contactDetail(@RequestParam("contactCd") int contactCd) throws Exception {
		ModelAndView mv = new ModelAndView("/contactDetail");
		mv.addObject("contactDTO", adminContactService.getContactDetail(contactCd));
		return mv;
	}
	
	@PostMapping("/addReply")
	public @ResponseBody String addReply(ContactDTO contactDTO, HttpServletRequest request) throws Exception {
		adminContactService.addReply(contactDTO);
		
		String jsScript = "<script>";
			   jsScript+= "location.href='" + request.getContextPath() + "/admin/contact/contactList';";
			   jsScript+= "</script>";
		
		return jsScript;
	}
}
