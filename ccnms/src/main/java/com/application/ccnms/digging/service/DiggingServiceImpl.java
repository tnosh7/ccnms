package com.application.ccnms.digging.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.application.ccnms.digging.dao.DiggingDAO;
import com.application.ccnms.digging.dto.DiggingDTO;
import com.application.ccnms.digging.dto.JoinTitleDTO;
import com.application.ccnms.digging.dto.MainTitleDTO;
import com.application.ccnms.digging.dto.SubTitleDTO;
import com.application.ccnms.reply.dto.ReplyDTO;
import com.application.ccnms.user.dto.UserDTO;

@Service
public class DiggingServiceImpl implements DiggingService {
	

	private DiggingDAO diggingDAO;
	
	@Autowired
	public DiggingServiceImpl(DiggingDAO diggingDAO) {
		this.diggingDAO = diggingDAO;
	}
	
	@Override
	public List<JoinTitleDTO> getJoinTitleList() throws Exception {
		return diggingDAO.selectListJoinTitleList();
	}
	
	@Override
	public List<MainTitleDTO> getMainTitle() throws Exception {
		return diggingDAO.selectListMainTitle();
	}
	
	@Override
	public List<SubTitleDTO> getSubTitle() throws Exception {
		return diggingDAO.selectListSubTitle();
	}
	
	@Override
	public List<DiggingDTO> getDiggingList(int mainTitle) throws Exception {
		return diggingDAO.selectListDigging(mainTitle);
	}
	
	@Override
	public List<DiggingDTO> getPopulerList(int mainTitle) throws Exception {
		return diggingDAO.selectListPopulerList(mainTitle);
	}
	
	@Override
	public List<UserDTO> getUser(String writer) throws Exception {
		return diggingDAO.selectListUser(writer);
	}
	
	@Override
	public List<DiggingDTO> getDigList(String diggingTopic) throws Exception {
		return diggingDAO.selectListDigList(diggingTopic);
	}
	@Override
	@Transactional
	public void addDigging(DiggingDTO diggingDTO) throws Exception {
		diggingDAO.insertDigging(diggingDTO);
	}

	@Override
	@Transactional
	public Map<String,Object> getDiggingDetail(long diggingId) throws Exception {
		diggingDAO.updateReadCnt(diggingId);
		return diggingDAO.selectDiggingDetail(diggingId);
	}

	@Override
	public int upThumbsUp(long diggingId) throws Exception {
		return diggingDAO.updateThumbsUp(diggingId);
	}
	@Override
	public int getallReplyCnt(long diggingId) throws Exception {
		return diggingDAO.selectOneAllReplyCnt(diggingId);
	}
	@Override
	public List<ReplyDTO> getReplyList(long diggingId) throws Exception {
		return diggingDAO.selectListReplyList(diggingId);
	}
	@Transactional
	@Override
	public void updateDigging(DiggingDTO diggingDTO) throws Exception {
		diggingDAO.updateModifyDigging(diggingDTO);
	}


}
