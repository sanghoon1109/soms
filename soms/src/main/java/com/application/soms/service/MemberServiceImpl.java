package com.application.soms.service;

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

}
