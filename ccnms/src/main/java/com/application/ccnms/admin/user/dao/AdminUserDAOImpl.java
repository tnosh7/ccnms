package com.application.ccnms.admin.user.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.application.ccnms.user.dto.UserDTO;

@Component
public class AdminUserDAOImpl implements AdminUserDAO {

	private SqlSession sqlSession;

	@Autowired
	public AdminUserDAOImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<UserDTO> selectListUser() throws Exception {
		return sqlSession.selectList("adminUser.selectListUser");
	}
	
	@Override
	public List<UserDTO> selectListSearchUser(Map<String, Object> searchMap) throws Exception {
		return sqlSession.selectList("adminUser.selectListSearchUser", searchMap);
	}

	@Override
	public void deleteUserList(String[] delUserIdList) throws Exception {
		sqlSession.delete("adminUser.deleteUserList", delUserIdList);
	}

	@Override
	public UserDTO selectOneUserInfo(String userId) throws Exception {
		return sqlSession.selectOne("adminUser.selectOneUserInfo", userId);
	}

	@Override
	public void updateOneUser(UserDTO userDTO) throws Exception {
		sqlSession.update("adminUser.updateOneUser", userDTO);
	}



	
}
