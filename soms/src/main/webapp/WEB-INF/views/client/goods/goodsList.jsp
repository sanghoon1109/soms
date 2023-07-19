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
		console.log("onepageviewcnt" + $("#onePageViewCnt").val());
		var url = "${contextPath }/goods/goodsList"
		    url += "?onePageViewCnt=" + $("#onePageViewCnt").val();
			url += "&sort=" + "${sort}"
			
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
					                                       	 	<h5><a href="${contextPath }/goods/goodsDetail?goodsCd=${goodsDTO.goodsCd}">${goodsDTO.goodsNm }</a></h5>
					                                    	</div>
					                                	</div>
                         						   </div>						
			                   			</c:forEach>
			                   		 </c:otherwise>                  	
			                   	</c:choose>
                    <div class="product__pagination">         
                    	<c:if test="${startPage > 5}">
	                        <a href="${contextPath }/goods/goodsList?currentPageNumber=${startPage - 5}&onePageViewCnt=${onePageViewCnt }&sort=${sort}"><i class="fa fa-angle-double-left"></i></a>
	                    </c:if>
	                    <c:forEach var="i" begin="${startPage }" end="${endPage }">
	                        <a href="${contextPath }/goods/goodsList?currentPageNumber=${i }&onePageViewCnt=${onePageViewCnt }&sort=${sort}">${i }</a>
	                    </c:forEach>
	                    <c:if test="${endPage != allPageCnt && endPage >= 5}">
	                        <a href="${contextPath }/goods/goodsList?currentPageNumber=${startPage + 5}&onePageViewCnt=${onePageViewCnt }&sort=${sort}"><i class="fa fa-angle-double-right"></i></a>
	                    </c:if>
                    </div>
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
                                <li class="active" data-filter="*">Day</li>
                                <li data-filter=".week">Week</li>
                                <li data-filter=".month">Month</li>
                                <li data-filter=".years">Years</li>
                            </ul>
                            <div class="filter__gallery">
                                <div class="product__sidebar__view__item set-bg mix day years"
                                data-setbg="img/sidebar/tv-1.jpg">
                                <div class="ep">18 / ?</div>
                                <div class="view"><i class="fa fa-eye"></i> 9141</div>
                                <h5><a href="#">Boruto: Naruto next generations</a></h5>
                            </div>
                            <div class="product__sidebar__view__item set-bg mix month week"
                            data-setbg="img/sidebar/tv-2.jpg">
                            <div class="ep">18 / ?</div>
                            <div class="view"><i class="fa fa-eye"></i> 9141</div>
                            <h5><a href="#">The Seven Deadly Sins: Wrath of the Gods</a></h5>
                        </div>
                        <div class="product__sidebar__view__item set-bg mix week years"
                        data-setbg="img/sidebar/tv-3.jpg">
                        <div class="ep">18 / ?</div>
                        <div class="view"><i class="fa fa-eye"></i> 9141</div>
                        <h5><a href="#">Sword art online alicization war of underworld</a></h5>
                    </div>
                    <div class="product__sidebar__view__item set-bg mix years month"
                    data-setbg="img/sidebar/tv-4.jpg">
                    <div class="ep">18 / ?</div>
                    <div class="view"><i class="fa fa-eye"></i> 9141</div>
                    <h5><a href="#">Fate/stay night: Heaven's Feel I. presage flower</a></h5>
                </div>
                <div class="product__sidebar__view__item set-bg mix day"
                data-setbg="img/sidebar/tv-5.jpg">
                <div class="ep">18 / ?</div>
                <div class="view"><i class="fa fa-eye"></i> 9141</div>
                <h5><a href="#">Fate stay night unlimited blade works</a></h5>
            </div>
        </div>
    </div>
    <div class="product__sidebar__comment">
        <div class="section-title">
            <h5>New Comment</h5>
        </div>
        <div class="product__sidebar__comment__item">
            <div class="product__sidebar__comment__item__pic">
                <img src="img/sidebar/comment-1.jpg" alt="">
            </div>
            <div class="product__sidebar__comment__item__text">
                <ul>
                    <li>Active</li>
                    <li>Movie</li>
                </ul>
                <h5><a href="#">The Seven Deadly Sins: Wrath of the Gods</a></h5>
                <span><i class="fa fa-eye"></i> 19.141 Viewes</span>
            </div>
        </div>
        <div class="product__sidebar__comment__item">
            <div class="product__sidebar__comment__item__pic">
                <img src="img/sidebar/comment-2.jpg" alt="">
            </div>
            <div class="product__sidebar__comment__item__text">
                <ul>
                    <li>Active</li>
                    <li>Movie</li>
                </ul>
                <h5><a href="#">Shirogane Tamashii hen Kouhan sen</a></h5>
                <span><i class="fa fa-eye"></i> 19.141 Viewes</span>
            </div>
        </div>
        <div class="product__sidebar__comment__item">
            <div class="product__sidebar__comment__item__pic">
                <img src="img/sidebar/comment-3.jpg" alt="">
            </div>
            <div class="product__sidebar__comment__item__text">
                <ul>
                    <li>Active</li>
                    <li>Movie</li>
                </ul>
                <h5><a href="#">Kizumonogatari III: Reiket su-hen</a></h5>
                <span><i class="fa fa-eye"></i> 19.141 Viewes</span>
            </div>
        </div>
        <div class="product__sidebar__comment__item">
            <div class="product__sidebar__comment__item__pic">
                <img src="img/sidebar/comment-4.jpg" alt="">
            </div>
            <div class="product__sidebar__comment__item__text">
                <ul>
                    <li>Active</li>
                    <li>Movie</li>
                </ul>
                <h5><a href="#">Monogatari Series: Second Season</a></h5>
                <span><i class="fa fa-eye"></i> 19.141 Viewes</span>
            </div>
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