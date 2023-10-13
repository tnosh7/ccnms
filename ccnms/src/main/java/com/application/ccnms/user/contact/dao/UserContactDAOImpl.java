package com.application.ccnms.user.contact.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserContactDAOImpl implements UserContactDAO {
	@Autowired
	private SqlSession sqlSession;
}
