package com.application.soms.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.application.soms.member.dto.MemberDTO;
import com.application.soms.member.service.MemberService;

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
	
	@PostMapping("/login")
	public ResponseEntity<Object> login(MemberDTO memberDTO, HttpServletRequest request) throws Exception {
		
		String jsScript = "";
		
		if(memberService.login(memberDTO).equals("true")) {
			HttpSession session = request.getSession();
			session.setAttribute("memberId", memberDTO.getMemberId());
			session.setAttribute("role", "client");
			session.setMaxInactiveInterval(60 * 30);
			
			jsScript += "<script>";
			jsScript += "location.href='" + request.getContextPath() + "/';";
			jsScript += "</script>";		
		}
		else {
			jsScript += "<script>";
			jsScript += "alert('아이디와 비밀번호를 확인해주세요');";
			jsScript += " history.go(-1);";
			jsScript += "</script>";			
		}
		
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
	
	}
	
	@GetMapping("/logout")
	public ResponseEntity<Object> logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		
		String jsScript = "";
		jsScript += "<script>";
		jsScript += "alert('로그아웃 되었습니다.');";
		jsScript += "location.href='" + request.getContextPath() + "/';";
		jsScript += "</script>";
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(jsScript ,responseHeaders, HttpStatus.OK);
	}
	
	@GetMapping("/checkDuplicatedId")
	public ResponseEntity<String> checkDuplicate(@RequestParam("memberId") String memberId) throws Exception {
		return new ResponseEntity<String>(memberService.checkDuplicateId(memberId), HttpStatus.OK);
	}
	
	@GetMapping("/forgetPass")
	public ModelAndView forget() {
		return new ModelAndView("/member/forgetPass");
	}
	
	@PostMapping("/checkDuplicatedPasswd")
	public ResponseEntity<Object> checkDuplicatedPasswd(MemberDTO memberDTO) throws Exception {
		return new ResponseEntity<Object>(memberService.checkDuplicatePasswd(memberDTO), HttpStatus.OK);
	}
	
	@GetMapping("/removeMember")
	public ResponseEntity<String> removeMember(@RequestParam("memberId") String memberId, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		session.invalidate();
		memberService.removeMember(memberId);
		
		String jsScript = "<script>";
		jsScript += "location.href='" + request.getContextPath() + "/';";
		jsScript += "</script>";
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<String>(jsScript, responseHeaders, HttpStatus.OK);
	}

	@GetMapping("/membership")
	public ModelAndView membership(String memberId) {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/member/membership");
		mv.addObject("memberId", memberId);
		
		return mv;
	}
	
	@PostMapping("/checkMembership")
	public ResponseEntity<String> checkMembership(@RequestParam("memberId") String memberId) throws Exception {
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<String>(memberService.checkMembership(memberId), responseHeaders, HttpStatus.OK);
	}
	
	
}
