package com.application.ccnms.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.ccnms.admin.dto.AdminDTO;
import com.application.ccnms.digging.dto.DiggingDTO;

@Repository
public class AdminDAOImpl implements AdminDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public AdminDTO selectOneLoginAdmin(AdminDTO adminDTO) {
		return sqlSession.selectOne("admin.selectOneLoginAdmin", adminDTO);
	}

	@Override
	public void insertRegisterAdmin(AdminDTO adminDTO) {
		sqlSession.insert("admin.insertRegisterAdmin", adminDTO);
	}

	@Override
	public int selectOneTodayReplyCnt(String today) throws Exception {
		return sqlSession.selectOne("admin.selectOneTodayReplyCnt", today);
	}

	@Override
	public int selectOneTodayDiggingCnt(String today) throws Exception {
		return sqlSession.selectOne("admin.selectOneTodayDiggingCnt", today);
	}

	@Override
	public int selectOneTodayUserCnt(String today) throws Exception {
		return sqlSession.selectOne("admin.selectOneTodayUserCnt", today);
	}

	@Override
	public int selectOneTodayShopCnt(String today) throws Exception {
		return sqlSession.selectOne("admin.selectOneTodayShopCnt", today);
	}

	@Override
	public int selectOneTodaySaleCnt(String today) throws Exception {
		return sqlSession.selectOne("admin.selectOneTodaySaleCnt", today);
	}

	@Override
	public List<Map<String, Object>> selectListUserStatic() throws Exception {
		return sqlSession.selectList("admin.selectListUserStatic");
	}

	@Override
	public List<DiggingDTO> selectListNoticeList() throws Exception {
		return sqlSession.selectList("admin.selectListNoticeList");
	}

	@Override
	public Integer selectOneMonthOrder() throws Exception {
		return sqlSession.selectOne("admin.selectOneMonthOrder");
	}
	
}
