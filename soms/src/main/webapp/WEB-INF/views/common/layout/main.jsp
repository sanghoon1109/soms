<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<c:set var="sessionId" value="${sessionScope.memberId }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script>
	
	function processId(goodsCd, sort) {
		console.log("goodsCd" + goodsCd);
		console.log("sort" + sort);
		if("${sessionId == null}" == "true") {
			Swal.fire('로그인 후 이용해주세요').then(function(){
				location.href='${contextPath }/member/login';
			})
		}
		else if(goodsCd == "0") {
			location.href="${contextPath }/goods/goodsList?sort=" + sort + "&memberId=${sessionId}";
		}
		else {
			location.href="${contextPath }/goods/goodsDetail?goodsCd=" + goodsCd + "&memberId=${sessionId}";
		}
		
	}
	
	
</script>
</head>
<body>
	<!-- Hero Section Begin -->
    <section class="hero">
        <div class="container">
            <div class="hero__slider owl-carousel">
                <div class="hero__items set-bg" data-setbg="${contextPath }/resources/bootstrap/img/hero/hero-1.jpg">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="hero__text">
                                <div class="label">Adventure</div>
                                <h2>Fate / Stay Night: Unlimited Blade Works</h2>
                                <p>After 30 days of travel across the world...</p>
                                <a href="#"><span>Watch Now</span> <i class="fa fa-angle-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="hero__items set-bg" data-setbg="${contextPath }/resources/bootstrap/img/hero/hero-1.jpg">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="hero__text">
                                <div class="label">Adventure</div>
                                <h2>Fate / Stay Night: Unlimited Blade Works</h2>
                                <p>After 30 days of travel across the world...</p>
                                <a href="#"><span>Watch Now</span> <i class="fa fa-angle-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="hero__items set-bg" data-setbg="${contextPath }/resources/bootstrap/img/hero/hero-1.jpg">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="hero__text">
                                <div class="label">Adventure</div>
                                <h2>Fate / Stay Night: Unlimited Blade Works</h2>
                                <p>After 30 days of travel across the world...</p>
                                <a href="#"><span>Watch Now</span> <i class="fa fa-angle-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="trending__product">
                        <div class="row">
                            <div class="col-lg-8 col-md-8 col-sm-8">
                                <div class="section-title">
                                    <h4>New</h4>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <div class="btn__all">
                                    <a href="javascript:processId(0, 'new')" class="primary-btn">View All <span class="arrow_right"></span></a>
                                </div>
                            </div>
                        </div>
                        <div class="row">
			                   	<c:choose>
			                   		<c:when test="${empty newList}">
			                            <div class="product__item">
			                    			<h3 style='color:white;'>등록된 상품이 없습니다.</h3>
			                            </div>
			                   		</c:when>
			                   		<c:otherwise>
			                   		<c:forEach var="goodsDTO" items="${newList }" begin="1" end="6" step="1">
                           						 <div class="col-lg-4 col-md-6 col-sm-6">
					                                <div class="product__item">
					                               	 <a href="javascript:processId(${goodsDTO.goodsCd})">
														<div class="product__item__pic set-bg" data-setbg="${goodsDTO.goodsFileName }" >
					                                   	 </div>
					                               			</a>
					                                    	<div class="product__item__text">
					                                        	<ul>
					                                      	      	<li>Active</li>
					                                            	<li>Movie</li>
					                                        	</ul>
					                                       	 	<h5><a href="javascript:processId(${goodsDTO.goodsCd})">${goodsDTO.goodsNm }</a></h5>
					                                    	</div>
					                                	</div>
                         						   </div>						
			                   			</c:forEach>
			                   		 </c:otherwise>                  	
			                   	</c:choose>
                        </div>
                    </div>
                    <div class="popular__product">
                        <div class="row">
                            <div class="col-lg-8 col-md-8 col-sm-8">
                                <div class="section-title">
                                    <h4>Popular</h4>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <div class="btn__all">
                                    <a href="javascript:processId(0, 'popular')" class="primary-btn">View All <span class="arrow_right"></span></a>
                                </div>
                            </div>
                        </div>
                        <div class="row">
			                   	<c:choose>
			                   		<c:when test="${empty popularList}">
			                            <div class="product__item">
			                    			<h3 style='color:white;'>등록된 상품이 없습니다.</h3>
			                            </div>
			                   		</c:when>
			                   		<c:otherwise>
			                   		<c:forEach var="goodsDTO" items="${popularList }" begin="1" end="6" step="1">
                           						 <div class="col-lg-4 col-md-6 col-sm-6">
					                                <div class="product__item">
					                               	 <a href="javascript:processId(${goodsDTO.goodsCd})">
														<div class="product__item__pic set-bg" data-setbg="${goodsDTO.goodsFileName }" >
					                                   	 </div>
					                               			</a>
					                                    	<div class="product__item__text">
					                                        	<ul>
					                                      	      	<li>Active</li>
					                                            	<li>Movie</li>
					                                        	</ul>
					                                       	 	<h5><a href="javascript:processId(${goodsDTO.goodsCd})">${goodsDTO.goodsNm }</a></h5>
					                                    	</div>
					                                	</div>
                         						   </div>						
			                   			</c:forEach>
			                   		 </c:otherwise>                  	
			                   	</c:choose>
                        </div>
                    </div>                   
                    <div class="recent__product">
                        <div class="row">
                            <div class="col-lg-8 col-md-8 col-sm-8">
                                <div class="section-title">
                                    <h4>Best</h4>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <div class="btn__all">
                                    <a href="javascript:processId(0, 'best')" class="primary-btn">View All <span class="arrow_right"></span></a>
                                </div>
                            </div>
                        </div>
                        <div class="row">
			                   	<c:choose>
			                   		<c:when test="${empty bestList}">
			                            <div class="product__item">
			                    			<h3 style='color:white;'>등록된 상품이 없습니다.</h3>
			                            </div>
			                   		</c:when>
			                   		<c:otherwise>
			                   		<c:forEach var="goodsDTO" items="${bestList }" begin="1" end="6" step="1">

                           						 <div class="col-lg-4 col-md-6 col-sm-6">
					                                <div class="product__item">
					                               	 <a href="javascript:processId(${goodsDTO.goodsCd})">
														<div class="product__item__pic set-bg" data-setbg="${goodsDTO.goodsFileName }" >
					                                   	 </div>
					                               			</a>
					                                    	<div class="product__item__text">
					                                        	<ul>
					                                      	      	<li>Active</li>
					                                            	<li>Movie</li>
					                                        	</ul>
					                                       	 	<h5><a href="javascript:processId(${goodsDTO.goodsCd})">${goodsDTO.goodsNm }</a></h5>
					                                    	</div>
					                                	</div>
                         						   </div>						

			                   			</c:forEach>
			                   		 </c:otherwise>                  	
			                   	</c:choose>
                        </div>
                    </div>                    
                    <div class="live__product">
                        <div class="row">
                            <div class="col-lg-8 col-md-8 col-sm-8">
                                <div class="section-title">
                                    <h4>General</h4>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <div class="btn__all">
                                    <a href="javascript:processId(0, 'general')" class="primary-btn">View All <span class="arrow_right"></span></a>
                                </div>
                            </div>
                        </div>
                        <div class="row">
			                   	<c:choose>
			                   		<c:when test="${empty generalList}">
			                            <div class="product__item">
			                    			<h3 style='color:white;'>등록된 상품이 없습니다.</h3>
			                            </div>
			                   		</c:when>
			                   		<c:otherwise>
			                   		<c:forEach var="goodsDTO" items="${generalList }" begin="1" end="6" step="1">
                           						 <div class="col-lg-4 col-md-6 col-sm-6">
					                                <div class="product__item">
					                               	 <a href="javascript:processId(${goodsDTO.goodsCd})">
														<div class="product__item__pic set-bg" data-setbg="${goodsDTO.goodsFileName }" >
					                                   	 </div>
					                               			</a>
					                                    	<div class="product__item__text">
					                                        	<ul>
					                                      	      	<li>Active</li>
					                                            	<li>Movie</li>
					                                        	</ul>
					                                       	 	<h5><a href="javascript:processId(${goodsDTO.goodsCd})">${goodsDTO.goodsNm }</a></h5>
					                                    	</div>
					                                	</div>
                         						   </div>
			                   			</c:forEach>
			                   		 </c:otherwise>                  	
			                   	</c:choose>
                        </div>
                    </div>
                    <div class="recent__product">
                        <div class="row">
                            <div class="col-lg-8 col-md-8 col-sm-8">
                                <div class="section-title">
                                    <h4>Steady</h4>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <div class="btn__all">
                                    <a href="javascript:processId(0, 'steady')" class="primary-btn">View All <span class="arrow_right"></span></a>
                                </div>
                            </div>
                        </div>
                        <div class="row">
			                   	<c:choose>
			                   		<c:when test="${empty steadyList}" >
			                            <div class="product__item">
			                    			<h3 style='color:white;'>등록된 상품이 없습니다.</h3>
			                            </div>
			                   		</c:when>
			                   		<c:otherwise>
			                   		<c:forEach var="goodsDTO" items="${steadyList }" begin="1" end="6" step="1">
                           						 <div class="col-lg-4 col-md-6 col-sm-6">
					                                <div class="product__item">
					                               	 <a href="javascript:processId(${goodsDTO.goodsCd})">
														<div class="product__item__pic set-bg" data-setbg="${goodsDTO.goodsFileName }" >
					                                   	 </div>
					                               			</a>
					                                    	<div class="product__item__text">
					                                        	<ul>
					                                      	      	<li>Active</li>
					                                            	<li>Movie</li>
					                                        	</ul>
					                                       	 	<h5><a href="javascript:processId(${goodsDTO.goodsCd})">${goodsDTO.goodsNm }</a></h5>
					                                    	</div>
					                                	</div>
                         						   </div>						
			                   			</c:forEach>
			                   		 </c:otherwise>                  	
			                   	</c:choose>
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
                                <li data-filter=".month">2Week</li>
                            </ul>
                            <div class="filter__gallery">
                            	${dayList.goodsFileName }
                                <div class="product__sidebar__view__item set-bg mix day" data-setbg="${dayList.goodsFileName }">
                                <div class="view"><i class="fa fa-eye"></i> ${dayList.dayViewCnt }</div>
                                <h5><a href="javascript:processId(${dayList.goodsCd})">${dayList.goodsNm }</a></h5>
                            </div>
                            <div class="product__sidebar__view__item set-bg mix week" data-setbg="${contextPath }/resources/bootstrap/img/sidebar/tv-2.jpg">
                            <div class="ep">18 / ?</div>
                            <div class="view"><i class="fa fa-eye"></i> 9141</div>
                            <h5><a href="#">The Seven Deadly Sins: Wrath of the Gods</a></h5>
                        </div>
                        <div class="product__sidebar__view__item set-bg mix 2week" data-setbg="${contextPath }/resources/bootstrap/img/sidebar/tv-3.jpg">
                        <div class="ep">18 / ?</div>
                        <div class="view"><i class="fa fa-eye"></i> 9141</div>
                        <h5><a href="#">Sword art online alicization war of underworld</a></h5>
                    </div>
        </div>
    </div>
    <div class="product__sidebar__comment">
        <div class="section-title">
            <h5>New Comment</h5>
        </div>
        <div class="product__sidebar__comment__item">
            <div class="product__sidebar__comment__item__pic">
                <img src="${contextPath }/resources/bootstrap/img/sidebar/comment-1.jpg" alt="">
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
                <img src="${contextPath }/resources/bootstrap/img/sidebar/comment-2.jpg" alt="">
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
                <img src="${contextPath }/resources/bootstrap/img/sidebar/comment-3.jpg" alt="">
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
                <img src="${contextPath }/resources/bootstrap/img/sidebar/comment-4.jpg" alt="">
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