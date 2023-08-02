package com.application.soms.myPage.dao;

import com.application.soms.member.dto.MemberDTO;
import com.application.soms.payment.dto.PaymentDTO;

public interface MyPageDAO {

	public MemberDTO selectOneMyPage(String memberId) throws Exception;
	public String selectOneCheckPasswd(String memberId) throws Exception;
	public void insertAddInfo(MemberDTO memberDTO) throws Exception;
	public String selectOneProfile(String memberId) throws Exception;
	public void updateReplyProfile(MemberDTO memberDTO) throws Exception;
	public PaymentDTO selectOneMembership(String memberId) throws Exception;
}
