package com.application.ccnms.admin.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.application.ccnms.admin.dao.AdminDAO;
import com.application.ccnms.admin.dto.AdminDTO;
import com.application.ccnms.digging.service.DiggingServiceImpl;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO adminDAO;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	private static Logger logger = LoggerFactory.getLogger(AdminServiceImpl.class);
	

	@Override
	public AdminDTO loginAdmin(AdminDTO adminDTO) throws Exception {
		AdminDTO dbAdminDTO = adminDAO.selectOneLoginAdmin(adminDTO);
		if(bCryptPasswordEncoder.matches(adminDTO.getPasswd(), dbAdminDTO.getPasswd())) {
			if (dbAdminDTO.getPasswd() != null)
			return dbAdminDTO;
		}
		return null;
	}

	@Override
	public void addRegisterAdmin(AdminDTO adminDTO) throws Exception {
		adminDTO.setPasswd(bCryptPasswordEncoder.encode(adminDTO.getPasswd()));;
		adminDAO.insertRegisterAdmin(adminDTO);
	}

	@Override
	@Scheduled(cron="59 59 23 * * *")
	public Map<String, Object> todayCnt() throws Exception{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(new Date());
		
		logger.info(today + "의 댓글 등록수 : " + adminDAO.selectOneTodayReplyCnt(today));
		logger.info(today + "의 디깅 등록수 : " + adminDAO.selectOneTodayDiggingCnt(today));
		logger.info(today + "의 유저 등록수 : " + adminDAO.selectOneTodayUserCnt(today));
		logger.info(today + "의 상품 등록수 : " + adminDAO.selectOneTodayShopCnt(today));
		logger.info(today + "의 판매 등록수 : " + adminDAO.selectOneTodaySaleCnt(today));
		
		Map<String, Object> todayCntList = new HashMap<String, Object>();
		todayCntList.put("todayCnt", adminDAO.selectOneTodayReplyCnt(today));
		todayCntList.put("todayDigging", adminDAO.selectOneTodayDiggingCnt(today));
		todayCntList.put("todayUser", adminDAO.selectOneTodayUserCnt(today));
		todayCntList.put("todayShop", adminDAO.selectOneTodayShopCnt(today));
		todayCntList.put("todaySale", adminDAO.selectOneTodaySaleCnt(today));

		return todayCntList;
	}

}
