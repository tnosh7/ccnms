package com.application.ccnms.qna.service;

import java.util.List;
import java.util.Map;

import com.application.ccnms.qna.dto.QnaDTO;

public interface QnaService {
	public List<Map<String,Object>> getMyQnaList(String userId) throws Exception;
	public List<Map<String,Object>> getQnaList(String userId) throws Exception;
	public boolean authenticationQna(String userId) throws Exception;
	public void addQna(QnaDTO qnaDTO) throws Exception;
	public void setQnaCnt(long prouductCd) throws Exception;
	public void updateQnaReply(QnaDTO qnaDTO)throws Exception;
	public void removeQnaList(int[] removeQna)throws Exception;
	public void reduceQnaCnt(int[] productCd)throws Exception;
}
