package com.application.soms.goods.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public List<GoodsDTO> getDayViewList() throws Exception {
		return sqlSession.selectList("goods.getDayViewList");
	}

	@Override
	public MemberDTO selectOneMemberId(String memberId) throws Exception {
		return sqlSession.selectOne("goods.selectOneMemberId", memberId);
	}

	@Override
	public void insertReply(ReplyDTO replyDTO) throws Exception {
		sqlSession.insert("goods.insertReply", replyDTO);
	}




	
	
	
}
