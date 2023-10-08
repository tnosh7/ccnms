package com.application.ccnms.myPage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.application.ccnms.digging.dto.DiggingDTO;
import com.application.ccnms.myPage.dao.MyPageDAO;
import com.application.ccnms.reply.dto.ReplyDTO;
import com.application.ccnms.user.dto.UserDTO;

@Service

public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	private MyPageDAO myPageDAO;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	

	@Override
	public void addProfile(UserDTO userDTO) throws Exception {
		myPageDAO.insertProfile(userDTO);
	}

	@Override
	public UserDTO getUserDetail(String userId) throws Exception {
		return myPageDAO.selectOneUserDetail(userId);
	}

	@Override
	public boolean checkAuthenticationUser(UserDTO userDTO) throws Exception {
		boolean isAuthentication = false;
		if (bCryptPasswordEncoder.matches(userDTO.getPasswd(), 	myPageDAO.selectOneAuthenticationUser(userDTO.getUserId()))) {
			isAuthentication = true;
		}
		return isAuthentication;
	}

	@Override
	public void getModify(UserDTO userDTO) throws Exception {
		myPageDAO.updateUser(userDTO);
	}

	@Override
	public void removeUser(UserDTO userDTO) throws Exception {
		myPageDAO.deleteUser(userDTO);
	}

	@Override
	public List<DiggingDTO> getDiggingList(String userId) throws Exception {
		return myPageDAO.selectListDiggingList(userId);
	}
	@Override
	public List<ReplyDTO> getReplyList(String userId) throws Exception {
		return myPageDAO.selectListReplyList(userId);
	}

	@Override
	public void removeDigging(int[] delDiggingIdList) throws Exception {
		myPageDAO.deleteDigging(delDiggingIdList);
	}
	@Override
	public void removeReply(int[] delReplyIdList) throws Exception {
		myPageDAO.deleteReply(delReplyIdList);
	}

}
