package com.application.soms.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.soms.member.dto.MemberDTO;
import com.application.soms.payment.dto.PaymentDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertMember(MemberDTO memberDTO) throws Exception {
		sqlSession.insert("member.insertMember" , memberDTO);
	}

	@Override
	public MemberDTO selectOneMember(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne("member.selectOneMember" , memberDTO);
	}

	@Override
	public String selectCheckMemberId(String memberId) throws Exception {
		return sqlSession.selectOne("member.selectCheckMemberId", memberId);
	}

	@Override
	public String selectOnePasswd(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne("member.selectOnePasswd", memberDTO);
	}

	@Override
	public void deleteMember(String memberId) throws Exception {
		sqlSession.delete("member.deleteMember", memberId);
	}

	@Override
	public PaymentDTO selectOnePaymentMember(String memberId) throws Exception {
		return sqlSession.selectOne("member.selectOnePaymentMember", memberId);
	}

	@Override
	public String selectCheckMembership(String memberId) throws Exception {
		return sqlSession.selectOne("member.selectCheckMembership", memberId);
	}


}
