package com.application.soms.goods.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.application.soms.goods.dto.GoodsDTO;
import com.application.soms.goods.service.GoodsService;

@Controller
public class GoodsController {

	@Autowired
	private GoodsService goodsService;
	
	@GetMapping("/")
	public ModelAndView home() throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/main");
		mv.addObject("steadyList", goodsService.getSteadyList());
		mv.addObject("popularList", goodsService.getPopularList());
		mv.addObject("bestList", goodsService.getBestList());
		mv.addObject("generalList", goodsService.getGeneralList());
		mv.addObject("newList", goodsService.getNewList());
		
		List<GoodsDTO> list = goodsService.getGeneralList();
		
		for (GoodsDTO goodsDTO : list) {
			System.out.println(goodsDTO);
		}
		return mv;
	}
	
	@GetMapping("/goods/goodsList")
	public ModelAndView goodsList(@RequestParam("sort") String sort) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/goods/goodsList");
		mv.addObject("goodsList", goodsService.getDetailGoodsList(sort));
		mv.addObject("sort", sort);
		
		return mv;
	}
	
}
