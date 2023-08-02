package com.application.soms.contact.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.soms.contact.dto.ContactDTO;

@Repository
public class ContactDAOImpl implements ContactDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertContact(ContactDTO contactDTO) throws Exception {
		sqlSession.insert("contact.insertContact", contactDTO);
	}

}
