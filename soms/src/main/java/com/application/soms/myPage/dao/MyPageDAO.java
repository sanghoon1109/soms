package com.application.soms.myPage.dao;

import com.application.soms.member.dto.MemberDTO;

public interface MyPageDAO {

	public MemberDTO selectOneMyPage(String memberId) throws Exception;
	public String selectOneCheckPasswd(String memberId) throws Exception;
	public void insertAddInfo(MemberDTO memberDTO) throws Exception;
	public String selectOneProfile(String memberId) throws Exception;
	public void updateReplyProfile(MemberDTO memberDTO) throws Exception;
	
}
