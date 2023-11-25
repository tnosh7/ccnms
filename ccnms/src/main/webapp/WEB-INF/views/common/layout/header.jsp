<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.28/dist/sweetalert2.all.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.28/dist/sweetalert2.min.css" rel="stylesheet">
<script src="https://cdn.ckeditor.com/ckeditor5/31.1.0/classic/ckeditor.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<style>
	.hero__categories__all {
		background:ghostwhite;
		border-style: groove;
	}
	.site-btn {
		background:ghostwhite;
		color:black;
		border-style: groove;
	}
	#search {
		background:ghostwhite;
		color:black;
		focus;
	}
</style>
</head>
<body>
<header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="header__top__left">
                            <ul>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="header__top__right">
                            <div class="header__top__right__social">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-linkedin"></i></a>
                                <a href="#"><i class="fa fa-pinterest-p"></i></a>
                            </div>
                            <div class="header__top__right__auth">
                            <c:choose>
                            	<c:when test="${sessionScope.role eq 'admin'}">
                            	    <div class="header__top__right__auth">
	                               		<p><a href="${contextPath }/admin/digging/diggingAdd"><button type="button" class="btn btn-secondary disabled">디깅하기</button></a></p>
                            		</div>
                            	    <div class="header__top__right__auth">
	                               		<p><a href="${contextPath }/admin/main"><button type="button" class="btn btn-outline-dark">관리자 페이지</button></a></p>
                            		</div>
	 								<div class="header__top__right__language">
	                               		<p><a href="${contextPath }/admin/logout"><button type="button" class="btn btn-outline-danger">로그아웃</button></a></p>
                            		</div>
                            	</c:when>
                            	<c:otherwise>
									<c:choose>
										<c:when test="${sessionScope.role eq 'user'}">
		                            	  	<div class="header__top__right__auth">
			                               		<p><a href="${contextPath }/digging/addDigging"><button type="button" class="btn btn-secondary disabled">디깅하기</button></a></p>
        		                    		</div>
                            	     		<div class="header__top__right__auth">
		                            			<p><a href="${contextPath }/myPage/main"><button type="button" class="btn btn-outline-dark">내 회원정보</button></a></p>
                            				</div>
		                            	  	<div class="header__top__right__language">
		                            	   		<p><a href="${contextPath }/user/logout"><button type="button" class="btn btn-outline-danger">로그아웃</button></a></p>
                            				</div>
										</c:when>
		                            	<c:otherwise>
	                            	      	<div class="header__top__right__auth">
												<p><a href="${contextPath }/user/loginUser"><button type="button" class="btn btn-outline-dark">로그인</button></a></p>
                            				</div>
		                               	  	<div class="header__top__right__language">
		                               			<p><a href="${contextPath }/user/register"><button type="button" class="btn btn-outline-success">회원가입</button></a></p>
	                            			</div>
		                            	</c:otherwise>
									</c:choose>                            
                            	</c:otherwise>
                            </c:choose>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo">
                        <a href="${contextPath }/"><img src="${contextPath }/resources/bootstrap/img/logo.png" alt="로고이미지에러"></a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <nav class="header__menu">
                        <ul style="b">
                            <li><a href="${contextPath }/"><img alt="홈에러" src="${contextPath }/resources/bootstrap/img/home.png"> 홈</a></li>
                            <li><a href="${contextPath }/shop/"><img alt="상점에러" src="${contextPath }/resources/bootstrap/img/shop.png"> 상점</a>
                                <ul class="header__menu__dropdown">
                                    <li><a href="${contextPath }/shop/?sort=sale"">유저마켓</a></li>
                                    <li><a href="${contextPath }/shop/?sort=Modudigging">디깅마켓</a></li>
                                    <li><a href="${contextPath }/shop/?sort=exchange">교환마켓</a></li>
                                    <li><a href="${contextPath }/myShop/saleList">내 상점</a></li>
                                </ul>
                            </li>
                            <li><a href="${contextPath }/ranking/ranking"><img alt="디깅랭킹에러" src="${contextPath }/resources/bootstrap/img/hot.png"> 디깅랭킹</a></li>
                            <li class="active"><a href="${contextPath }/contact/user"><img alt="문의에러" src="${contextPath }/resources/bootstrap/img/qna.png"> 문의</a></li>
                        </ul>
                    </nav>
                </div>
                
                <div class="col-lg-3">
                    <div class="header__cart">
                        <ul>
                        	<c:choose>
								<c:when test="${sessionScope.role == 'user' }">
									<li>
										<a href="${contextPath }/myShop/myKeep"><i class="fa fa-heart"></i>
										<span>${sessionScope.myKeepCnt}</span></a>
									</li>
									<li>
										<a href="${contextPath }/myShop/cartList"><i class="fa fa-shopping-bag"></i>
										<span>${sessionScope.myCartCnt}</span></a>
									</li>
									<li>
										<a href="${contextPath }/myShop/orderList"><img src="${contextPath }/resources/bootstrap/img/purchase.png">
										<span>${sessionScope.myOrderCnt}</span></a>
									</li>
								</c:when>
								<c:otherwise>
		                            <li><a href="${contextPath }/myShop/myKeep"><i class="fa fa-heart"></i><span>0</span></a></li>
		                            <li><a href="${contextPath }/myShop/cartList"><i class="fa fa-shopping-bag"></i><span>0</span></a></li>
		                       		<li><a href="${contextPath }/myShop/orderList"><img src="${contextPath }/resources/bootstrap/img/purchase.png"><span>0</span></a></li>
								</c:otherwise>                        	
                        	</c:choose>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="humberger__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>
    <!-- Header Section End -->

    <!-- Hero Section Begin -->
    <section class="hero hero-normal">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span style="color:black">디깅 토픽</span>
                        </div>
                        <ul style="background:ghostwhite">
                            <li><a href="${contextPath }/digging/main?diggingTopic=game"><img alt="게임에러" src="${contextPath }/resources/bootstrap/img/icon/game.png"><strong>&emsp;게임</strong></a></li>
                            <li><a href="${contextPath }/digging/main?diggingTopic=kPop"><img alt="케이팝에러" src="${contextPath }/resources/bootstrap/img/icon/kPop.png"><strong>&emsp;K-POP</strong></a></li>
                            <li><a href="${contextPath }/digging/main?diggingTopic=ott"><img alt="오티티에러" src="${contextPath }/resources/bootstrap/img/icon/ott.png"><strong>&emsp;OTT</strong></a></li>
                            <li><a href="${contextPath }/digging/main?diggingTopic=animal"><img alt="펫에러" src="${contextPath }/resources/bootstrap/img/icon/animal.png"><strong>&emsp;동물 & 애완동물</strong></a></li>
                            <li><a href="${contextPath }/digging/main?diggingTopic=business"><img alt="비즈니스에러" src="${contextPath }/resources/bootstrap/img/icon/business.png"><strong>&emsp;비즈니스</strong></a></li>
                            <li><a href="${contextPath }/digging/main?diggingTopic=sport"><img alt="스포츠에러" src="${contextPath }/resources/bootstrap/img/icon/sport.png"><strong>&emsp;스포츠</strong></a></li>
                            <li><a href="${contextPath }/digging/main?diggingTopic=celeb"><img alt="연예인에러" src="${contextPath }/resources/bootstrap/img/icon/celeb.png"><strong>&emsp;연예인</strong></a></li>
                            <li><a href="${contextPath }/digging/main?diggingTopic=travel"><img alt="여행에러" src="${contextPath }/resources/bootstrap/img/icon/travel.png"><strong>&emsp;여행</strong></a></li>
                            <li><a href="${contextPath }/digging/main?diggingTopic=fashion"><img alt="패션에러" src="${contextPath }/resources/bootstrap/img/icon/fashion.png"><strong>&emsp;패션</strong></a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="${contextPath }/search" style="background:ghostwhite">
                                <input type="text" id="search" name="search" placeholder="What do yo u need?" onclick="onfocus">
                                <button type="submit" class="site-btn">SEARCH</button>
                            </form>
                        </div>
                           	<section>
                           		<div>
	                               <button type="submit" class="site-btn" onclick="location.href='${contextPath }/contact/user'">디깅토픽신청</button>
                           		</div>
                           	</section>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>