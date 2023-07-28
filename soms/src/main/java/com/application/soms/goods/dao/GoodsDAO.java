package com.application.soms.goods.dao;

import java.util.List;
import java.util.Map;

import com.application.soms.goods.dto.GoodsBatchDTO;
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
	public MemberDTO selectOneMemberId(String memberId) throws Exception;
	public void insertReply(ReplyDTO replyDTO) throws Exception;
	public List<ReplyDTO> selectListReply(int goodsCd) throws Exception;
	public List<GoodsDTO> selectListDayList() throws Exception;
	public void insertDayView(GoodsDTO goodsDTO) throws Exception;
	public List<GoodsBatchDTO> selectListDayView() throws Exception;
	public void deleteBatchView() throws Exception;
	public List<GoodsBatchDTO> selectListWeekView() throws Exception;
	public List<GoodsBatchDTO> selectListMonthView() throws Exception;
	public List<GoodsDTO> selectListWeekList() throws Exception;
	public void deleteWeekBatchView() throws Exception;
	public void insertWeekView(GoodsDTO goodsDTO) throws Exception;
	public void resetWeekViewCnt() throws Exception;
	public void deleteMonthBatchView() throws Exception;
	public List<GoodsDTO> selectListMonthList() throws Exception;
	public void insertMonthView(GoodsDTO goodsDTO) throws Exception;
	public void resetMonthViewCnt() throws Exception;
	public List<GoodsDTO> getSelectListGoodsSearch(String search) throws Exception;
	public List<GoodsDTO> selectListRank() throws Exception;
	public int selectOneReplyCnt(int goodsCd) throws Exception;
	public List<GoodsDTO> selectListNewReply() throws Exception;
	
}
