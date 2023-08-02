package com.application.soms.common.controller;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;


@Component
@Aspect
public class LogSoms {

	
	private static Logger logger = LoggerFactory.getLogger(LogSoms.class);

	// to do
	
//	@After("execution(* com.application.soms.member.service.MemberService.login(*))")
//	public void somsLogger() throws Throwable {
//		
//		
//	}
	
//	@Around("execution(* com.application.soms.member.service.MemberService.login(*))")
//	public void somsLogger(ProceedingJoinPoint pjp) throws Throwable {
//		long startTime = System.currentTimeMillis();
//		pjp.proceed(); // ?
//		long endTime = System.currentTimeMillis();
//		
//		logger.info(pjp.getSignature().getName() + " 메서드 호출 시간 : " + (endTime - startTime));
//		
//	}
	
}
