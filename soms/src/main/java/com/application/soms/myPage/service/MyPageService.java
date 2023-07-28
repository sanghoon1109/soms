package com.application.soms.myPage.service;

import org.springframework.stereotype.Service;

import com.application.soms.member.dto.MemberDTO;

@Service
public interface MyPageService {

	public MemberDTO getMemberId(String memberId) throws Exception;
	public boolean validateCheckId(MemberDTO memberDTO) throws Exception;
	public void addInfo(MemberDTO memberDTO) throws Exception;
	public String getExistingProfile(String memberId) throws Exception;
	public void changeProfile(MemberDTO memberDTO) throws Exception;
	
}
