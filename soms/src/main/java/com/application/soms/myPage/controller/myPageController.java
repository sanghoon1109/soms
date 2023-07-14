package com.application.soms.myPage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.application.soms.myPage.service.myPageService;

@Controller
@RequestMapping("/myPage")
public class myPageController {

	@Autowired
	private myPageService myPageservice;
	
	@GetMapping("/myInfo")
	public ModelAndView myInfo() {
		return new ModelAndView("/myPage/myInfo");
	}
	
}
