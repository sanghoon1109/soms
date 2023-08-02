package com.application.soms.contact.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.application.soms.contact.dto.ContactDTO;
import com.application.soms.contact.service.ContactService;

@Controller
@RequestMapping("/contact")
public class ContactController {

	@Autowired
	private ContactService contactService;
	
	@PostMapping("/addContact")
	public ResponseEntity<Object> addContact(ContactDTO contactDTO, HttpServletRequest request) throws Exception {
		
		System.out.println("문의 :  " + contactDTO);
		
		contactService.addContact(contactDTO);
		
		String jsScript = "<script>";
		jsScript += "alert('문의가 등록되었습니다.');";
		jsScript += "location.href='" + request.getContextPath() + "/';";
		jsScript += "</script>";	
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
	}
	
}
