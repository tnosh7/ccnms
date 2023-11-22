package com.application.ccnms.admin.contact.dao;

import java.util.List;
import java.util.Map;

import com.application.ccnms.contact.dto.ContactDTO;

public interface AdminContactDAO {
	
	public List<ContactDTO> selectListContactList() throws Exception;
	public List<ContactDTO> selectListSearchContactList(Map<String,Object> searchMap) throws Exception;
	public ContactDTO selectOneContactDetail(int contactCd) throws Exception;
	public void updateReply(ContactDTO contactDTO) throws Exception;
	public void deleteContactList(int [] removeContact) throws Exception;
}
