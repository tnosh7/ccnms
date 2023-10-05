package com.application.ccnms.digging.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.ccnms.digging.dao.DiggingDAO;
import com.application.ccnms.digging.dto.DiggingDTO;
import com.application.ccnms.reply.dto.ReplyDTO;

@Service
public class DiggingServiceImpl implements DiggingService {
	
	@Autowired
	private DiggingDAO diggingDAO;

	@Override
	public void addDigging(DiggingDTO diggingDTO) throws Exception {
		diggingDAO.insertDigging(diggingDTO);
	}

	@Override
	public List<DiggingDTO> getDiggingList() throws Exception {
		return diggingDAO.selectListDiggingList();
	}

	@Override
	public DiggingDTO getDiggingDetail(long diggingId) throws Exception {
		return diggingDAO.selectDiggingDetail(diggingId);
	}

	@Override
	public void ThumbsUp(long diggingId) throws Exception {
		diggingDAO.updateThumbsUp(diggingId);
	}

	@Override
	public int getallReplyCnt(long diggingId) throws Exception {
		return diggingDAO.selectOneAllReplyCnt(diggingId);
	}

	@Override
	public List<ReplyDTO> getReplyList(long diggingId) throws Exception {
		return diggingDAO.selectListReplyList(diggingId);
	}

}
