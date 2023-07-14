package com.application.soms.goods.dao;

import java.util.List;

import com.application.soms.goods.dto.GoodsDTO;

public interface GoodsDAO {

	public List<GoodsDTO> selectGoodsList() throws Exception;
	
}
