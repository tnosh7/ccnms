package com.application.ccnms.user.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.ccnms.user.dto.UserDTO;

@Repository
public class UserDAOImpl implements UserDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertUser(UserDTO userDTO) throws Exception {
		sqlSession.insert("user.insertUser", userDTO);
	}

	@Override
	public UserDTO selectOneLoginUser(UserDTO userDTO) throws Exception {
		return sqlSession.selectOne("user.selectOneLoginUser", userDTO);
	}

	@Override
	public String selectOneDuplicateUserId(UserDTO userId) throws Exception {
		return sqlSession.selectOne("user.selectOneDuplicateUserId", userId);
	}

}
