package com.application.soms;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	
	
	@GetMapping("/customerCenter")
	public String home3() {
		
		return "/customerCenter";
	}
	@GetMapping("/contact")
	public String contact() {
		
		return "/contact";
	}
	
	
}
