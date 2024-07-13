package com.application.ccnms.contact.dao;

import com.application.ccnms.contact.dto.ContactDTO;

public interface ContactDAO {
	
	public void insertContact(ContactDTO contactDTO) throws Exception;

}
