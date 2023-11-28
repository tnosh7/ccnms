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
			$.ajax ({
				url:"${contextPath}/myShop/addMyCart",
				type:"get",
				data: {
					"productCd" : productCd,
					"cartQty" : 1
				},
				success:function(result) {
					if (result =="duple") {
						Swal.fire('이미 추가된 상품입니다.');
					}
					else {
						Swal.fire({
							  text: '장바구니에 추가되었습니다.',
							  footer: '<a href="${contextPath }/myShop/cartList">장바구니로 이동하기</a>'
							})
					}
				}
			})
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
				url:"${contextPath}/myShop/addMyKeep",
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
							  text: '찜에 추가되었습니다.',
							  footer: '<a href="${contextPath }/myShop/myKeep">찜으로 이동하기</a>'
							})
					}
				}
			})
		}
	}
	function bestSort() {
		var bestSort = $("[name='bestSort']").val();
		location.href= "${contextPath}/shop/bestSort?bestSort="+bestSort ;
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
                        	<input type="hidden" name="userId" value="${sessionScope.userId }"> 
                        	<br>
                            <h4>카테고리</h4>
                            <ul>
                                <li><a href="${contextPath }/shop/"><img alt="베스트상품에러" src="${contextPath }/resources/bootstrap/img/shop.png"><strong>&emsp;베스트상품</strong></a></li>
                                <li><a href="${contextPath }/shop/?sort=sale"><img alt="유저마켓에러" src="${contextPath }/resources/bootstrap/img/shop.png"><strong>&emsp;유저마켓</strong></a></li>
	                            <li><a href="${contextPath }/shop/?sort=ModuDigging"><img alt="디깅마켓에러" src="${contextPath }/resources/bootstrap/img/shop.png"><strong>&emsp;디깅마켓</strong></a></li>
	                            <li><a href="${contextPath }/shop/?sort=exchange"><img alt="교환마켓에러" src="${contextPath }/resources/bootstrap/img/horizontal.png"><strong>&emsp;교환마켓</strong></a></li>
                            </ul>
                        </div>
                        <hr>
                        <div class="sidebar__item">
                            <div class="latest-product__text">
                                <h4>최신 상품</h4>
                                <div class="latest-product__slider owl-carousel">
                                    <div class="latest-prdouct__slider__item">
                                    	<c:forEach var="latestDTO" items="${latestList}" begin="0" end="2">
                                        <a href="${contextPath }/shop/shopDetail?productCd=${latestDTO.productCd }" class="latest-product__item">
                                            <div class="latest-product__item__text">
                                                <h6>[ ${latestDTO.writer} ] l${latestDTO.productNm }</h6>
                                                <span style="text-decoration: line-through; color: red">${latestDTO.price }</span>
                                                 <span><fmt:formatNumber value="${latestDTO.price - latestDTO.price * latestDTO.discountRate / 100}"/>원</span>	
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
                    <div class="filter__item">
                        <div class="row">
                            <div class="col-lg-4 col-md-5">
                                <div class="filter__sort" >
                                    <span>정  렬</span>
                                    <select name="bestSort" onchange="javascript:bestSort()">
                                        <option value="popular">인기순</option>
                                        <option value="recent">최신순</option>
                                        <option value="cheap">낮은가격순</option>
                                        <option value="high">높은가격순</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4">
                                <div class="filter__found">
                                    <h6><span></span> 베스트 상품</h6>
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
	                                <div class="product__item__pic set-bg" data-setbg="${contextPath}/thumbnails?file=${shopDTO.productFile}">
	                                    <ul class="product__item__pic__hover">
	                                        <li><a href="javascript:myKeep(${shopDTO.productCd})"><i class="fa fa-heart"></i></a></li>
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
                </div>
            </div>
        </div>
    </section>
</body>
</html>