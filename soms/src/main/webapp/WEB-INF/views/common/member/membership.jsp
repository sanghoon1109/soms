<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath }/resources/bootstrap/css/membership.css">
<script>
	function checkMembership(membership) {
	       Swal.fire({
	            title: membership + '으로 하시겠습니까?',
	            icon: 'warning',
	            showCancelButton: true,
	            confirmButtonColor: '#3085d6',
	            cancelButtonColor: '#d33',
	            confirmButtonText: '승인',
	            cancelButtonText: '취소'
	        }).then((result) => {
	            if (result.isConfirmed) {
	            	var memberId = "${memberId}";
					location.href="${contextPath}/order/payment?memberId=" + memberId + "&membership=" + membership;
	            }
	        })
	}
</script>
</head>
<body>

	<!-- Normal Breadcrumb Begin -->
    <section class="normal-breadcrumb set-bg" >
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="normal__breadcrumb__text">
                        <h2>Membership</h2>
                        <p>Check your membership</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Normal Breadcrumb End -->

	<div class="container">
	  <div class="table-responsive">
	    <table class="table">
		      <thead>
		        <tr>
		          <th scope="col"></th>
		          <th scope="col">Premium</th>
		          <th scope="col">Standard</th>
		          <th scope="col">Basic</th>
		        </tr>
		      </thead>
		      <tbody style='color:white;'>
		        <tr>
		          <td class="noBorder">모바일+태블릿+PC</td>
		          <td class="noBorder"><i class="fa fa-check"></i></td>
		          <td class="noBorder"><i class="fa fa-check"></i></td>
		          <td class="noBorder"><i class="fa fa-check"></i></td>
		        </tr>
		        <tr>
		          <td class="noBorder">TV</td>
		          <td class="noBorder"><i class="fa fa-check"></i></td>
		          <td class="noBorder"><i class="fa fa-check"></i></td>
		          <td class="noBorder">-</td>
		        </tr>
		        <tr>
		          <td class="noBorder">화질</td>
		          <td class="noBorder">최고화질</td>
		          <td class="noBorder">HD</td>
		          <td class="noBorder">저화질</td>
		        </tr>
		        <tr>
		          <td class="noBorder">동시시청</td>
		          <td class="noBorder">4명</td>
		          <td class="noBorder">2명</td>
		          <td class="noBorder">1명</td>
		        </tr>
		        <tr>
		          <td class="noBorder">결제금액</td>
		          <td class="noBorder">월 13000￦</td>
		          <td class="noBorder">월 10000￦</td>
		          <td class="noBorder">월 7000￦</td>
		        </tr>
		      </tbody>
		    </table>
		    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
		<button class="site-btn text-center" onclick="checkMembership('Premium')">Premium</button>&nbsp;
		<button class="site-btn text-center" onclick="checkMembership('Standard')">Standard</button>&nbsp;
		<button class="site-btn text-center" onclick="checkMembership('Basic')">Basic</button>
	  </div>
	</div>

<br><br><br><br><br>
</body>
</html>