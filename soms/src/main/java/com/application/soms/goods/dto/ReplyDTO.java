package com.application.soms.goods.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class ReplyDTO {

	private long replyId;
	private String memberId;
	private String memberNm;
	private String memberProfile;
	private String replyContent;
	private Date replyDt;
	private int goodsCd;
	
	public long getReplyId() {
		return replyId;
	}
	public void setReplyId(long replyId) {
		this.replyId = replyId;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberNm() {
		return memberNm;
	}
	public void setMemberNm(String memberNm) {
		this.memberNm = memberNm;
	}
	public String getMemberProfile() {
		return memberProfile;
	}
	public void setMemberProfile(String memberProfile) {
		this.memberProfile = memberProfile;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public Date getReplyDt() {
		return replyDt;
	}
	public void setReplyDt(Date replyDt) {
		this.replyDt = replyDt;
	}
	public int getGoodsCd() {
		return goodsCd;
	}
	public void setGoodsCd(int goodsCd) {
		this.goodsCd = goodsCd;
	}
	@Override
	public String toString() {
		return "ReplyDTO [replyId=" + replyId + ", memberId=" + memberId + ", memberNm=" + memberNm + ", memberProfile="
				+ memberProfile + ", replyContent=" + replyContent + ", replyDt=" + replyDt + ", goodsCd=" + goodsCd
				+ "]";
	}
	


	

	
	
	
}
