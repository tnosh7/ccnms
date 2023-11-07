package com.application.ccnms.admin.contact.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.ccnms.contact.dto.ContactDTO;

@Repository
public class AdminContactDAOImpl implements AdminContactDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<ContactDTO> selectListContactList() throws Exception {
		return sqlSession.selectList("adminContact.selectListContactList");
	}

	@Override
	public ContactDTO selectOneContactDetail(int contactCd) throws Exception {
		return sqlSession.selectOne("adminContact.selectOneContactDetail", contactCd);
	}

	@Override
	public void updateReply(ContactDTO contactDTO) throws Exception {
		sqlSession.insert("adminContact.updateReply", contactDTO);
	}
}
