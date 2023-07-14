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
	<!-- Normal Breadcrumb Begin -->
    <section class="normal-breadcrumb set-bg" data-setbg="img/normal-breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="normal__breadcrumb__text">
                        <h2>비밀번호 찾기</h2>
                        <p>잃어버린 비밀번호의 아이디를 입력하세요</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Normal Breadcrumb End -->

    <!-- Login Section Begin -->
        <div class="container">
              <div class="col-lg-18">
                  <div class="blog__details__form">
                      <h3>Login</h3>
                      <form action="${contextPath }/member/login" method="post">
                              <input type="email" name="memberId" placeholder="Email address" size="10">
                          <button type="submit" class="site-btn">Find Now</button>
                      </form>
                  </div>
              </div>
        </div>
    <!-- Login Section End -->
</body>
</html>