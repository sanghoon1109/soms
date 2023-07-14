package com.application.soms.goods.dao;

import java.util.List;

import com.application.soms.goods.dto.GoodsDTO;

public interface GoodsDAO {

	public List<GoodsDTO> selectGoodsList() throws Exception;
	public List<GoodsDTO> selectDetailGoodsList(String sort) throws Exception;
	public List<GoodsDTO> selectNewList() throws Exception;
	public List<GoodsDTO> selectSteadyList() throws Exception;
	public List<GoodsDTO> selectPopularList() throws Exception;
	public List<GoodsDTO> selectBestList() throws Exception;
	public List<GoodsDTO> selectGeneralList() throws Exception;
	
	
}
