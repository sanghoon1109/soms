<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                        <span>${goodsDTO.goodsNm }</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Anime Section Begin -->
    <section class="anime-details spad">
        <div class="container">
            <div class="anime__details__content">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="anime__details__pic set-bg" data-setbg="${goodsDTO.goodsFileName }">
                            <div class="comment"><i class="fa fa-comments"></i> ${replyCnt }</div>
                            <div class="view"><i class="fa fa-eye"></i> ${goodsDTO.views }</div>
                        </div>
                    </div>
                    <div class="col-lg-9">
                        <div class="anime__details__text">
                            <div class="anime__details__title">
                                <h3>${goodsDTO.goodsNm }</h3>
                                <span>${goodsDTO.director } / ${goodsDTO.appearance }</span>
                            </div>
                            <div class="anime__details__rating">
                                <div class="rating">
                                    <a href="#"><i class="fa fa-star"></i></a>
                                    <a href="#"><i class="fa fa-star"></i></a>
                                    <a href="#"><i class="fa fa-star"></i></a>
                                    <a href="#"><i class="fa fa-star"></i></a>
                                    <a href="#"><i class="fa fa-star-half-o"></i></a>
                                </div>
                                <span>1.029 Votes</span>
                            </div>
                            <div class="anime__details__widget">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6">
                                        <ul>
                                            <li><span>Sort:</span> ${goodsDTO.sort }</li>
                                            <li><span>Nation:</span> ${goodsDTO.nation }</li>
                                            <li><span>Date aired:</span> ${goodsDTO.produceDt }</li>
                                            <li><span>Category:</span> ${goodsDTO.category }</li>
                                            <li><span>Genre:</span> ${goodsDTO.genre }</li>
                                        </ul>
                                    </div>
                                    <div class="col-lg-6 col-md-6">
                                        <ul>
                                            <li><span>Scores:</span> 7.31 / 1,515</li>
                                            <li><span>Rating:</span> 8.5 / 161 times</li>
                                            <li><span>Duration:</span> 24 min/ep</li>
                                            <li><span>Quality:</span> ${goodsDTO.quality }</li>
                                            <li><span>Views:</span> ${goodsDTO.views }</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="anime__details__btn">
                                <a href="#" class="follow-btn"><i class="fa fa-heart-o"></i> Follow</a>
                                <a href="${contextPath }/goods/goodsWatching?goodsCd=${goodsDTO.goodsCd}" class="watch-btn"><span>Watch Now</span> <i class="fa fa-angle-right"></i></a>
                                </div>
                            </div>                        
                        </div>
                    </div>
                    <p><div style="color:white;">${goodsDTO.contentIntro }</div></p> 
                </div>
                <div class="row">
                    <div class="col-lg-8 col-md-8">
                        <div class="anime__details__review">
                            <div class="section-title">
                                <h5>Reviews</h5>
                            </div>
                           	<c:choose>
                           		<c:when test="${empty replyList }">
                           			<h3 style='color:white;'>등록된 댓글이 없습니다.</h3>
                           		</c:when>
                           		<c:otherwise>       
                           			 <c:forEach var="replyDTO" items="${replyList }">
			                            <div class="anime__review__item">
			                                <div class="anime__review__item__pic">
			                                	<c:choose>
			                                		<c:when test="${replyDTO.memberProfile eq ''}">
			                                 		   <img src="${contextPath }/resources/bootstrap/img/default_profile.png" alt="기본프로필">			                                		
			                                		</c:when>
			                                		<c:otherwise>
			                                 		   <img src="${contextPath }/myPage/thumbnails?fileName=${replyDTO.memberProfile}" alt="프로필">			                                		
			                                		</c:otherwise>
			                                	</c:choose>
			                                </div>
			                                <div class="anime__review__item__text">
			                                    <h6>${replyDTO.memberNm } - <span><fmt:formatDate value="${replyDTO.replyDt }" pattern="yyyy년MM월dd일"/></span></h6>
			                                    <p>${replyDTO.replyContent }</p>
			                                </div>
			                            </div>
                           			 </c:forEach>                 		
                           		</c:otherwise>
                           	</c:choose>
                        </div>
                        <div class="anime__details__form">
                            <div class="section-title">
                                <h5>Your Comment</h5>
                            </div>
                            <form action="${contextPath }/goods/addReply" method="post">
                                <textarea placeholder="Your Comment" name="replyContent"></textarea>
                                <input type="hidden" name="memberNm" value="${memberDTO.memberNm }">
                                <input type="hidden" name="memberId" value="${memberDTO.memberId }">
                                <input type="hidden" name="profile" value="${memberDTO.profile }">
                                <input type="hidden" name="goodsCd" value="${goodsDTO.goodsCd }">
                                <button type="submit"><i class="fa fa-location-arrow"></i> Review</button>
                            </form>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4">
                        <div class="anime__details__sidebar">
                            <div class="section-title">
                                <h5>you might like...</h5>
                            </div>
                            <c:forEach var="goodsDTO" items="${rankList }">
			                        <div class="product__sidebar__view__item set-bg" data-setbg="${goodsDTO.goodsFileName }">
	                                <div class="ep">${goodsDTO.sort }</div>
	                                <div class="view"><i class="fa fa-eye"></i>${goodsDTO.views }</div>
	                                <h5><a href="${contextPath }/goods/goodsDetail?goodsCd=${goodsDTO.goodsCd}&memberId=${memberDTO.memberId }">${goodsDTO.goodsNm }</a></h5>
	                            </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Anime Section End -->
	
</body>
</html>