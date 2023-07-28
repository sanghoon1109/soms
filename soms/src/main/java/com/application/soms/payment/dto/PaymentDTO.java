package com.application.soms.payment.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class PaymentDTO {

	private long payCd;
	private String memberId;
	private String orderNm;
	private String orderHp;
	private int paymentAmount;
	private String payMethod;
	private String cardCompanyNm;
	private String cardPayMonth;
	private String payOrderHp;
	private String membership;
	private int daysLeft;
	private Date payOrderTime;
	
	public long getPayCd() {
		return payCd;
	}
	public void setPayCd(long payCd) {
		this.payCd = payCd;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getOrderNm() {
		return orderNm;
	}
	public void setOrderNm(String orderNm) {
		this.orderNm = orderNm;
	}
	public String getOrderHp() {
		return orderHp;
	}
	public void setOrderHp(String orderHp) {
		this.orderHp = orderHp;
	}
	public int getPaymentAmount() {
		return paymentAmount;
	}
	public void setPaymentAmount(int paymentAmount) {
		this.paymentAmount = paymentAmount;
	}
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	public String getCardCompanyNm() {
		return cardCompanyNm;
	}
	public void setCardCompanyNm(String cardCompanyNm) {
		this.cardCompanyNm = cardCompanyNm;
	}
	public String getCardPayMonth() {
		return cardPayMonth;
	}
	public void setCardPayMonth(String cardPayMonth) {
		this.cardPayMonth = cardPayMonth;
	}
	public String getPayOrderHp() {
		return payOrderHp;
	}
	public void setPayOrderHp(String payOrderHp) {
		this.payOrderHp = payOrderHp;
	}
	public String getMembership() {
		return membership;
	}
	public void setMembership(String membership) {
		this.membership = membership;
	}
	public int getDaysLeft() {
		return daysLeft;
	}
	public void setDaysLeft(int daysLeft) {
		this.daysLeft = daysLeft;
	}
	public Date getPayOrderTime() {
		return payOrderTime;
	}
	public void setPayOrderTime(Date payOrderTime) {
		this.payOrderTime = payOrderTime;
	}
	
	@Override
	public String toString() {
		return "PaymentDTO [payCd=" + payCd + ", memberId=" + memberId + ", orderNm=" + orderNm + ", orderHp=" + orderHp
				+ ", paymentAmount=" + paymentAmount + ", payMethod=" + payMethod + ", cardCompanyNm=" + cardCompanyNm
				+ ", cardPayMonth=" + cardPayMonth + ", payOrderHp=" + payOrderHp + ", membership=" + membership
				+ ", daysLeft=" + daysLeft + ", payOrderTime=" + payOrderTime + "]";
	}
	
}
