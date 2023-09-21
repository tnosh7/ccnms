package com.application.ccnms.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.application.ccnms.user.dao.UserDAO;
import com.application.ccnms.user.dto.UserDTO;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Override
	public void addUser(UserDTO userDTO) throws Exception{
		userDTO.setPasswd(bCryptPasswordEncoder.encode(userDTO.getPasswd()));
		userDAO.insertUser(userDTO);
		
	}

	@Override
	public UserDTO loginUser(UserDTO userDTO) throws Exception {
		UserDTO dbUserDTO = userDAO.selectOneLoginUser(userDTO) ;
		//회원가입 DB연결X 암호화 비밀번호와 DTO pw 매치하면 오류남
		//if (bCryptPasswordEncoder.matches(userDTO.getPasswd(), dbUserDTO.getPasswd())) 
		if(dbUserDTO != null) {
			return userDTO;
		}
		return null;
	}

	
}
