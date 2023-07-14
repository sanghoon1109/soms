package com.application.soms.goods.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.soms.goods.dao.GoodsDAO;
import com.application.soms.goods.dto.GoodsDTO;

@Service
public class GoodsServiceImpl implements GoodsService {

	@Autowired
	private GoodsDAO goodsDAO;

	@Override
	public List<GoodsDTO> getGoodsList() throws Exception {
		return goodsDAO.selectGoodsList();
	}

	@Override
	public List<GoodsDTO> getDetailGoodsList(String sort) throws Exception {
		return goodsDAO.selectDetailGoodsList(sort);
	}

	@Override
	public List<GoodsDTO> getNewList() throws Exception {
		return goodsDAO.selectNewList();
	}

	@Override
	public List<GoodsDTO> getSteadyList() throws Exception {
		return goodsDAO.selectSteadyList();
	}

	@Override
	public List<GoodsDTO> getPopularList() throws Exception {
		return goodsDAO.selectPopularList();
	}

	@Override
	public List<GoodsDTO> getBestList() throws Exception {
		return goodsDAO.selectBestList();
	}

	@Override
	public List<GoodsDTO> getGeneralList() throws Exception {
		return goodsDAO.selectGeneralList();
	}
	
	
	
}
