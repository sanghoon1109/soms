package com.application.soms.myPage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.application.soms.member.dto.MemberDTO;
import com.application.soms.myPage.dao.MyPageDAO;
import com.application.soms.payment.dto.PaymentDTO;

@Service
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	private MyPageDAO myPageDAO;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Override
	public MemberDTO getMemberId(String memberId) throws Exception {
		return myPageDAO.selectOneMyPage(memberId);
	}

	@Override
	public boolean validateCheckId(MemberDTO memberDTO) throws Exception {
		
		String checkPasswd = myPageDAO.selectOneCheckPasswd(memberDTO.getMemberId());
		
		if (bCryptPasswordEncoder.matches(memberDTO.getPasswd(), checkPasswd)) {
			return true;
		}
		
		return false;
	}

	@Override
	public void addInfo(MemberDTO memberDTO) throws Exception {
		myPageDAO.insertAddInfo(memberDTO);
	}

	@Override
	public String getExistingProfile(String memberId) throws Exception {
		return myPageDAO.selectOneProfile(memberId);
	}

	@Override
	public void changeProfile(MemberDTO memberDTO) throws Exception {
		myPageDAO.updateReplyProfile(memberDTO);
	}

	@Override
	public PaymentDTO getMembership(String memberId) throws Exception {
		return myPageDAO.selectOneMembership(memberId);
	}
	
	
	
}
