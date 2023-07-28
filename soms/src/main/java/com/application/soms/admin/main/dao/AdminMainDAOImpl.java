package com.application.soms.admin.main.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminMainDAOImpl implements AdminMainDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int selectOneGoodsCnt() throws Exception {
		return sqlSession.selectOne("adminMain.selectOneGoodsCnt");
	}

	@Override
	public int selectOneMemberCnt() throws Exception {
		return sqlSession.selectOne("adminMain.selectOneMemberCnt");
	}
	
	
}
