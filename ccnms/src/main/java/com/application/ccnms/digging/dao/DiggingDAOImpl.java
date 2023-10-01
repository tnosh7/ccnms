package com.application.ccnms.digging.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.ccnms.digging.dto.DiggingDTO;

@Repository
public class DiggingDAOImpl implements DiggingDAO  {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertDigging(DiggingDTO diggingDTO) throws Exception {
		sqlSession.insert("digging.insertDigging", diggingDTO);	
	}

	@Override
	public void selectListDiggingList() throws Exception {
		sqlSession.selectList("digging.selectListDiggingList");
	}
}
