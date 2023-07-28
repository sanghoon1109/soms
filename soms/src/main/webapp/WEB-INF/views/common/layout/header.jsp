<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	    <header class="header">
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    <div class="header__logo">
                        <a href="${contextPath }/">
                            <img src="${contextPath }/resources/bootstrap/img/logo.PNG"  width="93" height="23" alt="로고">
                        </a>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="header__nav">
                        <nav class="header__menu mobile-menu">
                            <ul>
                                <li class="active"><a href="./index.html">Homepage</a></li>
                                <li><a href="./categories.html">Categories <span class="arrow_carrot-down"></span></a>
                                    <ul class="dropdown">
                                        <li><a href="./categories.html">Categories</a></li>
                                        <li><a href="${contextPath }/member/membership">membership</a></li>
                                        <li><a href="./anime-watching.html">Anime Watching</a></li>
                                        <li><a href="./blog-details.html">Blog Details</a></li>
                                        <li><a href="${contextPath }/member/signup">Sign Up</a></li>
                                        <li><a href="${contextPath }/member/login">Login</a></li>
                                    </ul>
                                </li>
                                <li><a href="./blog.html">Our Blog</a></li>
                                <li><a href="${contextPath }/contact">Contacts</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <div class="col-lg-2">
                    <div class="header__right">
                        <c:choose>
                    			<c:when test="${sessionScope.memberId eq null }">
		                    		<div class="header__right__auth">
				                           <a href="${contextPath }/member/login">Login</a>
				                           <a href="${contextPath }/member/signup">Signup</a>
				                    </div>
	                    		</c:when>
                    		<c:otherwise>
		                        <div class="header__right__auth">
								   <a href="#" class="search-switch"><span class="icon_search"></span></a>
		                           <a href="${contextPath }/member/logout">logout</a>
                       			   <a href="${contextPath }/myPage/myInfo?memberId=${sessionScope.memberId}"><span class="icon_profile"></span></a>
		                        </div>
                    		</c:otherwise>
                    	</c:choose>
                    </div>
                </div>
            </div>
            <div id="mobile-menu-wrap"></div>
        </div>
    </header>
</body>
</html>