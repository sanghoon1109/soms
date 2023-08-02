package com.application.soms.payment.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.soms.member.dto.MemberDTO;
import com.application.soms.payment.dto.PaymentDTO;

@Repository
public class PaymentDAOImpl implements PaymentDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public MemberDTO selectOnePayInfo(String memberId) throws Exception {
		return sqlSession.selectOne("payment.selectOnePayInfo", memberId);
	}

	@Override
	public void insertPhonePayment(PaymentDTO paymentDTO) throws Exception {
		sqlSession.insert("payment.insertPhonePayment", paymentDTO);
	}

	@Override
	public void insertCardPayment(PaymentDTO paymentDTO) throws Exception {
		sqlSession.insert("payment.insertCardPayment", paymentDTO);
	}

	@Override
	public void updateDaysLeft() throws Exception {
		sqlSession.update("payment.updateDaysLeft");
	}

	@Override
	public List<PaymentDTO> selectListDaysList() throws Exception {
		return sqlSession.selectList("payment.selectListDaysList");
	}

	@Override
	public void deleteMembership(PaymentDTO paymentDTO) throws Exception {
		sqlSession.update("payment.deleteMembership", paymentDTO);
	}

	@Override
	public void updateTotalPayment(PaymentDTO paymentDTO) throws Exception {
		sqlSession.update("payment.updateTotalPayment", paymentDTO);
	}

	@Override
	public PaymentDTO selectOneGetMemberId(String memberId) throws Exception {
		return sqlSession.selectOne("payment.selectOneGetMemberId", memberId);
	}

	@Override
	public void updateExistPhonePayment(PaymentDTO paymentDTO) throws Exception {
		sqlSession.update("payment.updateExistPhonePayment", paymentDTO);
	}

	@Override
	public void updateExistCardPayment(PaymentDTO paymentDTO) throws Exception {
		sqlSession.update("payment.updateExistCardPayment", paymentDTO);
	}
	
}
