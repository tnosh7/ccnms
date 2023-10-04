package com.application.ccnms.myPage.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.ccnms.digging.dto.DiggingDTO;
import com.application.ccnms.user.dto.UserDTO;

@Repository
public class MyPageDAOImpl implements MyPageDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertProfile(UserDTO userDTO) throws Exception {
		sqlSession.insert("myPage.insertProfile", userDTO);	
	}

	@Override
	public UserDTO selectOneUserDetail(String userId) throws Exception {
		return sqlSession.selectOne("myPage.selectOneUserDetail", userId);
	}

	@Override
	public String selectOneAuthenticationUser(String userId) throws Exception {
		return sqlSession.selectOne("myPage.selectOneAuthenticationUser", userId);
	}

	@Override
	public void updateUser(UserDTO userDTO) throws Exception {
		sqlSession.update("myPage.updateUser", userDTO);
	}

	@Override
	public void deleteUser(UserDTO userDTO) throws Exception {
		sqlSession.delete("myPage.deleteUser", userDTO);
	}

	@Override
	public List<DiggingDTO> selectListDiggingList(String userId) throws Exception {
		return sqlSession.selectList("myPage.selectListDiggingList", userId);
	}

	@Override
	public void deleteDigging(int[] delDiggingIdList) throws Exception {
		sqlSession.delete("myPage.deleteDigging", delDiggingIdList);
		
		
	}
}
