package com.application.soms.admin.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.soms.admin.member.dao.AdminMemberDAO;
import com.application.soms.admin.member.dto.AdminMemberDTO;

@Service
public class AdminMemberServiceImpl implements AdminMemberService {

	@Autowired
	private AdminMemberDAO adminMemberDAO;

	@Override
	public boolean adminLogin(AdminMemberDTO adminDTO) throws Exception {
		
		AdminMemberDTO dbAdminDTO = adminMemberDAO.getAdminMemberId(adminDTO);
		
		if(dbAdminDTO != null) {
			return true;
		}
		
		return false;
	}
	
}
