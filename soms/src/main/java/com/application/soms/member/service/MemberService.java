package com.application.soms.member.service;

import com.application.soms.member.dto.MemberDTO;

public interface MemberService {

	public void addMember(MemberDTO memberDTO) throws Exception;
	public boolean login(MemberDTO memberDTO) throws Exception;
	public String checkDuplicateId(String memberId) throws Exception;
	public String checkDuplicatePasswd(MemberDTO memberDTO) throws Exception;
	public void removeMember(String memberId) throws Exception;

 	
	
}
