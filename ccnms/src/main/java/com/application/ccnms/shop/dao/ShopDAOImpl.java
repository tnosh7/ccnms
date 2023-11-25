package com.application.ccnms.shop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.ccnms.qna.dto.QnaDTO;
import com.application.ccnms.shop.dto.ShopDTO;

@Repository
public class ShopDAOImpl implements ShopDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertProduct(ShopDTO shopDTO) {
		sqlSession.insert("shop.insertProduct", shopDTO);
	}

	@Override
	public List<ShopDTO> selectListProductList() {
		return sqlSession.selectList("shop.selectListProductList");
	}

	@Override
	public List<ShopDTO> selectListSortList(String sort) throws Exception {
		return sqlSession.selectList("shop.selectListSortList", sort);
	}
	@Override
	public List<String> selectListShopTagList() throws Exception {
		return sqlSession.selectList("shop.selectListShopTagList");
	}
	@Override
	public List<String> selectListShopTagSortList(String sort) throws Exception {
		return sqlSession.selectList("shop.selectListShopTagSortList", sort);
	}
	@Override
	public ShopDTO selectOneProductDetail(long productCd) throws Exception {
		return sqlSession.selectOne("shop.selectOneProductDetai", productCd);
	}

	@Override
	public void updateReadCnt(long productCd) throws Exception {
		sqlSession.update("shop.updateReadCnt", productCd);
	}

	@Override
	public List<ShopDTO> selectListbestSort(String bestSort) throws Exception {
		return sqlSession.selectList("shop.selectListbestSort", bestSort);
	}

	@Override
	public List<QnaDTO> selectListQnaList(long productCd) throws Exception {
		return sqlSession.selectList("shop.selectListQnaList", productCd);
	}


}
