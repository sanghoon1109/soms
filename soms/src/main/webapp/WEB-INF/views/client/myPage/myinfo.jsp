<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	
	$().ready(function(){
		
		
		
	});
	
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
           					<a href="${contextPath }/myPage/addInfo" class="follow-btn"><span class="icon_info"></span> 내정보 추가 입력</a>
           					<a href="#" class="follow-btn"><span class="icon_trash_alt"></span> 회원탈퇴</a>
           				</div> 
           			</div>
         		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		</c:when>
	</c:choose>
	

       
</body>
</html>