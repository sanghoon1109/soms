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
    <section class="normal-breadcrumb set-bg" data-setbg="${contextPath }/resources/bootstrap/img/normal-breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="normal__breadcrumb__text">
                        <h2>추가정보</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Normal Breadcrumb End -->

    <!-- Signup Section Begin -->
    <section class="signup spad">
        <div class="container">
            <div class="row">
				<div class="col-lg-6">
					<div class="login__form">
						<h3>Sign Up</h3>
						<form action="${contextPath }/member/signup" method="post">
							<div class="input__item">
								<input type="email" name="" id="memberId"
									placeholder="Email address"> <span class="icon_mail"></span>
							</div>
							<div class="input__item">
								<input type="text" name="memberNm" placeholder="Your Name">
								<span class="icon_profile"></span>
							</div>
							<div class="input__item">
								<input type="password" name="passwd" id="passwd" placeholder="Password"> 
								<span class="icon_lock"></span>
							</div>
							<div class="input__item">
								<input type="password" id="checkPasswd" placeholder="Check Password"> 
								<span class="icon_lock"></span>
							</div>
							<div id="textPasswd"></div>
							<button type="submit" class="site-btn">Signup</button>
						</form>
						<h5>
							Already have an account? <a href="${contextPath }/member/login">Log In!</a>
						</h5>
					</div>
				</div>
				<div class="col-lg-6">
                    <div class="login__social__links">
                        <h3>Login With:</h3>
                        <ul>
                            <li><a href="#" class="facebook"><i class="fa fa-facebook"></i> Sign in With Facebook</a>
                            </li>
                            <li><a href="#" class="google"><i class="fa fa-google"></i> Sign in With Google</a></li>
                            <li><a href="#" class="twitter"><i class="fa fa-twitter"></i> Sign in With Twitter</a></li>
                        </ul>
                           <br><br><br><br> <button type="submit" class="site-btn">Signup</button>
                       
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Signup Section End -->
</body>
</html>