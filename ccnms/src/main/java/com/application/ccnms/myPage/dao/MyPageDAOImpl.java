package com.application.ccnms.myPage.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.ccnms.contact.dto.ContactDTO;
import com.application.ccnms.digging.dto.DiggingDTO;
import com.application.ccnms.reply.dto.ReplyDTO;
import com.application.ccnms.user.dto.UserDTO;

@Repository
public class MyPageDAOImpl implements MyPageDAO {

	
	private SqlSession sqlSession;

	@Autowired
	public MyPageDAOImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

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
		sqlSession.delete("myPage.deleteUserReply", userDTO);
		sqlSession.delete("myPage.deleteUserDigging", userDTO);
		sqlSession.delete("myPage.deleteUserShop", userDTO);
		sqlSession.delete("myPage.deleteUserOrder", userDTO);
		sqlSession.delete("myPage.deleteUserCart", userDTO);
		sqlSession.delete("myPage.deleteUser", userDTO);
	}

	@Override
	public List<DiggingDTO> selectListDiggingList(String userId) throws Exception {
		return sqlSession.selectList("myPage.selectListDiggingList", userId);
	}

	@Override
	public List<ReplyDTO> selectListReplyList(String userId) throws Exception {
		return sqlSession.selectList("myPage.selectListReplyList",userId);
	}
	
	@Override
	public List<ContactDTO> selectListContactList(String userId) throws Exception {
		return sqlSession.selectList("myPage.selectListContactList", userId);
	}
	
	@Override
	public void deleteDigging(int[] delDiggingIdList) throws Exception {
		sqlSession.delete("myPage.deleteDigging", delDiggingIdList);
	}

	@Override
	public void deleteReply(int[] delReplyIdList) throws Exception {
		sqlSession.delete("myPage.deleteReply", delReplyIdList);
	}


}
