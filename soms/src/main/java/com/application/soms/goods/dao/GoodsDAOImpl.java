package com.application.soms.goods.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.soms.goods.dto.GoodsDTO;

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
	
	
	
}
