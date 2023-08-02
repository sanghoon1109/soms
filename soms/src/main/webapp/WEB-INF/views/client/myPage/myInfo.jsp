<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script>
	
	function checkRemove() {
		(async () => {
		    const { value: passwd } = await Swal.fire({
		        title: '비밀번호를 입력하세요.',
		        text: '그저 본인확인일 뿐입니다...',
		        input: 'text',
		        inputPlaceholder: 'password..'
		    })

		    if (passwd) {
		        Swal.fire(`확인중입니다.`).then(function(){
		        	var memberId = "${memberDTO.memberId}";
		        	var param = {"passwd" : passwd,
								"memberId" : memberId}
					$.ajax({
						type : "post",
						url : "${contextPath}/member/checkDuplicatedPasswd",
						data : param,
						success : function (data) {
							if(data == "equals") {
							       Swal.fire({
							            title: '정말로 탈퇴 하시겠습니까?',
							            text: "다시 되돌릴 수 없습니다. 신중하세요.",
							            icon: 'warning',
							            showCancelButton: true,
							            confirmButtonColor: '#3085d6',
							            cancelButtonColor: '#d33',
							            confirmButtonText: '승인',
							            cancelButtonText: '취소'
							        }).then((result) => {
							            if (result.isConfirmed) {
							                Swal.fire(
							                    '탈퇴가 완료되었습니다.',
							                    '다음에 꼭 다시 봐요!',
							                    'success'
							                ).then(function(){
							    				location.href='${contextPath }/member/removeMember?memberId=${memberDTO.memberId}';
							    			})
							            }
							        })
							}
							else {
								Swal.fire({
									  icon: 'error',
									  title: '본인이 아니군요...',
									  text: '비밀번호를 다시 확인해주세요!'
									})
							}
						}
					});
				})
		    }
		})()	
	}
	
</script>
</head>
<body>
 <!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="${contextPath }/main"><i class="fa fa-home"></i> Home</a>
                        <span>MyInfo</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->
	<!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">
        <div class="container" >
            <div class="row" >
                <div class="col-lg-8" >    
                     <h3>
                     	&emsp;&emsp;<span style="color:white;"><strong>내 정보</strong></span>
                     </h3>                  
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->
	<c:choose>
		<c:when test="${memberDTO.sex eq null }">
			<div class="container text-center" >            		
						<div class="anime__details__btn"><br><br>
           					<a href="${contextPath }/myPage/addInfo?memberId=${memberDTO.memberId}" class="follow-btn"><span class="icon_info"></span> 내정보 추가 입력</a>
           					<a href="javascript:checkRemove()" class="follow-btn"><span class="icon_trash_alt"></span> 회원탈퇴</a>
           					<a href="${contextPath }/member/membership?memberId=${memberDTO.memberId}" class="follow-btn"><span class="icon_menu"></span> 멤버쉽</a>
           				</div> 
           			</div>
         		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		</c:when>
		<c:otherwise>
			    <section class="sign spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="login__form">
                    		<h5 style="color:white;"><strong>${memberDTO.memberId }님의 프로필</strong></h5><br><br>
						    <div class="anime__review__item">
                          		<div class="anime__review__item__pic">
									<p><img src="${contextPath }/myPage/thumbnails?fileName=${memberDTO.profile}" width="50" height="50" alt="프로필"></p>
								</div>
							</div>
						<ul>
							<li>
								<span style="color:white;">성함</span>
								<p style="color:white;"><strong> : &nbsp;${memberDTO.memberNm }</strong></p>
							</li>
							<li>
								<span style="color:white;">전화번호</span>
								<p style="color:white;">
									<strong> : &nbsp;${memberDTO.hp }</strong><br>
									<span style="color:white;"><strong> 
										* 문자메시지 수신동의
										<c:choose>
											<c:when test="${memberDTO.smsstsYn eq 'N' }">
												<strong> : &nbsp;비동의</strong>					
											</c:when>
											<c:otherwise>
												<strong> : &nbsp;동의</strong>		
											</c:otherwise>
										</c:choose>
									</strong></span>
								</p>
							</li>
							<li>
								<span style="color:white;">성별</span>
								<c:choose>
									<c:when test="${memberDTO.sex eq 'm' }">
										<p style="color:white;"><strong> : &nbsp;남성</strong></p>					
									</c:when>
									<c:otherwise>
										<p style="color:white;"><strong> : &nbsp;여성</strong></p>			
									</c:otherwise>
								</c:choose>
							</li>
							<li>
								<span style="color:white;">생년월일</span>
								<p style="color:white;"><strong> : &nbsp;${memberDTO.dateBirth }</strong></p>
							</li>
							<li>
								<span style="color:white;">서비스 가입일자</span>
								<p style="color:white;"><strong> : &nbsp;<fmt:formatDate value="${memberDTO.joinDt }" pattern="yyyy년 MM월 dd일"/></strong></p>
							</li>
							<li>
								<span style="color:white;">주소</span>
								<p style="color:white;"><strong>
									${memberDTO.zipcode }</strong><br>
									<strong>${memberDTO.roadAddress }</strong><br>
									<strong>${memberDTO.jibunAddress }</strong><br>
									<strong>${memberDTO.namujiAddress }</strong>
								</p>
							</li>
							<li>
								<span style="color:white;">현재 멤버쉽 상태</span>
								<c:choose>
									<c:when test="${membershipDTO eq null || membershipDTO.membership eq 'notApp'}">
										<p style="color:white;"><strong> : &nbsp;없음</strong></p>
									</c:when>
									<c:otherwise>
										<p style="color:white;"><strong> : &nbsp;${membershipDTO.membership }<br>현재 ${membershipDTO.daysLeft }일 남음</strong></p>
									</c:otherwise>
								</c:choose>
							</li>
						</ul>
                    </div>
                </div>
                
                <div class="col-lg-6">
					<div class="container text-center" >            		
						<div class="anime__details__btn"><br><br><br><br>
           					<a href="${contextPath }/myPage/addInfo?memberId=${memberDTO.memberId}" class="follow-btn"><span class="icon_info"></span> 내정보 추가 입력</a>
           					<a href="javascript:checkRemove()" class="follow-btn"><span class="icon_trash_alt"></span> 회원탈퇴</a>
           					<a href="${contextPath }/member/membership?memberId=${memberDTO.memberId}" class="follow-btn"><span class="icon_menu"></span> 멤버쉽</a>
           				</div> 
           			</div>
            </div>
        </div>
    </section>
    <!-- Signup Section End -->
			
		</c:otherwise>
	</c:choose>
	

       
</body>
</html>