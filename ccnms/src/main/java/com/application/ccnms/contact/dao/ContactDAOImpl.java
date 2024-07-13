package com.application.ccnms.contact.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.ccnms.contact.dto.ContactDTO;

@Repository
public class ContactDAOImpl implements ContactDAO {

	private SqlSession sqlSession;
	
	@Autowired
	public ContactDAOImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void insertContact(ContactDTO contactDTO) throws Exception {
		sqlSession.insert("insertContact", contactDTO);
	
	}
}
