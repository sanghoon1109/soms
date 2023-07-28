package com.application.soms.payment.service;

import com.application.soms.member.dto.MemberDTO;
import com.application.soms.payment.dto.PaymentDTO;

public interface PaymentService {
	public MemberDTO paymentInfo(String memberId) throws Exception;
 	public void phonePayment(PaymentDTO paymentDTO) throws Exception;
 	public void cardPayment(PaymentDTO paymentDTO) throws Exception;
 	public void daysLeftDeduction() throws Exception;
	
}
