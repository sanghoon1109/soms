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
                <div class="hero__items set-bg" data-setbg="${contextPath }/resources/bootstrap/img/xOY2tKrep2ikGJsdRWyzbfLbjsX.jpg">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="hero__text">
                                <div class="label">Adventure</div>
                                <div class="label">Best</div>
                                <h2>스파이더맨: 어크로스 더 유니버스</h2>
                                 <p><strong>
    	                            스파이더맨 VS 스파이더맨?!<br>
	                                상상 그 이상을 넘어서는 멀티버스의 세계가 열린다!
                                </strong></p>
                                <a href="javascript:processId(29)"><span>Watch Now</span> <i class="fa fa-angle-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="hero__items set-bg" data-setbg="${contextPath }/resources/bootstrap/img/elemental-yp.jpg">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="hero__text">
                                <div class="label">Adventure</div>
                                <div class="label">Popular</div>
                                <h2>엘리멘탈</h2>
                                <p><strong>
    	                            디즈니·픽사의 놀라운 상상력!<br>
	                                올여름, 세상이 살아 숨 쉰다 
                                </strong></p>
                                <a href="javascript:processId(44)"><span>Watch Now</span> <i class="fa fa-angle-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="hero__items set-bg" data-setbg="${contextPath }/resources/bootstrap/img/maxresdefault.jpg">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="hero__text">
                                <div class="label">Action</div>
                                <div class="label">Popular</div>
                                <h2>범죄도시 3</h2>
                                <p><strong>
                                	나쁜 놈들 잡는 데 이유 없고 제한 없다<br>
                                	커진 판도 시원하게 싹 쓸어버린다!
                                </strong></p>
                                <a href="javascript:processId(5)"><span>Watch Now</span> <i class="fa fa-angle-right"></i></a>
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
    <div class="product__sidebar__comment">
        <div class="section-title">
            <h5>New Comment</h5>
        </div>
        <c:choose>
        <c:when test="${replyList eq null}">
        </c:when>
        <c:otherwise>
        	<c:forEach var="replyDTO" items="${replyList }">
		        <div class="product__sidebar__comment__item">
		            <div class="product__sidebar__comment__item__pic">
               			 <a href="javascript:processId(${replyDTO.goodsCd})"><img src="${replyDTO.goodsFileName }" alt="사진" width="60" height="80"></a>
            		</div>
		            	<div class="product__sidebar__comment__item__text">
		               	 			<ul>
		                    			<li>Active</li>
		                    			<li>Movie</li>
		                			</ul>
		                		<h5 style='color:white;'><a href="javascript:processId(${replyDTO.goodsCd})">${replyDTO.goodsNm }</a></h5>
		               		 <span><i class="fa fa-eye"></i> ${replyDTO.views } Viewes</span>
		            	</div>
		        	</div>
        		</c:forEach>
        	</c:otherwise>
        </c:choose>
    </div>
</div>
</div>
</div>
</section>
<!-- Product Section End -->
</body>
</html>