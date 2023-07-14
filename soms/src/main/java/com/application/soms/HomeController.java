package com.application.soms;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	

	
	@GetMapping("/main")
	public String home2() {
		
		return "/main";
	}
	
	
	@GetMapping("/contact")
	public String home1() {
		
		return "/contact";
	}
	
	@GetMapping("/customerCenter")
	public String home3() {
		
		return "/customerCenter";
	}
	
}
