package com.application.soms.admin.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.application.soms.admin.main.service.AdminMainService;

@Controller
@RequestMapping("/admin")
public class AdminMainController {

	@Autowired
	private AdminMainService adminMainService;
	
	
	@GetMapping("/main")
	public ModelAndView adminMain() throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/main");
		mv.addObject("memberCnt", adminMainService.getMemberCnt());
		mv.addObject("goodsCnt", adminMainService.getGoodsCnt());
		return mv;
	}
	
}
