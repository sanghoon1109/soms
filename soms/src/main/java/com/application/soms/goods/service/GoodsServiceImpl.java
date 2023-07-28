package com.application.soms.goods.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.application.soms.goods.dao.GoodsDAO;
import com.application.soms.goods.dto.GoodsBatchDTO;
import com.application.soms.goods.dto.GoodsDTO;
import com.application.soms.goods.dto.ReplyDTO;
import com.application.soms.member.dto.MemberDTO;

@Service
public class GoodsServiceImpl implements GoodsService {

	@Autowired
	private GoodsDAO goodsDAO;

	@Override
	public List<GoodsDTO> getGoodsList() throws Exception {
		return goodsDAO.selectGoodsList();
	}

	@Override
	public List<GoodsDTO> getDetailGoodsList(String sort) throws Exception {
		return goodsDAO.selectDetailGoodsList(sort);
	}

	@Override
	public List<GoodsDTO> getNewList() throws Exception {
		return goodsDAO.selectNewList();
	}

	@Override
	public List<GoodsDTO> getSteadyList() throws Exception {
		return goodsDAO.selectSteadyList();
	}

	@Override
	public List<GoodsDTO> getPopularList() throws Exception {
		return goodsDAO.selectPopularList();
	}

	@Override
	public List<GoodsDTO> getBestList() throws Exception {
		return goodsDAO.selectBestList();
	}

	@Override
	public List<GoodsDTO> getGeneralList() throws Exception {
		return goodsDAO.selectGeneralList();
	}

	@Override
	@Transactional
	public GoodsDTO getGoodsDetail(int goodsCd) throws Exception {
		goodsDAO.updateViewCnt(goodsCd);
		return goodsDAO.selectOneGoodsDetail(goodsCd);
	}

	@Override
	public int getGoodsCnt(String sort) throws Exception {
		return goodsDAO.selectOneGoodsCnt(sort);
	}

	@Override
	public List<GoodsDTO> getAllGoodsList(Map<String, Object> goodsMap) throws Exception {
		return goodsDAO.selectOneAllGoodsList(goodsMap);
	}
	
	@Override
	public GoodsDTO getOneGoodsDetail(int goodsCd) throws Exception {
		return goodsDAO.selectGoodsDetail(goodsCd);
	}

	
	
	@Override
	@Scheduled(cron="59 59 23 * * *")
	@Transactional
	public void insertDayView() throws Exception {
		goodsDAO.updateDayViewCnt();	
		goodsDAO.deleteBatchView();
		List<GoodsDTO> goodsList = goodsDAO.selectListDayList();
		for (GoodsDTO goodsDTO : goodsList) {
			goodsDAO.insertDayView(goodsDTO);
		}
		goodsDAO.resetDayViewCnt();
	}
	
	@Override
	@Scheduled(cron="59 57 23 * * MON")
	@Transactional
	public void getWeekViewCnt() throws Exception {
		goodsDAO.deleteWeekBatchView();
		List<GoodsDTO> goodsList = goodsDAO.selectListWeekList();
		for (GoodsDTO goodsDTO : goodsList) {	
			goodsDAO.insertWeekView(goodsDTO);
		}
		goodsDAO.resetWeekViewCnt();
	}

	@Override
	@Scheduled(cron="0 0 0 1 * *")
	@Transactional
	public void getMonthViewCnt() throws Exception {
		goodsDAO.deleteMonthBatchView();
		List<GoodsDTO> goodsList = goodsDAO.selectListMonthList();
		for (GoodsDTO goodsDTO : goodsList) {
			goodsDAO.insertMonthView(goodsDTO);
		}
		goodsDAO.resetMonthViewCnt();
		
	}

	@Override
	public MemberDTO getMemberId(String memberId) throws Exception {
		return goodsDAO.selectOneMemberId(memberId);
	}

	@Override
	public void addReply(ReplyDTO replyDTO) throws Exception {
		goodsDAO.insertReply(replyDTO);
	}

	@Override
	public List<ReplyDTO> getReplyList(int goodsCd) throws Exception {
		return goodsDAO.selectListReply(goodsCd);
	}

	@Override
	public List<GoodsBatchDTO> getDayViewList() throws Exception {
		return goodsDAO.selectListDayView();
	}

	@Override
	public List<GoodsBatchDTO> getWeekViewList() throws Exception {
		return goodsDAO.selectListWeekView();
	}

	@Override
	public List<GoodsBatchDTO> getMonthViewList() throws Exception {
		return goodsDAO.selectListMonthView();
	}

	@Override
	public List<GoodsDTO> goodsSearchList(String search) throws Exception {
		return goodsDAO.getSelectListGoodsSearch(search);
	}

	@Override
	public List<GoodsDTO> getRankList() throws Exception {
		return goodsDAO.selectListRank();
	}

	@Override
	public int getReplyCnt(int goodsCd) throws Exception {
		return goodsDAO.selectOneReplyCnt(goodsCd);
	}

	@Override
	public List<GoodsDTO> getNewReplyList() throws Exception {
		return goodsDAO.selectListNewReply();
	}






	
	
	
}
