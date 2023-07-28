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
		$("#onePageViewCnt").val("${onePageViewCnt}");
	});
	
	function getGoodsList() {
		var url = "${contextPath }/goods/goodsList"
		    url += "?onePageViewCnt=" + $("#onePageViewCnt").val();
			url += "&sort=" + "${sort}"
			url += "&memberId=" + "${sessionScope.memberId }"
			
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
                        <span style='color=white;'>${sort }</span>
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
                                        <h4>${sort }</h4>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6">
                                    <div class="product__page__filter">
                                        <p>LIMIT:</p>
                                        <select id="onePageViewCnt" onchange="getGoodsList()" >
                                            <option value="6">6개</option>
                                            <option value="9">9개</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
			                   	<c:choose>
			                   		<c:when test="${empty allGoodsList}">
			                            <div class="product__item">
			                    			<h3 style='color:white;'>등록된 상품이 없습니다.</h3>
			                            </div>
			                   		</c:when>
			                   		<c:otherwise>
			                   		<c:forEach var="goodsDTO" items="${allGoodsList }" >
                           						 <div class="col-lg-4 col-md-6 col-sm-6">
					                                <div class="product__item">
					                               	 <a href="${contextPath }/goods/goodsDetail?goodsCd=${goodsDTO.goodsCd}&memberId=${memberDTO.memberId}">
														<div class="product__item__pic set-bg" data-setbg="${goodsDTO.goodsFileName }" >
					                                   	 </div>
					                               			</a>
					                                    	<div class="product__item__text">
					                                        	<ul>
					                                      	      	<li>Active</li>
					                                            	<li>Movie</li>
					                                        	</ul>
					                                       	 	<h5><a href="${contextPath }/goods/goodsDetail?goodsCd=${goodsDTO.goodsCd}&memberId=${memberDTO.memberId}">${goodsDTO.goodsNm }</a></h5>
					                                    	</div>
					                                	</div>
                         						   </div>						
			                   			</c:forEach>
			                   		 </c:otherwise>                  	
			                   	</c:choose>
                </div>
                    <div class="product__pagination">         
                    	<c:if test="${startPage > 5}">
	                        <a href="${contextPath }/goods/goodsList?currentPageNumber=${startPage - 5}&onePageViewCnt=${onePageViewCnt }&sort=${sort}&memberId=${sessionScope.memberId }"><i class="fa fa-angle-double-left"></i></a>
	                    </c:if>
	                    <c:forEach var="i" begin="${startPage }" end="${endPage }">
	                        <a href="${contextPath }/goods/goodsList?currentPageNumber=${i }&onePageViewCnt=${onePageViewCnt }&sort=${sort}&memberId=${sessionScope.memberId }">${i }</a>
	                    </c:forEach>
	                    <c:if test="${endPage != allPageCnt && endPage >= 5}">
	                        <a href="${contextPath }/goods/goodsList?currentPageNumber=${startPage + 5}&onePageViewCnt=${onePageViewCnt }&sort=${sort}&memberId=${sessionScope.memberId }"><i class="fa fa-angle-double-right"></i></a>
	                    </c:if>
                    </div>
                </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-8">
                    <div class="product__sidebar">
                        <div class="product__sidebar__view">
                            <div class="section-title">
                                <h5>Top Views</h5>
                            </div>
                            <ul class="filter__controls">
                                <li class="active" data-filter=".day">Day</li>
                                <li data-filter=".week">Week</li>
                                <li data-filter=".month">Month</li>
                            </ul>
		                    <div class="filter__gallery">
                            <c:choose>
                            	<c:when test="${empty dayList }">
                           			 <div class="product__item">
		                            </div>
                            	</c:when>
                            	<c:otherwise>
                            	<c:forEach var="dayDTO" items="${dayList }">
		                                <div class="product__sidebar__view__item set-bg mix day" data-setbg="${dayDTO.goodsFileName }">
		                                <div class="ep">${dayDTO.sort }</div>
		                                <div class="view"><i class="fa fa-eye"></i>${dayDTO.dayView }</div>
		                                <h5><a href="javascript:processId(${dayDTO.goodsCd})">${dayDTO.goodsNm }</a></h5>
		                            </div>
                            	</c:forEach>
                            	</c:otherwise>
                            </c:choose>
							<c:choose>
								<c:when test="${empty weekList }">
									<div class="product__item">
									</div>
								</c:when>
								<c:otherwise>
									<c:forEach var="weekDTO" items="${weekList }">
										<div class="product__sidebar__view__item set-bg mix week" data-setbg="${weekDTO.goodsFileName }">
											<div class="ep">${weekDTO.sort }</div>
											<div class="view">
												<i class="fa fa-eye"></i>${weekDTO.weekView }
											</div>
											<h5>
												<a href="javascript:processId(${weekDTO.goodsCd})">${weekDTO.goodsNm }</a>
											</h5>
										</div>
									</c:forEach>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${empty weekList }">
									<div class="product__item"></div>
								</c:when>
								<c:otherwise>
									<c:forEach var="monthDTO" items="${monthList }">
										<div class="product__sidebar__view__item set-bg mix month" data-setbg="${monthDTO.goodsFileName }">
											<div class="ep">${monthDTO.sort }</div>
											<div class="view">
												<i class="fa fa-eye"></i>${monthDTO.monthView }
											</div>
											<h5>
												<a href="javascript:processId(${monthDTO.goodsCd})">${monthDTO.goodsNm }</a>
											</h5>
										</div>
									</c:forEach>
								</c:otherwise>
							</c:choose>
							</div>
						</div>
    </div>
</div>
</div>
</div>
</section>
<!-- Product Section End -->
	
</body>
</html>