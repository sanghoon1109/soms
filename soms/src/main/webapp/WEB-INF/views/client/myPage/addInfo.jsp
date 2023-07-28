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
	$().ready(function(){
		var validatePasswd = false;
		
		$("#checkPasswd").keyup(function(){
			var checkPasswd = "";
				
				if($("#passwd").val() != $("#checkPasswd").val()) {
					checkPasswd += "<span style='color:red;'>";
					checkPasswd += "* 비밀번호를 다시 확인해주세요";
					checkPasswd += "</span>";
					
				}
				else {
					checkPasswd += "<span style='color:green;'>";
					checkPasswd += "* 확인되었습니다";
					checkPasswd += "</span>";
					validatePasswd = true;
				}
				$("#textPasswd").html(checkPasswd);
			});
			
			$("#passwd").keyup(function(){
				var checkPasswd = "";
					
					if($("#passwd").val() != $("#checkPasswd").val()) {
						checkPasswd += "<span style='color:red;'>";
						checkPasswd += "* 비밀번호를 다시 확인해주세요";
						checkPasswd += "</span>";
						
					}
					else {
						checkPasswd += "<span style='color:green;'>";
						checkPasswd += "* 확인되었습니다";
						checkPasswd += "</span>";
						validatePasswd = true;
					}
					$("#textPasswd").html(checkPasswd);
				});
		
		$("form").submit(function(){
			
			
			if(!validatePasswd) {
				alert("비밀번호를 확인해주세요");
				return false;
			}
			$("[name='hp']").val($("#hp1").val() +"-" + $("#hp2").val() +"-" + $("#hp3").val());
			$("[name='dateBirth']").val($("#birthY").val() + "-" + $("#birthM").val() + "-" + $("#birthD").val());
			
		});
		
	});
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
										<h4>내 정보 추가/수정</h4>
									</div>
								</div>
								<div class="col-lg-4 col-md-4 col-sm-6">
									<div class="product__page__filter">
										<div class="anime__details__btn">
											<a href="#" class="follow-btn"><span class="icon_trash_alt"></span> 회원탈퇴</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<form action="${contextPath }/myPage/addInfo" method="post" enctype="multipart/form-data">
							<p>
								<h4 style="color: white;">프로필 사진</h4>
							</p>
								<div class="filebox">
								  <label for="ex_file">업로드</label>
								  <input type="file" id="ex_file" name="profile" accept="image/gif,image/jpeg,image/png"> 
								</div>
							<p>
								<h4 style="color: white;">성별</h4>
							</p>
							<label> <input type="radio" name="sex" value="m" checked />
								<span style="color: white;">남성</span>
							</label> <label> <input type="radio" name="sex" value="f" /> <span
								style="color: white;">여성</span>
							</label>
							<p>
								<h4 style="color: white;">생년월일</h4>
							</p>
								<input type="text" placeholder="년도" id="birthY" style="width: 70px;" required maxlength="4" /><span style="color: white;"> 년</span> &nbsp;
								<input type="text" placeholder="월" id="birthM" style="width: 40px;" required maxlength="2" /><span style="color: white;"> 월</span> &nbsp;
								<input type="text" placeholder="일" id="birthD" style="width: 40px;" required maxlength="2" /><span style="color: white;"> 일</span> 
								<input type="hidden" name="dateBirth"/>
							<p><h4 style="color: white;">전화번호</h4></p>
							<select id="hp1">
								<option selected value="010">010</option>
								<option value="011">031</option>
								<option value="019">011</option>
							</select> &nbsp; <span style="color: white;"> - </span> 
						   <input type="text" id="hp2" style="width: 70px;" required maxlength="4"/> <span style="color: white;"> - </span> 
						   <input type="text" id="hp3" style="width: 70px;" required maxlength="4"/> <br><br>
						   <input type="hidden" name="hp"/>
						   <h5 style="color: white;">BMS에서 발송하는 SMS 소식을 수신합니다.</h5>
  						    <input type="checkbox" style="width: 18px;" id="smsstsYn" name="smsstsYn" value="Y"/>
                                <div class="checkout__form__input">
                      				<p>
										<h4 style="color: white;">우편번호</h4>
									</p> 
                                    <input type="text" id="zipcode" name="zipcode" style="width: 20%;" required>&nbsp;
                                    <input type="button" value="검색" onclick="execDaumPostcode();" style="width: 15%; padding-left: 0;">
                                </div>
                                <div class="checkout__form__input">
                                    <p>
										<h6 style="color: white;">도로명주소</h6>
									</p> 
                                    <input type="text" id="roadAddress" name="roadAddress" placeholder="도로명주소를 입력하세요." required style="width: 100%;">
                                </div>
                                <div class="checkout__form__input">
                                    <p>
										<h6 style="color: white;">지번주소</h6>
									</p> 
                                    <input type="text" id="jibunAddress" name="jibunAddress" placeholder="지번주소를 입력하세요." required style="width: 100%;">
                                </div>
                                <div class="checkout__form__input">
                                                                        <p>
										<h6 style="color: white;">나머지주소</h6>
									</p> 
                                    <input type="text" id="namujiAddress" name="namujiAddress" placeholder="나머지주소를 입력하세요." style="width: 100%;">
                                </div>
                                <p>
									<h6 style="color: white;">비밀번호 확인</h6>
								</p> 
                                <input type="password" name="passwd" id="passwd" placeholder="비밀번호" required style="width: 60%;"><br><br> 
                                <input type="password" id="checkPasswd" placeholder="비밀번호 확인" required style="width: 60%;">
                                <div id="textPasswd"></div>
                                <br>
                                <input type="hidden" name="memberId" value="${memberDTO.memberId }"/>
                                <button type="submit" class="site-btn">저장</button>
						</form>
					</div>
				</div>

			</div>
		</div>

	</section>
	


</body>
</html>