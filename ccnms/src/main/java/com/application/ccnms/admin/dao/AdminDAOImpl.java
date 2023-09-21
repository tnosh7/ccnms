package com.application.ccnms.admin.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.ccnms.admin.dto.AdminDTO;

@Repository
public class AdminDAOImpl implements AdminDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public AdminDTO selectOneLoginAdmin(AdminDTO adminDTO) {
		return sqlSession.selectOne("admin.selectOneLoginAdmin", adminDTO);
	}

	@Override
	public void insertRegisterAdmin(AdminDTO adminDTO) {
		sqlSession.insert("admin.insertRegisterAdmin", adminDTO);
	}
	
}
