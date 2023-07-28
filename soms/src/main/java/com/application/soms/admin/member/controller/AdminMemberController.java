package com.application.soms.admin.member.controller;

import java.io.File;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.servlet.ModelAndView;

import com.application.soms.admin.member.dto.AdminMemberDTO;
import com.application.soms.admin.member.service.AdminMemberService;

import net.coobird.thumbnailator.Thumbnails;

@Controller
@RequestMapping("/admin/member")
public class AdminMemberController {

	@Autowired
	private AdminMemberService adminMemberService;
	
	@GetMapping("/adminLogin")
	public ModelAndView adminLogin() throws Exception {
		return new ModelAndView("/admin/member/adminLogin");
	}
	
	@PostMapping("/adminLogin")
	public ResponseEntity<Object> adminLogin(AdminMemberDTO adminDTO, HttpServletRequest request) throws Exception {
		
		String jsScript = "";
		
		if (adminMemberService.adminLogin(adminDTO)) { 	
			
			HttpSession session = request.getSession();		
			session.setAttribute("memberId" , adminDTO.getAdminId());
			session.setAttribute("role" , "admin");
			session.setMaxInactiveInterval(60 * 30);
			jsScript  = "<script>";
			jsScript += " alert('" + adminDTO.getAdminId() + " 님 로그인 되었습니다.');";
			jsScript += " location.href='" + request.getContextPath() + "/admin/main';";
			jsScript += " </script>";
			
		}
		else { 
			
			jsScript  = "<script>";
			jsScript += " alert('로그인에 실패하였습니다. 아이디와 비밀번호를 확인하세요.');";
			jsScript += " history.go(-1);";
			jsScript += " </script>";
			
		}
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
	}
	

	

	
}
