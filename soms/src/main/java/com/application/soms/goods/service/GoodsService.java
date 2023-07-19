package com.application.soms.goods.service;

import java.util.List;
import java.util.Map;

import com.application.soms.goods.dto.GoodsDTO;
import com.application.soms.goods.dto.ReplyDTO;
import com.application.soms.member.dto.MemberDTO;

public interface GoodsService {

	public List<GoodsDTO> getGoodsList() throws Exception;
	public List<GoodsDTO> getDetailGoodsList(String sort) throws Exception;
	public List<GoodsDTO> getNewList() throws Exception;
	public List<GoodsDTO> getSteadyList() throws Exception;
	public List<GoodsDTO> getPopularList() throws Exception;
	public List<GoodsDTO> getBestList() throws Exception;
	public List<GoodsDTO> getGeneralList() throws Exception;
	public GoodsDTO getGoodsDetail(int goodsCd) throws Exception;
	public GoodsDTO getOneGoodsDetail(int goodsCd) throws Exception;
	public int getGoodsCnt(String sort) throws Exception;
	public List<GoodsDTO> getAllGoodsList(Map<String, Object> goodsMap) throws Exception;
	public List<GoodsDTO> getDayViewCnt() throws Exception;
	public void getWeekViewCnt() throws Exception;
	public void resetDayViewCnt() throws Exception;
	public void getMonthViewCnt() throws Exception;
	public MemberDTO getMemberId(String memberId) throws Exception;
	public void addReply(ReplyDTO replyDTO) throws Exception;
	
}
