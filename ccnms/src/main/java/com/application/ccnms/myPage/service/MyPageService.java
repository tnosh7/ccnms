package com.application.ccnms.myPage.service;

import java.util.List;

import com.application.ccnms.contact.dto.ContactDTO;
import com.application.ccnms.digging.dto.DiggingDTO;
import com.application.ccnms.reply.dto.ReplyDTO;
import com.application.ccnms.user.dto.UserDTO;

public interface MyPageService {
	
	public void addProfile(UserDTO userDTO) throws Exception;
	public UserDTO getUserDetail(String userId) throws Exception;
	public boolean checkAuthenticationUser(UserDTO userDTO) throws Exception;
	public void getModify(UserDTO userDTO) throws Exception;
	public void removeUser(UserDTO userDTO) throws Exception;
	public List<DiggingDTO> getDiggingList(String userId)throws Exception;
	public List<ReplyDTO>getReplyList(String userId)throws Exception;
	public List<ContactDTO> getMyContactList(String userId)throws Exception;
	public void removeDigging(int[] delDiggingIdList) throws Exception;
	public void removeReply(int[] delReplyIdList)throws Exception;

}
