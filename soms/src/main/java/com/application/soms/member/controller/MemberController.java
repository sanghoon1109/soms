package com.application.soms.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.application.soms.member.dto.MemberDTO;
import com.application.soms.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@GetMapping("/signup")
	public ModelAndView signup() {
		
		return new ModelAndView("/member/signup");
	}
	
	@PostMapping("/signup")
	public ResponseEntity<Object> signUp(MemberDTO memberDTO , HttpServletRequest request) throws Exception {
	    
		System.out.println("memberDTO : " + memberDTO);
		memberService.addMember(memberDTO);
		
		String jsScript = "<script>";
			  jsScript += " alert('회원가입되었습니다.');";
			  jsScript += " location.href='" + request.getContextPath() + "/';";
			  jsScript += " </script>";
		
		HttpHeaders responseHeaders = new HttpHeaders();
	    responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
		
	} 
	
	
	@GetMapping("/login")
	public ModelAndView login() {
		
		return new ModelAndView("/member/login");
	}
	
}
