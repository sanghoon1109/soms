package com.application.soms.goods.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class GoodsBatchDTO {

	private int goodsCd;
	private String goodsNm;
	private String goodsFileName;
	private String sort;
	private long dayView;
	private long weekView;
	private long monthView;
	private Date batchDt;
	
	public int getGoodsCd() {
		return goodsCd;
	}
	public void setGoodsCd(int goodsCd) {
		this.goodsCd = goodsCd;
	}
	public String getGoodsNm() {
		return goodsNm;
	}
	public void setGoodsNm(String goodsNm) {
		this.goodsNm = goodsNm;
	}
	public String getGoodsFileName() {
		return goodsFileName;
	}
	public void setGoodsFileName(String goodsFileName) {
		this.goodsFileName = goodsFileName;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public long getDayView() {
		return dayView;
	}
	public void setDayView(long dayView) {
		this.dayView = dayView;
	}
	public long getWeekView() {
		return weekView;
	}
	public void setWeekView(long weekView) {
		this.weekView = weekView;
	}
	public long getMonthView() {
		return monthView;
	}
	public void setMonthView(long monthView) {
		this.monthView = monthView;
	}
	public Date getBatchDt() {
		return batchDt;
	}
	public void setBatchDt(Date batchDt) {
		this.batchDt = batchDt;
	}
	
	@Override
	public String toString() {
		return "GoodsBatchDTO [goodsCd=" + goodsCd + ", goodsNm=" + goodsNm + ", goodsFileName=" + goodsFileName
				+ ", sort=" + sort + ", dayView=" + dayView + ", weekView=" + weekView + ", monthView=" + monthView
				+ ", batchDt=" + batchDt + "]";
	}

	
	
}
