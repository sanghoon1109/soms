package com.application.soms.payment.dao;

import java.util.List;

import com.application.soms.member.dto.MemberDTO;
import com.application.soms.payment.dto.PaymentDTO;

public interface PaymentDAO {
	
	public MemberDTO selectOnePayInfo(String memberId) throws Exception;
	public void insertPhonePayment(PaymentDTO paymentDTO) throws Exception;
	public void insertCardPayment(PaymentDTO paymentDTO) throws Exception;
	public void updateDaysLeft() throws Exception;
	public List<PaymentDTO> selectListDaysList() throws Exception;
	public void deleteMembership(PaymentDTO paymentDTO) throws Exception;
	public void updateTotalPayment(PaymentDTO paymentDTO) throws Exception;
	public PaymentDTO selectOneGetMemberId(String memberId) throws Exception;
	public void updateExistPhonePayment(PaymentDTO paymentDTO) throws Exception;
	public void updateExistCardPayment(PaymentDTO paymentDTO) throws Exception;
}
