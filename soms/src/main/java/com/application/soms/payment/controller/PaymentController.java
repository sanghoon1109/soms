package com.application.soms.payment.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.application.soms.member.dto.MemberDTO;
import com.application.soms.payment.dto.PaymentDTO;
import com.application.soms.payment.service.PaymentService;

@Controller
@RequestMapping("/order")
public class PaymentController {

	@Autowired
	private PaymentService paymentService;
	
	@GetMapping("/payment")
	public ModelAndView payment(MemberDTO memberDTO) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/order/payment");
		mv.addObject("memberDTO", memberDTO);
		mv.addObject("payDTO", paymentService.paymentInfo(memberDTO.getMemberId()));
		
		
		return mv;
	}
	
	@PostMapping("/payment")
	public ResponseEntity<Object> payment(PaymentDTO paymentDTO, HttpServletRequest request) throws Exception {
		
		System.out.println(paymentDTO);
		System.out.println("결제 방법 : " + paymentDTO.getPayMethod());
		String payMethod = paymentDTO.getPayMethod();
		System.out.println("payMethod : "+ payMethod);
		if(paymentService.getExistingPaymentId(paymentDTO)) {
			if(payMethod.equals("phone")) {
				paymentService.existPhonePayment(paymentDTO);
			}
			else if (payMethod.equals("card")){
				paymentService.existCardPayment(paymentDTO);
			}
		}
		else {		
			if(payMethod.equals("phone")){
				paymentService.phonePayment(paymentDTO);
			}
			else if(payMethod.equals("card")) {
				paymentService.cardPayment(paymentDTO);	
			}
		}
		
		paymentService.addTotalPayment(paymentDTO);
		
		String jsScript = "<script>";
		jsScript += "alert('결제되었습니다.');";
		jsScript += "location.href='" + request.getContextPath() + "/myPage/myInfo?memberId="+ paymentDTO.getMemberId() +"';";
		jsScript += "</script>";
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
	}
	
}
