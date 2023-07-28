package com.application.soms.goods.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import com.application.soms.goods.dto.GoodsBatchDTO;
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
		mv.addObject("dayList", goodsService.getDayViewList());
		List<GoodsBatchDTO> dayList = goodsService.getDayViewList();
		for (GoodsBatchDTO goodsBatchDTO : dayList) {
			System.out.println("DAY리스트" + goodsBatchDTO);
		}
		mv.addObject("weekList", goodsService.getWeekViewList());
		List<GoodsBatchDTO> weekList = goodsService.getWeekViewList();
		for (GoodsBatchDTO goodsBatchDTO : weekList) {
			System.out.println("일주일 리스트 : " + goodsBatchDTO);
		}
		mv.addObject("monthList", goodsService.getMonthViewList());
		List<GoodsBatchDTO> monthList = goodsService.getMonthViewList();
		for (GoodsBatchDTO goodsBatchDTO : monthList) {
			System.out.println("한달 리스트 : " + goodsBatchDTO);
		}
		mv.addObject("replyList", goodsService.getNewReplyList());
		List<GoodsDTO> replyList = goodsService.getNewReplyList();
		for (GoodsDTO goodsDTO : replyList) {
			System.out.println("댓글 확인 : " + goodsDTO);
		}
		
		
		return mv;
	}
	
	
	
	@GetMapping("/goods/goodsDetail")
	public ModelAndView goodsDetail(@RequestParam("goodsCd") int goodsCd,@RequestParam("memberId") String memberId) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/goods/goodsDetail");
		mv.addObject("goodsDTO", goodsService.getOneGoodsDetail(goodsCd));
		mv.addObject("memberDTO", goodsService.getMemberId(memberId));
		mv.addObject("replyList", goodsService.getReplyList(goodsCd));
		mv.addObject("rankList", goodsService.getRankList());
		mv.addObject("replyCnt", goodsService.getReplyCnt(goodsCd));
			
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
	public ModelAndView goodsList(@RequestParam("sort") String sort ,@RequestParam("memberId") String memberId, HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		session.setAttribute("memberId", request.getParameter("memberId"));
		mv.setViewName("/goods/goodsList");
		mv.addObject("sort", sort);
		mv.addObject("memberDTO", goodsService.getMemberId(memberId));
		mv.addObject("dayList", goodsService.getDayViewList());
		mv.addObject("weekList", goodsService.getWeekViewList());
		mv.addObject("monthList", goodsService.getMonthViewList());
		int onePageViewCnt = 6;
		
		if (request.getParameter("onePageViewCnt") != null) {
			onePageViewCnt = Integer.parseInt(request.getParameter("onePageViewCnt"));
		}
		
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
		jsScript += "alert('댓글이 등록되었습니다.');";
		jsScript += "location.href='" + request.getContextPath() + "/goods/goodsDetail?goodsCd="+ goodsCd +"&memberId=" + memberDTO.getMemberId() + "';";
		jsScript += "</script>";	
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
	}
	
	@GetMapping("/goods/goodsSearch")
	public ModelAndView search(@RequestParam("search") String search, HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		session.setAttribute("memberId", request.getParameter("memberId"));
		mv.setViewName("/goods/goodsSearch");
		
		System.out.println("시청 등급 : " + request.getParameter("classification"));
		
		if(request.getParameter("classification") != null) {
			mv.addObject("search", request.getParameter("classification"));
			mv.addObject("searchList", goodsService.goodsSearchList((String)request.getParameter("classification")));
		}
		else {
			mv.addObject("search", search);
			mv.addObject("searchList", goodsService.goodsSearchList(search));
		}
		
		List<GoodsDTO> list = goodsService.goodsSearchList(search);
		for (GoodsDTO goodsDTO : list) {
			System.out.println("검색 : " + goodsDTO);
		}
		
		return mv;
	}
	
	
	
}
