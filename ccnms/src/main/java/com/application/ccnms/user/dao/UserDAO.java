package com.application.ccnms.user.dao;

import java.util.Map;

import com.application.ccnms.user.dto.UserDTO;

public interface UserDAO {
	
	public boolean insertUser(UserDTO userDTO) throws Exception;
	public UserDTO selectOneLoginUser(UserDTO userDTO)throws Exception;
	public UserDTO selectOneDuplicateUserId(String userId) throws Exception;
	public void updateEmailCheck(Map<String,Object>emailMap);
	public int selectOneMyOrderCnt(String userId) throws Exception;
	public int selectOneMyCartCnt(String userId) throws Exception;
	public boolean selectOneEmailIdentify(String userId) throws Exception;
	public boolean selectOneEmailAuthentication(UserDTO userDTO) throws Exception;
	public String selectOneFindId(String userNm, String email) throws Exception;
	public String selectOneFindPw(String userId, String email) throws Exception;
	public void updatePw(UserDTO userDTO)throws Exception;
}
