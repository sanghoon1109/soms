package com.application.soms.myPage.controller;

import java.io.File;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.application.soms.member.dto.MemberDTO;
import com.application.soms.myPage.service.MyPageService;

import net.coobird.thumbnailator.Thumbnails;

@Controller
@RequestMapping("/myPage")
public class MyPageController {

	@Autowired
	private MyPageService myPageservice;
	
	//private final String MEMBER_IMAGE_REPO_PATH = "C:\\member_file_repo\\";					// window
	private final String MEMBER_IMAGE_REPO_PATH = "/var/lib/tomcat9/member_file_repo/";	// linux
	
	
	@GetMapping("/myInfo")
	public ModelAndView myInfo(@RequestParam("memberId") String memberId) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/myPage/myInfo");
		mv.addObject("memberDTO", myPageservice.getMemberId(memberId));
		return mv;
	}
	
	@GetMapping("/addInfo")
	public ModelAndView addInfo(@RequestParam("memberId") String memberId) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/myPage/addInfo");
		mv.addObject("memberDTO", myPageservice.getMemberId(memberId));
		return mv;
	}
	
	@PostMapping("/addInfo")
	public ResponseEntity<Object> addInfo(MultipartHttpServletRequest multipartRequest, HttpServletRequest request) throws Exception {
		
		multipartRequest.setCharacterEncoding("utf-8");
		
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
		String script = "";
		MemberDTO dbMemberDTO = new MemberDTO();
		dbMemberDTO.setMemberId(multipartRequest.getParameter("memberId"));
		dbMemberDTO.setPasswd(multipartRequest.getParameter("passwd"));
		
		if (myPageservice.validateCheckId(dbMemberDTO)) {
			
			MemberDTO memberDTO = new MemberDTO();
			memberDTO.setMemberId(multipartRequest.getParameter("memberId"));
			memberDTO.setSex(multipartRequest.getParameter("sex"));
			memberDTO.setDateBirth(multipartRequest.getParameter("dateBirth"));
			memberDTO.setHp(multipartRequest.getParameter("hp"));
			if (multipartRequest.getParameter("smsstsYn") == null) memberDTO.setSmsstsYn("N");
			else												   memberDTO.setSmsstsYn("Y");										  
			memberDTO.setZipcode(multipartRequest.getParameter("zipcode"));
			memberDTO.setRoadAddress(multipartRequest.getParameter("roadAddress"));
			memberDTO.setJibunAddress(multipartRequest.getParameter("jibunAddress"));
			memberDTO.setNamujiAddress(multipartRequest.getParameter("namujiAddress"));
			
			
			Iterator<String> file = multipartRequest.getFileNames();
			if (file.hasNext()) {
				
				MultipartFile uploadFile = multipartRequest.getFile(file.next()); 	
				
				if(!uploadFile.getOriginalFilename().isEmpty()) {
					String uploadFileName = UUID.randomUUID() + "_" + uploadFile.getOriginalFilename();
					File f = new File(MEMBER_IMAGE_REPO_PATH + uploadFileName);	
					uploadFile.transferTo(f); 
					System.out.println("프로필 확인 : " + myPageservice.getExistingProfile(memberDTO.getMemberId()));
					if(myPageservice.getExistingProfile(memberDTO.getMemberId()) != null) {
						new File(MEMBER_IMAGE_REPO_PATH + myPageservice.getExistingProfile(memberDTO.getMemberId())).delete();	
					}
					memberDTO.setProfile(uploadFileName);						
				}
				
			}
			myPageservice.addInfo(memberDTO);
			myPageservice.changeProfile(memberDTO);
			
			script += "<script>";
			script += "alert('정보가 입력되었습니다.');";
			script += "location.href='" + request.getContextPath() + "/myPage/myInfo?memberId=" + memberDTO.getMemberId() + "';";
			script += "</script>";
		}
		else {
			script += "<script>";
			script += "alert('비밀번호를 다시 확인해주세요');";
			script += "history.go(-1);";
			script += "</script>";
		}
		
		
		
		HttpHeaders responseHeaders = new HttpHeaders();
	    responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(script, responseHeaders, HttpStatus.OK);
	}
	
	@GetMapping("/thumbnails")
	public void thumbnails(@RequestParam("fileName") String fileName , HttpServletResponse response) throws Exception {
	
		OutputStream out = response.getOutputStream();
		
		File image = new File(MEMBER_IMAGE_REPO_PATH + fileName);
		if (image.exists()) { 
			Thumbnails.of(image).size(800,800).outputFormat("png").toOutputStream(out);
		}
		byte[] buffer = new byte[1024 * 8];
		out.write(buffer);
		out.close();
		
	}
	
	
}
