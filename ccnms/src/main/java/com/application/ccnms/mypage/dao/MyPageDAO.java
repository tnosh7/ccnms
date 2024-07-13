package com.application.ccnms.mypage.dao;

import java.util.List;

import com.application.ccnms.contact.dto.ContactDTO;
import com.application.ccnms.digging.dto.DiggingDTO;
import com.application.ccnms.reply.dto.ReplyDTO;
import com.application.ccnms.user.dto.UserDTO;

public interface MyPageDAO {
	public void insertProfile(UserDTO userDTO) throws Exception;
	public UserDTO selectOneUserDetail(String userId) throws Exception;
	public String selectOneAuthenticationUser(String userId) throws Exception;
	public void updateUser(UserDTO userDTO) throws Exception;
	public void deleteUser(UserDTO userDTO) throws Exception;
	public List<DiggingDTO> selectListDiggingList(String userId) throws Exception;
	public List<ReplyDTO> selectListReplyList(String userId) throws Exception;
	public List<ContactDTO> selectListContactList(String userId) throws Exception;
	public void deleteDigging(int[] delDiggingIdList) throws Exception;
	public void deleteReply(int[] delReplyIdList) throws Exception;
}
