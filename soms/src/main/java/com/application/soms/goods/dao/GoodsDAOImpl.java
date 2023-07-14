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
	
	
	
}
