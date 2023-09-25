package com.application.ccnms.admin.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.application.ccnms.user.dto.UserDTO;

@Component
public class AdminUserDAOImpl implements AdminUserDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<UserDTO> selectListUser() throws Exception {
		return sqlSession.selectList("adminUser.selectListUser");
	}
	
}
