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
		var validatePasswd = false;
		var validateId = false;
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
		
		$("#memberId").blur(function(){
			    var memberId = $("#memberId").val();
				var checkId = "";
			   
			    $.ajax({
			       type : "get",
			       url  : "${contextPath}/member/checkDuplicatedId?memberId=" + memberId,
			       success : function (data){
			    	   console.log(data);
			          if (data == "duplicate"){
			        	  checkId += "<span style='color:green;'>";
			        	  checkId += "* 사용 가능한 아이디 입니다";
			        	  checkId += "</span>";
						  validateId = true;
			    		  $("#checkId").html(checkId);
			          }
			          else {
			        	  checkId += "<span style='color:red;' class='icon_error-oct_alt'>";
			        	  checkId += " 이미 가입 된 아이디 입니다";
			        	  checkId += "</span>";
						  validateId = false;
						  $("#checkId").html(checkId);
			          }
			       }
			    });
			});
		
		$("form").submit(function(){
			
			
			if(!validatePasswd) {
				alert("비밀번호를 확인해주세요");
				return false;
			}
			
			if(!validateId) {
				alert("아이디를 다시 입력해주세요");
				return false;
			}
			
			
		});
		
	});
	
</script>
</head>
<body>
	<!-- Normal Breadcrumb Begin -->
    <section class="normal-breadcrumb set-bg" >
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="normal__breadcrumb__text">
                        <h2>Sign Up</h2>
                        <p>Welcome to the official Insetop.</p>
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
								<input type="email" name="memberId" id="memberId" placeholder="Email address" required> <span class="icon_mail"></span>
							</div>
								<div id="checkId"><span style='color:green;' class="icon_error-oct_alt"> 이메일 형식으로 입력해주세요</span></div><br>
							<div class="input__item">
								<input type="text" name="memberNm" placeholder="Your Name" required>
								<span class="icon_profile"></span>
							</div>
							<div class="input__item">
								<input type="password" name="passwd" id="passwd" placeholder="Password" required> 
								<span class="icon_lock"></span>
							</div>
							<div class="input__item">
								<input type="password" id="checkPasswd" placeholder="Check Password" required> 
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