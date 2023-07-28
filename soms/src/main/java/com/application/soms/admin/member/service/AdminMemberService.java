package com.application.soms.admin.member.service;

import com.application.soms.admin.member.dto.AdminMemberDTO;

public interface AdminMemberService {

	public boolean adminLogin(AdminMemberDTO adminDTO) throws Exception;
	
}
