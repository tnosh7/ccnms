package com.application.ccnms.admin.contact.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.ccnms.contact.dto.ContactDTO;

@Repository
public class AdminContactDAOImpl implements AdminContactDAO {

	
	private SqlSession sqlSession;
	
	@Autowired
	public AdminContactDAOImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	@Override
	public List<ContactDTO> selectListContactList() throws Exception {
		return sqlSession.selectList("adminContact.selectListContactList");
	}
	@Override
	public List<ContactDTO> selectListSearchContactList(Map<String, Object> searchMap) throws Exception {
		return sqlSession.selectList("adminContact.selectListSearchContactList", searchMap);
	}

	@Override
	public ContactDTO selectOneContactDetail(int contactCd) throws Exception {
		return sqlSession.selectOne("adminContact.selectOneContactDetail", contactCd);
	}

	@Override
	public void updateReply(ContactDTO contactDTO) throws Exception {
		sqlSession.insert("adminContact.updateReply", contactDTO);
	}

	@Override
	public void deleteContactList(int[] removeContact) throws Exception {
		sqlSession.delete("adminContact.deleteContactList", removeContact);
	}

}
