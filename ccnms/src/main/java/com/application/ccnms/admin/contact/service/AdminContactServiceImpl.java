package com.application.ccnms.admin.contact.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.ccnms.admin.contact.dao.AdminContactDAO;
import com.application.ccnms.contact.dto.ContactDTO;

@Service
public class AdminContactServiceImpl implements AdminContactService {
	
	private AdminContactDAO adminContactDAO;
	
	@Autowired
	public AdminContactServiceImpl(AdminContactDAO adminContactDAO) {
		this.adminContactDAO = adminContactDAO;
	}
	@Override
	public List<ContactDTO> getContactList() throws Exception {
		return adminContactDAO.selectListContactList();
	}
	@Override
	public List<ContactDTO> getSearchContactList(Map<String, Object> searchMap) throws Exception {
		return adminContactDAO.selectListSearchContactList(searchMap);
	}

	@Override
	public ContactDTO getContactDetail(int contactCd) throws Exception {
		return adminContactDAO.selectOneContactDetail(contactCd);
	}

	@Override
	public void addReply(ContactDTO contactDTO) throws Exception {
		adminContactDAO.updateReply(contactDTO);
	}

	@Override
	public void removeContactList(int[] removeContact) throws Exception {
		adminContactDAO.deleteContactList(removeContact);
	}

}
