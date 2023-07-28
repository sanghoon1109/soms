<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>404 error</title>
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
	                <div class="inner-circle"><i class="fa fa-home"></i><span>404</span></div>
	                <span class="inner-status"><h2>길을 잃으셨나요?</h2></span>
	                <span class="inner-detail"><strong>
	                    죄송합니다. 해당 페이지를 찾을 수 없습니다. 홈페이지로
	                    이동해 다양한 콘텐츠를 만나보세요.<br></strong><br>
	                    <a href="${contextPath }/" class="button" style="padding: 10px;"><i class="fa fa-home"></i> HOME</a>
	                </span>
	            </div>
	        </div>
	    </div>
	</div>
	<input type="button" value="12"/>
</body>
</html>