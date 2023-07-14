package com.application.soms.goods.service;

import java.util.List;

import com.application.soms.goods.dto.GoodsDTO;

public interface GoodsService {

	public List<GoodsDTO> getGoodsList() throws Exception;
	public List<GoodsDTO> getDetailGoodsList(String sort) throws Exception;
	public List<GoodsDTO> getNewList() throws Exception;
	public List<GoodsDTO> getSteadyList() throws Exception;
	public List<GoodsDTO> getPopularList() throws Exception;
	public List<GoodsDTO> getBestList() throws Exception;
	public List<GoodsDTO> getGeneralList() throws Exception;
	
	
}
