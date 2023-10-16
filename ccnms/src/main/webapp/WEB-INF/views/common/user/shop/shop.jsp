<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<c:set var="sessionId" value="${sessionScope.userId }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function myCart(productCd) {
		if ("${sessionId == null}" == "true") {
			Swal.fire({
				  icon: 'info',
				  title: '로그인 후에 이용가능합니다.',
				  footer: '<a href="${contextPath }/user/loginUser">로그인 페이지로 이동하기</a>'
				})
		}
		else {
			location.href="${contextPath}/order/myCart?productCd=" + productCd;
		}
	}
	function myKeep(productCd) {
		if ("${sessionId == null}" == "true") {
			Swal.fire({
				  icon: 'info',
				  title: '로그인 후에 이용가능합니다.',
				  footer: '<a href="${contextPath }/user/loginUser">로그인 페이지로 이동하기</a>'
				})
		}
		else {
			$.ajax ({
				url:"${contextPath}/order/addMyKeep",
				type:"get",
				data: {
					"productCd" : productCd, 
					"keepQty" : 1	
				},
				success:function(result) {
					if (result =="duple") {
						Swal.fire('이미 추가된 상품입니다.');
					}
					else {
						Swal.fire({
							  text: '장바구니에 추가되었습니다.',
							  footer: '<a href="">장바구니로 이동하기</a>'
							})
					}
				}
			})
		}
	}


</script>
</head>
<body>
<section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-5">
                    <div class="sidebar">
                        <div class="sidebar__item">
                        	<c:if test="${sessionScope.userId != null}">
                        		<a href="${contextPath }/shop/addProduct"><input type="button" id="addProduct" value="상품 올리기"/></a>
                        	</c:if>
                        	<br>
                            <h4>카테고리</h4>
                            <ul>
                                <li><a href="${contextPath }/shop/?sort=sale"><img alt="유저마켓에러" src="${contextPath }/resources/bootstrap/img/shop.png"><strong>&emsp;유저마켓</strong></a></li>
	                            <li><a href="${contextPath }/shop/?sort=Modudigging"><img alt="디깅마켓에러" src="${contextPath }/resources/bootstrap/img/shop.png"><strong>&emsp;디깅마켓</strong></a></li>
	                            <li><a href="${contextPath }/shop/?sort=exchange"><img alt="교환마켓에러" src="${contextPath }/resources/bootstrap/img/horizontal.png"><strong>&emsp;교환마켓</strong></a></li>
                            </ul>
                        </div>
                        <div class="sidebar__item">
                            <h4>Price</h4>
                            <div class="price-range-wrap">
                                <div class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
                                    data-min="10" data-max="540">
                                    <div class="ui-slider-range ui-corner-all ui-widget-header"></div>
                                    <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                                    <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                                </div>
                                <div class="range-slider">
                                    <div class="price-input">
                                        <input type="text" id="minamount">
                                        <input type="text" id="maxamount">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="sidebar__item">
                            <h4>인기있는 태그</h4>
                            <div class="sidebar__item__size">
                                <label for="large">
                                    Large
                                    <input type="radio" id="large">
                                </label>
                            </div>
                            <div class="sidebar__item__size">
                                <label for="medium">
                                    Medium
                                    <input type="radio" id="medium">
                                </label>
                            </div>
                            <div class="sidebar__item__size">
                                <label for="small">
                                    Small
                                    <input type="radio" id="small">
                                </label>
                            </div>
                            <div class="sidebar__item__size">
                                <label for="tiny">
                                    Tiny
                                    <input type="radio" id="tiny">
                                </label>
                            </div>
                        </div>
                        <div class="sidebar__item">
                            <div class="latest-product__text">
                                <h4>최신 상품</h4>
                                <div class="latest-product__slider owl-carousel">
                                    <div class="latest-prdouct__slider__item">
                                    	<c:forEach var="shopDTO" items="${shopList}" begin="0" end="2">
                                        <a href="#" class="latest-product__item">
                                            <div class="latest-product__item__pic">
                                                <img src="${contextPath }/shop/thumbnails?file=${shopDTO.productFile}" alt="">
                                            </div>
                                            <div class="latest-product__item__text">
                                                <h6>${shopDTO.productNm }</h6>
                                                <span>${shopDTO.price }</span>
                                            </div>
                                        </a>
                                    	</c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 col-md-7">
                    <div class="product__discount">
                        <div class="section-title product__discount__title">
                            <h2>Sale Off</h2>
                        <div class="row">
                            <div class="product__discount__slider owl-carousel">
                                <div class="col-lg-4">
                                    <div class="product__discount__item">
                                       <c:forEach var="discountList" items="${discountRateList }">
                                        <div class="product__discount__item__pic set-bg"
                                            data-setbg="${contextPath }/shop/thumbnails?file=${discountList.productFile}">
                                            <div class="product__discount__percent">-${discountList.discountRate }</div>
                                            <ul class="product__item__pic__hover">
                                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="product__discount__item__text">
                                            <span>${discountList.sort}</span>
                                            <h5><a href="#">${discountList.productNm }</a></h5>
                                            <div class="product__item__price"><fmt:formatNumber value="${discountList.price - discountList.price * discountList.discountRate / 100}"/> 원<span>${discountList.price } 원</span></div>
                                        </div>
                                    </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </div>
                    </div>
                    <div class="filter__item">
                        <div class="row">
                            <div class="col-lg-4 col-md-5">
                                <div class="filter__sort">
                                    <span>정  렬</span>
                                    <select>
                                        <option value="0">구매순</option>
                                        <option value="0">인기순</option>
                                        <option value="0">리뷰순</option>
                                        <option value="0">최신순</option>
                                        <option value="0">낮은가격순</option>
                                        <option value="0">높은가격순</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4">
                                <div class="filter__found">
                                    <h6><span></span> 베스트 상품</h6>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-3">
                                <div class="filter__option">
                                    <span class="icon_grid-2x2"></span>
                                    <span class="icon_ul"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                    <c:choose>
                    	<c:when test="${shopList eq null}">
                    		상품이 없습니다.
                    	</c:when>
	                  	<c:otherwise>
		                  	<c:forEach var="shopDTO" items="${shopList}">
	                        <div class="col-lg-4 col-md-6 col-sm-6">
	                            <div class="product__item">
	                            	<div class="product__seller">
	                            		<span><strong>${shopDTO.writer }</strong></span>
	                            		<span><img src="${contextPath }/resources/bootstrap/img/show.png"/>${shopDTO.readCnt }</span>
	                            	</div>
	                                <div class="product__item__pic set-bg" data-setbg="${contextPath }/shop/thumbnails?file=${shopDTO.productFile}">
	                                    <ul class="product__item__pic__hover">
	                                        <li><a href="javascript:myKeep(${shopDTO.productCd})"><i class="fa fa-heart"></i></a></li>
	                                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
	                                        <li><a href="javascript:myCart(${shopDTO.productCd})"><i class="fa fa-shopping-cart"></i></a></li>
	                                    </ul>
	                                </div>
	                                 <div class="latest-product__item__text" align="center">
	                                     <a href="${contextPath }/shop/shopDetail?productCd=${shopDTO.productCd }">
	                                     <h6>${shopDTO.productNm }</h6>
	                                     <c:choose>
	                                     	<c:when test="${shopDTO.discountRate eq '0'}">
		                                     <span>${shopDTO.price } 원</span>
	                                     	</c:when>
	                                     	<c:otherwise>
		                                     <span style="text-decoration: line-through; color: gray">${shopDTO.price } 원 (${shopDTO.discountRate} %)</span>
	    									 <span><fmt:formatNumber value="${shopDTO.price - shopDTO.price * shopDTO.discountRate / 100}"/>원</span>	                                 	
	                                     	</c:otherwise>
	                                     </c:choose>
	                                     </a>
	                                 </div>
	                            </div>
	                        </div>
	                        <input type="hidden" value="${shopDTO.productNm}">
	                      	</c:forEach>
	                  	</c:otherwise>
                    </c:choose>
                    </div>
                    <div class="product__pagination" align="center">
                        <a href="#">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#"><i class="fa fa-long-arrow-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>