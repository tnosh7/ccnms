package com.application.ccnms.qna.dao;

import com.application.ccnms.qna.dto.QnaDTO;

public interface QnaDAO {
	
	public void insertQna(QnaDTO qnaDTO) throws Exception;
	public void updateQnaCnt(long productCd) throws Exception;
	public void updateReply(QnaDTO qnaDTO) throws Exception;
}
