package com.application.soms.goods.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.application.soms.goods.dao.GoodsDAO;
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
	@Scheduled(cron="59 58 23 * * *")
	@Transactional
	public List<GoodsDTO> getDayViewCnt() throws Exception {
		System.out.println("저녁 12시 배치");
		
		goodsDAO.updateDayViewCnt();
		return goodsDAO.getDayViewList(); // 배치 테이블 따로 생성해서 MAIN에 셀렉트
	}
	
	@Override
	@Scheduled(cron="59 59 23 * * *")
	@Transactional
	public void resetDayViewCnt() throws Exception {
		System.out.println("저녁 12시 금일 조회수 초기화");	
		goodsDAO.resetDayViewCnt();
	}

	@Override
	@Scheduled(cron="59 57 23 * * MON")
	@Transactional
	public void getWeekViewCnt() throws Exception {
		System.out.println("한주치 조회수");
		
	}

	@Override
	@Scheduled(cron="0 0 0 1 * *")
	@Transactional
	public void getMonthViewCnt() throws Exception {
		
	}

	@Override
	public MemberDTO getMemberId(String memberId) throws Exception {
		return goodsDAO.selectOneMemberId(memberId);
	}

	@Override
	public void addReply(ReplyDTO replyDTO) throws Exception {
		goodsDAO.insertReply(replyDTO);
	}





	
	
	
}
