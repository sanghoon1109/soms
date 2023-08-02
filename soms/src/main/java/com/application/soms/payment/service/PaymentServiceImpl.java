package com.application.soms.payment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.application.soms.member.dto.MemberDTO;
import com.application.soms.payment.dao.PaymentDAO;
import com.application.soms.payment.dto.PaymentDTO;

@Service
public class PaymentServiceImpl implements PaymentService {

	@Autowired
	private PaymentDAO paymentDAO;
	
	@Override
	public MemberDTO paymentInfo(String memberId) throws Exception {
		return paymentDAO.selectOnePayInfo(memberId);
	}

	@Override
	public void phonePayment(PaymentDTO paymentDTO) throws Exception {
		paymentDAO.insertPhonePayment(paymentDTO);
	}

	@Override
	public void cardPayment(PaymentDTO paymentDTO) throws Exception {
		paymentDAO.insertCardPayment(paymentDTO);
	}

	@Override
	@Scheduled(cron="59 40 14 * * *")
	public void daysLeftDeduction() throws Exception {
		paymentDAO.updateDaysLeft();
		List<PaymentDTO> checkDaysLeftList = paymentDAO.selectListDaysList();
		for (PaymentDTO paymentDTO : checkDaysLeftList) {
			paymentDAO.deleteMembership(paymentDTO);
		}
	}

	@Override
	public void addTotalPayment(PaymentDTO paymentDTO) throws Exception {
		paymentDAO.updateTotalPayment(paymentDTO);
	}

	@Override
	public boolean getExistingPaymentId(PaymentDTO paymentDTO) throws Exception {
		
		if(paymentDAO.selectOneGetMemberId(paymentDTO.getMemberId()) != null) {
			return true;
		}
		
		return false;
	}

	@Override
	public void existPhonePayment(PaymentDTO paymentDTO) throws Exception {
		paymentDAO.updateExistPhonePayment(paymentDTO);
	}

	@Override
	public void existCardPayment(PaymentDTO paymentDTO) throws Exception {
		paymentDAO.updateExistCardPayment(paymentDTO);
	}
	
	
	
}
