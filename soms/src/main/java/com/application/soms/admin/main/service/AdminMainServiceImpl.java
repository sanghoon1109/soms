package com.application.soms.admin.main.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.soms.admin.main.dao.AdminMainDAO;

@Service
public class AdminMainServiceImpl implements AdminMainService {

	@Autowired
	private AdminMainDAO adminMainDAO;

	@Override
	public int getGoodsCnt() throws Exception {
		return adminMainDAO.selectOneGoodsCnt();
	}

	@Override
	public int getMemberCnt() throws Exception {
		return adminMainDAO.selectOneMemberCnt();
	}
	
}
