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
	
	
	
}
