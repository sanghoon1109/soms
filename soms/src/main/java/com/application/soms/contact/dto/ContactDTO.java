package com.application.soms.contact.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class ContactDTO {

	private int contactCd;
	private String email;
	private String name;
	private String subject;
	private String message;
	private Date contactDt;
	
	public int getContactCd() {
		return contactCd;
	}
	public void setContactCd(int contactCd) {
		this.contactCd = contactCd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Date getContactDt() {
		return contactDt;
	}
	public void setContactDt(Date contactDt) {
		this.contactDt = contactDt;
	}
	
	@Override
	public String toString() {
		return "ContactDTO [contactCd=" + contactCd + ", email=" + email + ", name=" + name + ", subject=" + subject
				+ ", message=" + message + ", contactDt=" + contactDt + "]";
	}
	
	
	
}
