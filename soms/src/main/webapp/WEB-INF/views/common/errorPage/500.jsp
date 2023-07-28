<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>500 error</title>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="${contextPath }/resources/bootstrap/css/404.css">
<script src="${contextPath }/resources/bootstrap/js/jquery-3.3.1.min.js"></script>
<script>
document.querySelectorAll('.button').forEach(button => button.innerHTML = '<div><span>' + button.textContent.trim().split('').join('</span><span>') + '</span></div>');
</script>
</head>
<body>
	<div class="page-404">
	    <div class="outer">
	        <div class="middle">
	            <div class="inner">
	                <!--BEGIN CONTENT-->
	                <div class="inner-circle"><i class="fa fa-home"></i><span>500</span></div>
	                <span class="inner-status"><h3>잠시 후 다시 확인해주세요!</h3></span>
	                <span class="inner-detail"><strong>
	                    지금 이 서비스와 연결할 수 없습니다.<br>
	                    현재 문제를 해결 중이니<br>
	                    잠시 후 다시 확인해주세요
	                    </strong><br><br>
	                    <a href="${contextPath }/" class="button" style="padding: 10px;"><i class="fa fa-home"></i> HOME</a>
	                </span>
	            </div>
	        </div>
	    </div>
	</div>
	<input type="button" value="12"/>
</body>
</html>