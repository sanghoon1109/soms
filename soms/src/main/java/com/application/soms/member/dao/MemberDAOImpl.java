package com.application.soms.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.soms.member.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertMember(MemberDTO memberDTO) throws Exception {
		sqlSession.insert("member.insertMember" , memberDTO);
	}

}
