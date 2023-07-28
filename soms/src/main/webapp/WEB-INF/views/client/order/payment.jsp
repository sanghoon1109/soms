<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath }/resources/bootstrap/css/radio.css">
<script>

	function setPayMethod(){
		
		var method = $("[name='payMethod']").val();
		if (method == 'card') {
			$("#cardPayMonth,#cardCompanyNm").show();
			$("#payOrdererHp").hide();
		}
		else {
			$("#cardPayMonth,#cardCompanyNm").hide();
			$("#payOrdererHp").show();
			$("[name='payOrdererHp']").val("${orderer.hp }");
		}
		
	}

</script>
</head>
<body>
	<!-- Product Section Begin -->
	<section class="product-page spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="product__page__content">
						<div class="product__page__title">
							<div class="row">
								<div class="col-lg-8 col-md-8 col-sm-12">
									<div class="section-title">
										<h4>멤버쉽 결제</h4>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<form action="${contextPath }/order/payment" method="post">
							<p>
								&nbsp;<h3 style="color: white;">주문 상품</h3>
							</p>
								<c:choose>
									<c:when test="${memberDTO.membership eq 'Premium' }">
										<h4 style="color: white;">${memberDTO.membership }</h4>
										<h6 style="color: white;">
											모바일+태블릿+PC+TV<br>
											최고화질, 동시시청, Insetop 영화 및 콘텐츠
										</h6><br>
										<input type="hidden" name="paymentAmount" value="13000"/>	
									</c:when>
									<c:when test="${memberDTO.membership eq 'Standard' }">
										<h4 style="color: white;">${memberDTO.membership }</h4>
										<h6 style="color: white;">
											모바일+태블릿+PC+TV<br>
											HD화질, 동시시청, Insetop 영화 및 콘텐츠
										</h6><br>	
										<input type="hidden" name="paymentAmount" value="10000"/>
									</c:when>
									<c:when test="${memberDTO.membership eq 'Basic' }">
										<h4 style="color: white;">${memberDTO.membership }</h4>
										<h6 style="color: white;">
											모바일+태블릿+PC<br>
											저화질, 동시시청, Insetop 영화 및 콘텐츠
										</h6><br>	
										<input type="hidden" name="paymentAmount" value="7000"/>
									</c:when>
								</c:choose>
                    <div class="col-lg-12">
                    <br><br>
					<div class="product__page__content">
						<div class="product__page__title">
							<div class="row">
								<div class="col-lg-8 col-md-8 col-sm-12">
									<div class="section-title">
										<h4>결제상세</h4>
									</div>
								</div>
							</div>
						</div>
					</div>
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="checkout__form__input">
                                    <p style="color: white;">주문자 성함 <span>*</span></p>
	                                    <input type="text" name="orderNm" value="${payDTO.memberNm }">
                                </div>
                            </div><br>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="checkout__form__input">
                                    <p style="color: white;">주문자 연락처 <span>*</span></p>
                                    <input type="text" name="orderHp" value="${payDTO.hp }">
                                </div>
                            </div><br>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="checkout__order__widget">
                                    <p style="color: white;">결제방법 <span>*</span></p>
                                    <select name="payMethod" onchange="setPayMethod()">
                                    	<option value="card">카드결제</option>
                                    	<option value="phone">휴대폰결제</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12">
                            </div>
                            <div id="cardCompanyNm" class="col-lg-6 col-md-6 col-sm-6">
                                <div class="checkout__order__widget">
                                    <p style="color: white;">카드회사 <span>*</span></p>
	                                <select name="cardCompanyNm">
										<option value="삼성">삼성</option>
										<option value="하나SK">하나SK</option>
										<option value="현대">현대</option>
										<option value="KB">KB</option>
										<option value="신한">신한</option>
										<option value="롯데">롯데</option>
										<option value="BC">BC</option>
										<option value="시티">시티</option>
										<option value="NH농협">NH농협</option>
								   </select>
                                </div>
                            </div>
                            <div id="cardPayMonth" class="col-lg-6 col-md-6 col-sm-6">
                                <div class="checkout__order__widget">
                                    <p style="color: white;">할부개월 <span>*</span></p>
                                    <select name="cardPayMonth">
										<option value="0">일시불</option>                                    
										<option value="1">1개월</option>                                    
										<option value="2">2개월</option>                                    
										<option value="3">3개월</option>                                    
										<option value="4">4개월</option>                                    
										<option value="5">5개월</option>                                    
										<option value="6">6개월</option>                                    
                                    </select>
                                </div>
                            </div>
                            <div id="payOrdererHp" class="col-lg-6 col-md-6 col-sm-6" style="display: none">
                                <div class="checkout__form__input">
                                    <p style="color: white;">결제 휴대폰 번호 <span>*</span></p>
                                    <input type="text" name="payOrderHp">
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12">
                            </div>
                            <br><br>
                        </div>
	                     <div align="right">
	                     	<input type="hidden" name="memberId" value="${memberDTO.memberId }"/>
	                     	<input type="hidden" name="membership" value="${memberDTO.membership }"/>
	                        <button type="submit" class="site-btn"><span class="icon_check"></span> 결제</button>
	                    </div>
                        </div>
						</form>
					</div>
				</div>

			</div>
		</div>

	</section>
</body>
</html>