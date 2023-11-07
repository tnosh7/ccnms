package com.application.ccnms.admin.contact.dao;

import java.util.List;

import com.application.ccnms.contact.dto.ContactDTO;

public interface AdminContactDAO {
	
	public List<ContactDTO> selectListContactList() throws Exception;
	public ContactDTO selectOneContactDetail(int contactCd) throws Exception;
	public void updateReply(ContactDTO contactDTO) throws Exception;
}
