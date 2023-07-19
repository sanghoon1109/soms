package com.application.soms.goods.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.application.soms.goods.dto.GoodsDTO;
import com.application.soms.goods.dto.ReplyDTO;
import com.application.soms.goods.service.GoodsService;
import com.application.soms.member.dto.MemberDTO;

@Controller
public class GoodsController {

	@Autowired
	private GoodsService goodsService;
	
	@GetMapping("/")
	public ModelAndView main() throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/main");
		mv.addObject("steadyList", goodsService.getSteadyList());
		mv.addObject("popularList", goodsService.getPopularList());
		mv.addObject("bestList", goodsService.getBestList());
		mv.addObject("generalList", goodsService.getGeneralList());
		mv.addObject("newList", goodsService.getNewList());
		
		return mv;
	}
	
	
	
	@GetMapping("/goods/goodsDetail")
	public ModelAndView goodsDetail(@RequestParam("goodsCd") int goodsCd,@RequestParam("memberId") String memberId) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/goods/goodsDetail");
		mv.addObject("goodsDTO", goodsService.getOneGoodsDetail(goodsCd));
		mv.addObject("memberDTO", goodsService.getMemberId(memberId));
		System.out.println("memberId : " + memberId);
		System.out.println("memberDTO" + goodsService.getMemberId(memberId));
		return mv;
		
	}
	
	@GetMapping("/goods/goodsWatching")
	public ModelAndView goodsWatching(@RequestParam("goodsCd") int goodsCd) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/goods/goodsWatching");
		mv.addObject("goodsDTO", goodsService.getGoodsDetail(goodsCd));
		
		return mv;
		
	}
	
	@GetMapping("/goods/goodsList")
	public ModelAndView goodsList(@RequestParam("sort") String sort , HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/goods/goodsList");
		mv.addObject("sort", sort);
		
		int onePageViewCnt = 6;
		
		if (request.getParameter("onePageViewCnt") != null) {
			onePageViewCnt = Integer.parseInt(request.getParameter("onePageViewCnt"));
		}
		System.out.println("onePageViewCnt : " + onePageViewCnt);
		String temp = request.getParameter("currentPageNumber");
		if (temp == null) {
			temp = "1";
		}
		int currentPageNumber = Integer.parseInt(temp);
		
		int allGoodsCnt = goodsService.getGoodsCnt(sort);
		System.out.println("allGoodsCnt : " + allGoodsCnt);
		
		int allPageCnt = allGoodsCnt / onePageViewCnt + 1;
		System.out.println("allPageCnt : " + allPageCnt);
		
		if(allGoodsCnt % onePageViewCnt == 0) allPageCnt--;
		
		int startPage = (currentPageNumber - 1) / 5 * 5 + 1;
		System.out.println("startPage : " + startPage);
		if (startPage == 0) {
			startPage = 1;
		}
		
		int endPage = startPage + 4;
		
		if (endPage > allPageCnt) endPage = allPageCnt;
		
		int startBoardIdx = (currentPageNumber - 1) * onePageViewCnt;
		
		mv.addObject("startPage"         , startPage);
		mv.addObject("endPage"           , endPage);
		mv.addObject("allGoodsCnt"   	 , allGoodsCnt);
		mv.addObject("allPageCnt"   	 , allPageCnt);
		mv.addObject("onePageViewCnt"    , onePageViewCnt);
		mv.addObject("currentPageNumber" , currentPageNumber);
		mv.addObject("startBoardIdx"     , startBoardIdx);
		
		Map<String, Object> goodsMap = new HashMap<String, Object>();
		goodsMap.put("onePageViewCnt", onePageViewCnt);
		goodsMap.put("startBoardIdx", startBoardIdx);
		goodsMap.put("sort", sort);
		mv.addObject("allGoodsList", goodsService.getAllGoodsList(goodsMap));
		
		
		System.out.println("endPage : " + endPage);
		List<GoodsDTO> goodsList = goodsService.getAllGoodsList(goodsMap);
		for (GoodsDTO goodsDTO : goodsList) {
			System.out.println(goodsDTO);
		}
		
		return mv;
	}
	
	@PostMapping("/goods/addReply")
	public ResponseEntity<Object> addReply(MemberDTO memberDTO, int goodsCd, String replyContent, HttpServletRequest request) throws Exception {
		
		ReplyDTO replyDTO = new ReplyDTO();
		replyDTO.setMemberId(memberDTO.getMemberId());
		replyDTO.setMemberNm(memberDTO.getMemberNm());
		replyDTO.setMemberProfile(memberDTO.getProfile());
		replyDTO.setGoodsCd(goodsCd);
		replyDTO.setReplyContent(replyContent);
		
		goodsService.addReply(replyDTO);
		
		String jsScript = "<script>";
		jsScript += "alert('리뷰가 등록되었습니다.');";
		jsScript += "location.href='" + request.getContextPath() + "/';";
		jsScript += "</script>";	
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
	}
	
	
}
