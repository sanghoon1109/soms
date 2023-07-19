package com.application.soms.goods.dao;

import java.util.List;
import java.util.Map;

import com.application.soms.goods.dto.GoodsDTO;
import com.application.soms.goods.dto.ReplyDTO;
import com.application.soms.member.dto.MemberDTO;

public interface GoodsDAO {

	public List<GoodsDTO> selectGoodsList() throws Exception;
	public List<GoodsDTO> selectDetailGoodsList(String sort) throws Exception;
	public List<GoodsDTO> selectNewList() throws Exception;
	public List<GoodsDTO> selectSteadyList() throws Exception;
	public List<GoodsDTO> selectPopularList() throws Exception;
	public List<GoodsDTO> selectBestList() throws Exception;
	public List<GoodsDTO> selectGeneralList() throws Exception;
	public GoodsDTO selectOneGoodsDetail(int goodsCd) throws Exception;
	public GoodsDTO selectGoodsDetail(int goodsCd) throws Exception;
	public void updateViewCnt(int goodsCd) throws Exception;
	public int selectOneGoodsCnt(String sort) throws Exception;
	public List<GoodsDTO> selectOneAllGoodsList(Map<String, Object> goodsMap) throws Exception;
	public void updateDayViewCnt() throws Exception;
	public void resetDayViewCnt() throws Exception;
	public List<GoodsDTO> getDayViewList() throws Exception;
	public MemberDTO selectOneMemberId(String memberId) throws Exception;
	public void insertReply(ReplyDTO replyDTO) throws Exception;
	
}
