package com.application.ccnms.admin.digging.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.ccnms.digging.dto.DiggingDTO;
import com.application.ccnms.digging.dto.MainTitleDTO;
import com.application.ccnms.digging.dto.SubTitleDTO;

@Repository
public class AdminDiggingDAOImpl implements AdminDiggingDAO {

	private SqlSession sqlSession;
	
	@Autowired
	public AdminDiggingDAOImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<MainTitleDTO> selectListMainTitle() throws Exception {
		return sqlSession.selectList("adminDigging.selectListMainTitle");
	}
	@Override
	public List<SubTitleDTO> selectListSubTitle() throws Exception {
		return sqlSession.selectList("adminDigging.selectListSubTitle");
	}

	
	@Override
	public void insertDigging(DiggingDTO diggingDTO) throws Exception {
		sqlSession.insert("adminDigging.insertDigging",diggingDTO);
	}

	@Override
	public List<DiggingDTO> selectListDiggingList() throws Exception {
		return sqlSession.selectList("adminDigging.selectListDiggingList");
	}

	@Override
	public void selectListdeleteDigging(int[] removeDiggingIdList) throws Exception {
		sqlSession.selectList("adminDigging.selectListdeleteDigging", removeDiggingIdList);
	}

	@Override
	public List<DiggingDTO> selectListSearchDigging(Map<String, Object> searchMap) throws Exception {
		return sqlSession.selectList("adminDigging.selectListSearchDigging",searchMap);
	}

	@Override
	public List<SubTitleDTO> selectListSubTitle(int mainId) throws Exception {
		return sqlSession.selectList("adminDigging.selectListSubTitleDTO",mainId);
	}

	
}
