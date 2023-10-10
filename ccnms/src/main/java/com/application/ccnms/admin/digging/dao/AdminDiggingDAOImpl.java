package com.application.ccnms.admin.digging.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.ccnms.digging.dto.DiggingDTO;

@Repository
public class AdminDiggingDAOImpl implements AdminDiggingDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertDigging(DiggingDTO diggingDTO) throws Exception {
		sqlSession.insert("adminDigging.insertDigging",diggingDTO);
	}
	
}
