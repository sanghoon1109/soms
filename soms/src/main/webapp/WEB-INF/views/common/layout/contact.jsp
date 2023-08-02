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
	<!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="${contextPath }/"><i class="fa fa-home"></i> Home</a>
                        <span>contact</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->


    <!-- Signup Section Begin -->
    <section class="sign spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="login__form">
                        <h3>CONTACT INFO</h3>
						<ul>
							<li>
								<h6>
									<span style="color:red;"><i class="fa fa-map-marker"></i></span> <span style="color:white;"> &nbsp; Address </span>
								</h6>
								<p style="color:white;">서울특별시 강남구 강남대로94길 13, 삼경빌딩 1층~5층</p>
							</li>
							<li>
								<h6>
									<span style="color:red;"><i class="fa fa-phone"></i></span> <span style="color:white;"> &nbsp; Phone </span>
								</h6>
								<p style="color:white;">02-385-4243</p>
							</li>
							<li>
								<h6>
									<span style="color:red;"><i class="fa fa-headphones"></i></span> <span style="color:white;"> &nbsp;Support</span>
								</h6>
								<p style="color:white;">tkdgns7108@gmail.com</p>
							</li>
						</ul>
						<h3>SEND MESSAGE</h3>
						 <form action="${contextPath }/contact/addContact" method="post">
						    <div class="input__item">
                                <input type="text" placeholder="Subject" name="subject">
                                <span class="icon_pencil_alt"></span>
                            </div>
                            <div class="input__item">
                                <input type="email" placeholder="Email address" name="email">
                                <span class="icon_mail"></span>
                            </div>
                            <div class="input__item">
                                <input type="text" placeholder="Your Name" name="name">
                                <span class="icon_profile"></span>
                            </div>
                                <textarea placeholder=" Message"  rows ="5" cols="40" name="message"></textarea>
                                <button type="submit" class="site-btn">Send Message</button>                           
                        </form>
                    </div>
                </div>
                
                <div class="col-lg-6">
					<!-- 지도 -->
					<div id="daumRoughmapContainer1600749162322"
						class="mymap root_daum_roughmap root_daum_roughmap_landing os_mac"
						style="z-index: 2; width: 450px;">

					<script charset="UTF-8" class="daum_roughmap_loader_script"
						src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
					<script charset="UTF-8"
						src="http://t1.daumcdn.net/kakaomapweb/place/jscss/roughmap/b88f2e2f/roughmapLander.js"></script>
					<script charset="UTF-8"
						src="http://t1.daumcdn.net/kakaomapweb/place/jscss/roughmap/b88f2e2f/roughmapLander.js"></script>
					<!-- 3. 실행 스크립트 -->
					<script charset="UTF-8">
						new daum.roughmap.Lander({
							"timestamp" : "1600749162322",
							"key" : "226ga",
							"mapWidth" : "450",
							"mapHeight" : "707"
						}).render();
					</script>
                </div>
            </div>
        </div>
    </section>
    <!-- Signup Section End -->
	
</body>
</html>