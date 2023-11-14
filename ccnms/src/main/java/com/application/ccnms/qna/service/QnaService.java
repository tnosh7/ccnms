package com.application.ccnms.qna.service;

import com.application.ccnms.qna.dto.QnaDTO;

public interface QnaService {
	
	public void addQna(QnaDTO qnaDTO) throws Exception;
	public void setQnaCnt(long prouductCd) throws Exception;
	public void updateQnaReply(QnaDTO qnaDTO)throws Exception;
}
