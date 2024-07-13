package com.application.ccnms.admin.contact.controller;

import java.util.HashMap;
import java.util.Map;

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
	
	private AdminContactService adminContactService;
	
	@Autowired
	public AdminContactController(AdminContactService adminContactService) {
		this.adminContactService = adminContactService;
	}

	@GetMapping("/contactList") 
	public ModelAndView contactList(@RequestParam(required =false, value="searchWord")String searchWord, @RequestParam(required =false, value="searchKey")String searchKey) throws Exception {
		ModelAndView mv = new ModelAndView();
		if (searchWord == null) {
			mv.addObject("contactList", adminContactService.getContactList());
		}
		else {
			Map<String,Object> searchMap= new HashMap<String, Object>();
			searchMap.put("searchWord", searchWord);
			searchMap.put("searchKey", searchKey);
			mv.addObject("contactList", adminContactService.getSearchContactList(searchMap));
		}
		mv.setViewName("/contactList");
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
	
	@GetMapping("/removeContact")
	public ModelAndView removeContact(@RequestParam("removeContactList") String removeContactList) throws Exception {
		String [] temp = removeContactList.split(",");
		int [] removeContact = new int[temp.length];
		for (int i = 0; i < temp.length; i++) {
			removeContact[i] = Integer.parseInt(temp[i]);
		}
		adminContactService.removeContactList(removeContact);
		return new ModelAndView("redirect:/admin/contact/contactList");
		
	}
	
}
	
