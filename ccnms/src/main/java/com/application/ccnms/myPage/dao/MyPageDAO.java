package com.application.ccnms.myPage.dao;

import java.util.List;

import com.application.ccnms.digging.dto.DiggingDTO;
import com.application.ccnms.user.dto.UserDTO;

public interface MyPageDAO {
	public void insertProfile(UserDTO userDTO) throws Exception;
	public UserDTO selectOneUserDetail(String userId) throws Exception;
	public String selectOneAuthenticationUser(String userId) throws Exception;
	public void updateUser(UserDTO userDTO) throws Exception;
	public void deleteUser(UserDTO userDTO) throws Exception;
	public List<DiggingDTO> selectListDiggingList(String userId)throws Exception;
	public void deleteDigging(int[] delDiggingIdList)throws Exception;
}
