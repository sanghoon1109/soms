<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	
	function getClassification() {
		var url = "${contextPath }/goods/goodsSearch"
		    url += "?search=" + $("#classification").val();
		
		location.href = url;
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
                        <a href="${contextPath }/"><i class="fa fa-home"></i> Home</a>
                        <span style='color=white;'>${search }</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<!-- Breadcrumb End -->
	<!-- Product Section Begin -->
	<section class="product-page spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="product__page__content">
						<div class="product__page__title">
							<div class="row">
								<div class="col-lg-8 col-md-8 col-sm-6">
									<div class="section-title">
										<h4>'${search }'</h4>
									</div>
								</div>
								<div class="col-lg-4 col-md-4 col-sm-6">
									<div class="product__page__filter">
										<p>시청 등급:</p>
										<select id="classification" onchange="getClassification()">
											<option value="전체관람가">전체관람가</option>
											<option value="12세이상관람가">12세이상관람가</option>
											<option value="15세이상관람가">15세이상관람가</option>
											<option value="청소년관람불가">청소년관람불가</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<c:choose>
								<c:when test="${empty searchList}">
									<div class="product__item">
										<h3 style='color: white;'>등록된 상품이 없습니다.</h3>
									</div>
								</c:when>
								<c:otherwise>
									<c:forEach var="searchDTO" items="${searchList }">
										<div class="col-lg-4 col-md-6 col-sm-6">
											<div class="product__item">
												<a href="${contextPath }/goods/goodsDetail?goodsCd=${searchDTO.goodsCd}&memberId=${sessionScope.memberId}">
													<div class="product__item__pic set-bg" data-setbg="${searchDTO.goodsFileName }"></div>
												</a>
												<div class="product__item__text">
													<ul>
														<li>Active</li>
														<li>Movie</li>
													</ul>
													<h5>
														<a href="${contextPath }/goods/goodsDetail?goodsCd=${searchDTO.goodsCd}&memberId=${sessionScope.memberId}">${searchDTO.goodsNm }</a>
													</h5>
												</div>
											</div>
										</div>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>