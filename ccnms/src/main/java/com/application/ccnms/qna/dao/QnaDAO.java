package com.application.ccnms.qna.dao;

import java.util.List;
import java.util.Map;

import com.application.ccnms.qna.dto.QnaDTO;
import com.application.ccnms.shop.dto.ShopDTO;

public interface QnaDAO {
	public List<Map<String,Object>> selectListMyQnaList(String userId) throws Exception;
	public List<Map<String,Object>> selectListQnaList(String userId) throws Exception;
	public QnaDTO selectOneAuthenticationQna(String userId) throws Exception;
	public void insertQna(QnaDTO qnaDTO) throws Exception;
	public void updateQnaCnt(long productCd) throws Exception;
	public void updateReply(QnaDTO qnaDTO) throws Exception;
	public void deleteQnaList(int[]removeQna) throws Exception;
	public void updateReduceQnaCnt(int[]productCd) throws Exception;
	
}
