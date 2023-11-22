package com.application.ccnms.qna.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.ccnms.qna.dto.QnaDTO;

@Repository
public class QnaDAOImpl implements QnaDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Map<String,Object>> selectListQnaList(String userId) throws Exception {
		return sqlSession.selectList("qna.selectListQnaList", userId);
	}
	@Override
	public List<QnaDTO> selectListMyQnaList(String userId) throws Exception {
		return sqlSession.selectList("qna.selectListMyQnaList", userId);
	}
	@Override
	public void insertQna(QnaDTO qnaDTO) throws Exception {
		sqlSession.insert("qna.insertQna", qnaDTO);
	}
	@Override
	public void updateQnaCnt(long productCd) throws Exception {
		sqlSession.update("qna.updateQnaCnt", productCd);
	}
	@Override
	public void updateReply(QnaDTO qnaDTO) throws Exception {
		sqlSession.update("qna.updateReply", qnaDTO);
	}
	@Override
	public void deleteQnaList(int[] removeQnaCd) throws Exception {
		sqlSession.delete("qna.deleteQnaList", removeQnaCd);
	}

}
