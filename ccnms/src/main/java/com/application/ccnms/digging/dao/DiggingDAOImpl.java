package com.application.ccnms.digging.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DiggingDAOImpl implements DiggingDAO {

	@Autowired
	private SqlSession sqlSession;
}
