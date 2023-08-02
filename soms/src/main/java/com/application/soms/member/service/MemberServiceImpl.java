package com.application.soms.member.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.application.soms.common.controller.LogSoms;
import com.application.soms.member.dao.MemberDAO;
import com.application.soms.member.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	private static Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);
	
	@Override
	public void addMember(MemberDTO memberDTO) throws Exception {
		memberDTO.setPasswd(bCryptPasswordEncoder.encode(memberDTO.getPasswd()));
		memberDAO.insertMember(memberDTO);
		logger.info(memberDTO.getMemberId() + "님 회원가입");
	}

	@Override
	public String login(MemberDTO memberDTO) throws Exception {
		
		MemberDTO dbMemberDTO = memberDAO.selectOneMember(memberDTO);
		if(dbMemberDTO != null) {
			if(bCryptPasswordEncoder.matches(memberDTO.getPasswd(), dbMemberDTO.getPasswd())) {
				logger.info(memberDTO.getMemberId() + "님 로그인");
				return "true";
			}
		}
		
		return "false";
	}

	@Override
	public String checkDuplicateId(String memberId) throws Exception {
		if(memberDAO.selectCheckMemberId(memberId) == null) {
			return "duplicate";
		}
		return null;
	}

	@Override
	public String checkDuplicatePasswd(MemberDTO memberDTO) throws Exception {
		
		if(bCryptPasswordEncoder.matches(memberDTO.getPasswd(), memberDAO.selectOnePasswd(memberDTO))) {
			return "equals";
		}
		
		return null;
	}

	@Override
	public void removeMember(String memberId) throws Exception {
		memberDAO.deleteMember(memberId);
	}

	@Override
	public String checkMembership(String memberId) throws Exception {
		// 멤버쉽 db에 해당 아이디가 존재할 뿐 아니라 멤버쉽 상태가 있어야함
		// select membership from payment where member_id = #{memberId}
		// membership != null && membership != 0
		if(memberDAO.selectOnePaymentMember(memberId) != null) {
			String membership = memberDAO.selectCheckMembership(memberId);
			if(!membership.equals("notApp")) {
				return "member";
			}
		}
		
		
		return "empty";
	}



}
