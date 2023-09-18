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
	public String selectOneDuplicateId(String userId) {
		return sqlSession.selectOne("user.selectOneDuplicateId", userId);
	}
}
