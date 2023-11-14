package com.application.ccnms.qna.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.ccnms.qna.dao.QnaDAO;
import com.application.ccnms.qna.dto.QnaDTO;

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnaDAO qnaDAO;

	@Override
	public void addQna(QnaDTO qnaDTO) throws Exception {
		 qnaDAO.insertQna(qnaDTO);
	}

	@Override
	public void setQnaCnt(long prouductCd) throws Exception {
		qnaDAO.updateQnaCnt(prouductCd);
	}

	@Override
	public void updateQnaReply(QnaDTO qnaDTO) throws Exception {
		qnaDAO.updateReply(qnaDTO);
	}
}
