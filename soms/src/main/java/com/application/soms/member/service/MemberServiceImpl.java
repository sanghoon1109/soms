package com.application.soms.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.application.soms.member.dao.MemberDAO;
import com.application.soms.member.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Override
	public void addMember(MemberDTO memberDTO) throws Exception {
		memberDTO.setPasswd(bCryptPasswordEncoder.encode(memberDTO.getPasswd()));
		memberDAO.insertMember(memberDTO);
	}

	@Override
	public boolean login(MemberDTO memberDTO) throws Exception {
		
		MemberDTO dbMemberDTO = memberDAO.selectOneMember(memberDTO);
		if(dbMemberDTO != null) {
			if(bCryptPasswordEncoder.matches(memberDTO.getPasswd(), dbMemberDTO.getPasswd())) {
				return true;
			}
		}
		
		return false;
	}

	@Override
	public String checkDuplicateId(String memberId) throws Exception {
		if(memberDAO.selectCheckMemberId(memberId) == null) {
			return "duplicate";
		}
		return null;
	}

}
