package com.application.ccnms.user.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.ccnms.user.dto.UserDTO;

@Repository
public class UserDAOImpl implements UserDAO {
	
	
	private SqlSession sqlSession;
	
	@Autowired
	public UserDAOImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public boolean insertUser(UserDTO userDTO) throws Exception {
		sqlSession.insert("user.insertUser", userDTO);
		return true; 
	}

	@Override
	public UserDTO selectOneLoginUser(UserDTO userDTO) throws Exception {
		return sqlSession.selectOne("user.selectOneLoginUser", userDTO);
	}

	@Override
	public UserDTO selectOneDuplicateUserId(String userId) throws Exception {
		return sqlSession.selectOne("user.selectOneDuplicateUserId", userId);
	}

	@Override
	public void updateEmailCheck(Map<String, Object> emailMap) {
		sqlSession.update("user.updateEmailCheck", emailMap);
	}
	@Override
	public int selectOneMyKeepCnt(String userId) throws Exception {
		return sqlSession.selectOne("user.selectOneMyKeepCnt", userId);
	}
	
	@Override
	public int selectOneMyCartCnt(String userId) throws Exception {
		return sqlSession.selectOne("user.selectOneMyCartCnt", userId);
	}
	@Override
	public int selectOneMyOrderCnt(String userId) throws Exception {
		return sqlSession.selectOne("user.selectOneMyOrderCnt", userId);
	}


	@Override
	public boolean selectOneEmailIdentify(String userId) throws Exception {
		if (sqlSession.selectOne("user.selectOneEmailIdentify",userId).equals("F")) return false;
		else return true;
	}

	@Override
	public boolean selectOneEmailAuthentication(UserDTO userDTO) throws Exception {
		if (sqlSession.selectOne("user.selectOneEmailAuthentication", userDTO) == null) return false;
		else {
			sqlSession.update("user.updateMailCheck", sqlSession.selectOne("user.selectOneEmailAuthentication", userDTO)); 
			return true;
		}
	}
	@Override
	public String selectOneFindId(String userNm, String email) throws Exception {
		Map<String,Object> findIdMap = new HashMap<String, Object>();
		findIdMap.put("userNm", userNm);
		findIdMap.put("email", email);
		if (sqlSession.selectOne("user.selectOneFindId", findIdMap) == null) return "false";
		else return sqlSession.selectOne("user.selectOneFindId", findIdMap);
	}
	@Override
	public String selectOneFindPw(String userId, String email) throws Exception {
		Map<String,Object> findPwMap = new HashMap<String, Object>();
		findPwMap.put("userId", userId);
		findPwMap.put("email", email);
		if (sqlSession.selectOne("user.selectOneFindPw", findPwMap) == null) return "false";
		else return sqlSession.selectOne("user.selectOneFindPw", findPwMap);
	}

	@Override
	public void updatePw(UserDTO userDTO) throws Exception {
		sqlSession.update("user.updatePw", userDTO);
	}

	@Override
	public void updateLikePoint(String writer) throws Exception {
		sqlSession.update("user.updateLikePoint", writer);
	}



}
