package com.application.ccnms.admin.user.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class AdminUserDAOImpl implements AdminUserDAO {

	@Autowired
	private SqlSession sqlSession;
	
}
