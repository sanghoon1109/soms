package com.application.soms.goods.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.application.soms.goods.service.GoodsService;

@Controller
public class GoodsController {

	@Autowired
	private GoodsService goodsService;
	
	@GetMapping("/")
	public ModelAndView home() throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/main");
		mv.addObject("goodsList", goodsService.getGoodsList());
		
		return mv;
	}
	
}
