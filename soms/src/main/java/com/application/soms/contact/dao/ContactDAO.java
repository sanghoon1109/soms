package com.application.soms.contact.dao;

import com.application.soms.contact.dto.ContactDTO;

public interface ContactDAO {

	public void insertContact(ContactDTO contactDTO) throws Exception;
	
}
