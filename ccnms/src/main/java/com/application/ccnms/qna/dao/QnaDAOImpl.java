package com.application.ccnms.qna.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.ccnms.qna.dto.QnaDTO;
import com.application.ccnms.shop.dto.ShopDTO;

@Repository
public class QnaDAOImpl implements QnaDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Map<String,Object>> selectListQnaList(String userId) throws Exception {
		return sqlSession.selectList("qna.selectListQnaList", userId);
	}
	@Override
	public List<Map<String,Object>> selectListMyQnaList(String userId) throws Exception {
		return sqlSession.selectList("qna.selectListMyQnaList", userId);
	}
	@Override
	public QnaDTO selectOneAuthenticationQna(String userId) throws Exception {
		return sqlSession.selectOne("qna.selectOneAuthenticationQna", userId);
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
	public void deleteQnaList(int[] removeQna) throws Exception {
		sqlSession.delete("qna.deleteQnaList", removeQna);
	}
	@Override
	public void updateReduceQnaCnt(int[] productCd) throws Exception {
		sqlSession.update("qna.updateReduceQnaCnt", productCd);
	}

}
