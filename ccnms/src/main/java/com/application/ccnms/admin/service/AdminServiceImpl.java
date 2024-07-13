package com.application.ccnms.admin.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.application.ccnms.admin.dao.AdminDAO;
import com.application.ccnms.admin.dto.AdminDTO;
import com.application.ccnms.digging.dto.DiggingDTO;

@Service
public class AdminServiceImpl implements AdminService {

	private AdminDAO adminDAO;
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	private static Logger logger = LoggerFactory.getLogger(AdminServiceImpl.class);
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String today = sdf.format(new Date());
	
	@Autowired
	public AdminServiceImpl(AdminDAO adminDAO, BCryptPasswordEncoder bCryptPasswordEncoder) {
		this.adminDAO = adminDAO;
		this.bCryptPasswordEncoder = bCryptPasswordEncoder;
	}

	@Override
	public boolean loginAdmin(AdminDTO adminDTO) throws Exception {
		AdminDTO dbAdminDTO = adminDAO.selectOneLoginAdmin(adminDTO);
		if (dbAdminDTO != null) {
			if(bCryptPasswordEncoder.matches(adminDTO.getPasswd(), dbAdminDTO.getPasswd())) 
				return true;
		}
		return false;
	}
	
	@Override
	public boolean authenticationAdmin(String adminId) throws Exception {
		if (adminDAO.selectOneAuthenticationAdmin(adminId) != null) return true;
		else return false;
	}

	
	@Override
	public void addRegisterAdmin(AdminDTO adminDTO) throws Exception {
		adminDTO.setPasswd(bCryptPasswordEncoder.encode(adminDTO.getPasswd()));;
		adminDAO.insertRegisterAdmin(adminDTO);
	}

	@Override
	public int getDiggingCnt() throws Exception {
		return adminDAO.selectOneTodayDiggingCnt(today);
	}
	
	@Override
	public int getUserCnt() throws Exception {
		return adminDAO.selectOneTodayUserCnt(today);
	}
	
	@Override
	public int getShopCnt() throws Exception {
		return adminDAO.selectOneTodayShopCnt(today);
	}
	
	@Override
	public int getSaleCnt() throws Exception {
		return adminDAO.selectOneTodaySaleCnt(today);
	}

	@Override
	@Scheduled(cron="59 59 23 * * *")
	public void todayCnt() throws Exception{
		
		logger.info(today + "의 댓글 등록수 : " + adminDAO.selectOneTodayReplyCnt(today));
		logger.info(today + "의 디깅 등록수 : " + adminDAO.selectOneTodayDiggingCnt(today));
		logger.info(today + "의 유저 등록수 : " + adminDAO.selectOneTodayUserCnt(today));
		logger.info(today + "의 상품 등록수 : " + adminDAO.selectOneTodayShopCnt(today));
		logger.info(today + "의 판매 등록수 : " + adminDAO.selectOneTodaySaleCnt(today));
	}
	
	@Transactional
	@Override
	public List<Map<String,Object>> getUserStaticList() throws Exception {
		return adminDAO.selectListUserStatic();
	}
	
	@Transactional
	@Override
	public List<DiggingDTO> getNoticeList() throws Exception {
		return adminDAO.selectListNoticeList();
	}
	
	@Override
	public Integer getMonthOrder() throws Exception {
		return adminDAO.selectOneMonthOrder();
	}


	
}
