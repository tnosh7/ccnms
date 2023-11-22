package com.application.ccnms.qna.dao;

import java.util.List;
import java.util.Map;

import com.application.ccnms.qna.dto.QnaDTO;

public interface QnaDAO {
	public List<QnaDTO> selectListMyQnaList(String userId) throws Exception;
	public List<Map<String,Object>> selectListQnaList(String userId) throws Exception;
	public void insertQna(QnaDTO qnaDTO) throws Exception;
	public void updateQnaCnt(long productCd) throws Exception;
	public void updateReply(QnaDTO qnaDTO) throws Exception;
	public void deleteQnaList(int[]removeQnaCd) throws Exception;
	
}
