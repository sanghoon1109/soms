package com.application.soms.myPage.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.soms.member.dto.MemberDTO;

@Repository
public class MyPageDAOImpl implements MyPageDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public MemberDTO selectOneMyPage(String memberId) throws Exception {
		return sqlSession.selectOne("myPage.selectOneMyPage", memberId);
	}

	@Override
	public String selectOneCheckPasswd(String memberId) throws Exception {
		return sqlSession.selectOne("myPage.selectOneCheckPasswd", memberId);
	}

	@Override
	public void insertAddInfo(MemberDTO memberDTO) throws Exception {
		sqlSession.insert("myPage.insertAddInfo", memberDTO);
	}

	@Override
	public String selectOneProfile(String memberId) throws Exception {
		return sqlSession.selectOne("myPage.selectOneProfile", memberId);
	}

	@Override
	public void updateReplyProfile(MemberDTO memberDTO) throws Exception {
		sqlSession.update("myPage.updateReplyProfile", memberDTO);
	}
	
}
