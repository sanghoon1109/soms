package com.application.soms.goods.service;

import java.util.List;

import com.application.soms.goods.dto.GoodsDTO;

public interface GoodsService {

	public List<GoodsDTO> getGoodsList() throws Exception;
	
}
