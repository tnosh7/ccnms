package com.application.ccnms.contact.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.application.ccnms.contact.dto.ContactDTO;
import com.application.ccnms.contact.service.ContactService;

@Controller
@RequestMapping("/contact")
public class ContactController {


	private ContactService contactService;
	
	
	@Autowired
	public ContactController(ContactService contactService) {
		this.contactService = contactService;
	}

	@GetMapping("/user")
	public ModelAndView userContact() {
		return new ModelAndView("/contact/user");
	}
	
	@PostMapping("/addContact")
	public ResponseEntity<Object> userContact(HttpServletRequest request, ContactDTO contactDTO) throws Exception {
		
		System.out.println(contactDTO);
		contactService.addContact(contactDTO);
		
		String jsScript = "<script>";
			   jsScript +="location.href='" + request.getContextPath() + "/';";
			   jsScript +="</script>";
		
	   HttpHeaders responseHeaders = new HttpHeaders();
	   responseHeaders.add("Content-Type", "text/html; charset=utf-8");
	
	   return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
		
	}
	
}
