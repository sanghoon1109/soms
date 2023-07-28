package com.application.soms.member.dao;

import com.application.soms.member.dto.MemberDTO;

public interface MemberDAO {

	public void insertMember(MemberDTO memberDTO) throws Exception;
	public MemberDTO selectOneMember(MemberDTO memberDTO) throws Exception;
	public String selectCheckMemberId(String memberId) throws Exception;
	public String selectOnePasswd(MemberDTO memberDTO) throws Exception;
	public void deleteMember(String memberId) throws Exception;
	
}
