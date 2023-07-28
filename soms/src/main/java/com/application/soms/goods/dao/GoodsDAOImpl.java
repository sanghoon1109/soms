package com.application.soms.goods.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.soms.goods.dto.GoodsBatchDTO;
import com.application.soms.goods.dto.GoodsDTO;
import com.application.soms.goods.dto.ReplyDTO;
import com.application.soms.member.dto.MemberDTO;

@Repository
public class GoodsDAOImpl implements GoodsDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<GoodsDTO> selectGoodsList() throws Exception {
		return sqlSession.selectList("goods.selectGoodsList");
	}

	@Override
	public List<GoodsDTO> selectDetailGoodsList(String sort) throws Exception {
		return sqlSession.selectList("goods.selectDetailGoodsList", sort);
	}

	@Override
	public List<GoodsDTO> selectNewList() throws Exception {
		return sqlSession.selectList("goods.selectNewList");
	}

	@Override
	public List<GoodsDTO> selectSteadyList() throws Exception {
		return sqlSession.selectList("goods.selectSteadyList");
	}

	@Override
	public List<GoodsDTO> selectPopularList() throws Exception {
		return sqlSession.selectList("goods.selectPopularList");
	}

	@Override
	public List<GoodsDTO> selectBestList() throws Exception {
		return sqlSession.selectList("goods.selectBestList");
	}

	@Override
	public List<GoodsDTO> selectGeneralList() throws Exception {
		return sqlSession.selectList("goods.selectGeneralList");
	}

	@Override
	public GoodsDTO selectOneGoodsDetail(int goodsCd) throws Exception {
		return sqlSession.selectOne("goods.selectOneGoodsDetail", goodsCd);
	}
	
	@Override
	public GoodsDTO selectGoodsDetail(int goodsCd) throws Exception {
		return sqlSession.selectOne("goods.selectGoodsDetail", goodsCd);
	}

	@Override
	public void updateViewCnt(int goodsCd) throws Exception {
		sqlSession.update("goods.updateViewCnt", goodsCd);
	}

	@Override
	public int selectOneGoodsCnt(String sort) throws Exception {
		return sqlSession.selectOne("goods.selectOneGoodsCnt", sort);
	}

	@Override
	public List<GoodsDTO> selectOneAllGoodsList(Map<String, Object> goodsMap) throws Exception {
		return sqlSession.selectList("goods.selectOneAllGoodsList", goodsMap);
	}

	@Override
	public void updateDayViewCnt() throws Exception {
		sqlSession.update("goods.updateDayViewCnt");
	}

	@Override
	public void resetDayViewCnt() throws Exception {
		sqlSession.update("goods.resetDayViewCnt");
	}


	@Override
	public MemberDTO selectOneMemberId(String memberId) throws Exception {
		return sqlSession.selectOne("goods.selectOneMemberId", memberId);
	}

	@Override
	public void insertReply(ReplyDTO replyDTO) throws Exception {
		sqlSession.insert("goods.insertReply", replyDTO);
	}

	@Override
	public List<ReplyDTO> selectListReply(int goodsCd) throws Exception {
		return sqlSession.selectList("goods.selectListReply", goodsCd);
	}

	@Override
	public List<GoodsDTO> selectListDayList() throws Exception {
		return sqlSession.selectList("goods.selectListDayList");
	}

	@Override
	public void insertDayView(GoodsDTO goodsDTO) throws Exception {
		sqlSession.insert("goods.insertDayView", goodsDTO);
	}

	@Override
	public List<GoodsBatchDTO> selectListDayView() throws Exception {
		return sqlSession.selectList("goods.selectListDayView");
	}

	@Override
	public void deleteBatchView() throws Exception {
		sqlSession.delete("goods.deleteBatchView");
	}

	@Override
	public List<GoodsBatchDTO> selectListWeekView() throws Exception {
		return sqlSession.selectList("goods.selectListWeekView");
	}

	@Override
	public List<GoodsBatchDTO> selectListMonthView() throws Exception {
		return sqlSession.selectList("goods.selectListMonthView");
	}

	@Override
	public List<GoodsDTO> selectListWeekList() throws Exception {
		return sqlSession.selectList("goods.selectListWeekList");
	}

	@Override
	public void deleteWeekBatchView() throws Exception {
		sqlSession.delete("goods.deleteWeekBatchView");
	}

	@Override
	public void insertWeekView(GoodsDTO goodsDTO) throws Exception {
		sqlSession.insert("goods.insertWeekView", goodsDTO);
	}

	@Override
	public void resetWeekViewCnt() throws Exception {
		sqlSession.update("goods.resetWeekViewCnt");
	}

	@Override
	public void deleteMonthBatchView() throws Exception {
		sqlSession.delete("goods.deleteMonthBatchView");
	}

	@Override
	public List<GoodsDTO> selectListMonthList() throws Exception {
		return sqlSession.selectList("goods.selectListMonthList");
	}

	@Override
	public void insertMonthView(GoodsDTO goodsDTO) throws Exception {
		sqlSession.insert("goods.insertMonthView", goodsDTO);
	}

	@Override
	public void resetMonthViewCnt() throws Exception {
		sqlSession.update("goods.resetMonthViewCnt");
	}

	@Override
	public List<GoodsDTO> getSelectListGoodsSearch(String search) throws Exception {
		return sqlSession.selectList("goods.getSelectListGoodsSearch", search);
	}

	@Override
	public List<GoodsDTO> selectListRank() throws Exception {
		return sqlSession.selectList("goods.selectListRank");
	}

	@Override
	public int selectOneReplyCnt(int goodsCd) throws Exception {
		return sqlSession.selectOne("goods.selectOneReplyCnt", goodsCd);
	}

	@Override
	public List<GoodsDTO> selectListNewReply() throws Exception {
		return sqlSession.selectList("goods.selectListNewReply");
	}







	
	
	
}
