package com.application.ccnms.admin.contact.service;

import java.util.List;

import com.application.ccnms.contact.dto.ContactDTO;

public interface AdminContactService {

	public List<ContactDTO> getContactList() throws Exception;
	public ContactDTO getContactDetail(int contactCd) throws Exception;
	public void addReply(ContactDTO contactDTO) throws Exception;
}
