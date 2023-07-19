package com.application.soms.goods.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class GoodsDTO {

	private int goodsCd;
	private String goodsNm;
	private String nation;
	private String produceDt;
	private String genre;
	private String category;
	private String appearance;
	private String quality;
	private String classification;
	private String subtitleSupport;
	private String contentIntro;
	private long views;
	private long dayViewCnt;
	private long weekViewCnt;
	private long monthViewCnt;
	private String director;
	private String sort;
	private String goodsFileName;
	private Date enrollDt;
	
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
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public String getProduceDt() {
		return produceDt;
	}
	public void setProduceDt(String produceDt) {
		this.produceDt = produceDt;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getAppearance() {
		return appearance;
	}
	public void setAppearance(String appearance) {
		this.appearance = appearance;
	}
	public String getQuality() {
		return quality;
	}
	public void setQuality(String quality) {
		this.quality = quality;
	}
	public String getClassification() {
		return classification;
	}
	public void setClassification(String classification) {
		this.classification = classification;
	}
	public String getSubtitleSupport() {
		return subtitleSupport;
	}
	public void setSubtitleSupport(String subtitleSupport) {
		this.subtitleSupport = subtitleSupport;
	}
	public String getContentIntro() {
		return contentIntro;
	}
	public void setContentIntro(String contentIntro) {
		this.contentIntro = contentIntro;
	}
	public long getViews() {
		return views;
	}
	public void setViews(long views) {
		this.views = views;
	}
	public long getDayViewCnt() {
		return dayViewCnt;
	}
	public void setDayViewCnt(long dayViewCnt) {
		this.dayViewCnt = dayViewCnt;
	}
	public long getWeekViewCnt() {
		return weekViewCnt;
	}
	public void setWeekViewCnt(long weekViewCnt) {
		this.weekViewCnt = weekViewCnt;
	}
	public long getMonthViewCnt() {
		return monthViewCnt;
	}
	public void setMonthViewCnt(long monthViewCnt) {
		this.monthViewCnt = monthViewCnt;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getGoodsFileName() {
		return goodsFileName;
	}
	public void setGoodsFileName(String goodsFileName) {
		this.goodsFileName = goodsFileName;
	}
	public Date getEnrollDt() {
		return enrollDt;
	}
	public void setEnrollDt(Date enrollDt) {
		this.enrollDt = enrollDt;
	}
	
	@Override
	public String toString() {
		return "GoodsDTO [goodsCd=" + goodsCd + ", goodsNm=" + goodsNm + ", nation=" + nation + ", produceDt="
				+ produceDt + ", genre=" + genre + ", category=" + category + ", appearance=" + appearance
				+ ", quality=" + quality + ", classification=" + classification + ", subtitleSupport=" + subtitleSupport
				+ ", contentIntro=" + contentIntro + ", views=" + views + ", dayViewCnt=" + dayViewCnt
				+ ", weekViewCnt=" + weekViewCnt + ", monthViewCnt=" + monthViewCnt + ", director=" + director
				+ ", sort=" + sort + ", goodsFileName=" + goodsFileName + ", enrollDt=" + enrollDt + "]";
	}
	

	

	
}
