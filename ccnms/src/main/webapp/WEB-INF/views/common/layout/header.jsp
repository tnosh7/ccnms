<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.28/dist/sweetalert2.all.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.28/dist/sweetalert2.min.css" rel="stylesheet">
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
	                               		<p><a href="${contextPath }/digging/addDigging"><button type="button" class="btn btn-danger">디깅하기</button></a></p>
                            		</div>
                            	    <div class="header__top__right__auth">
	                               		<p><a href="${contextPath }/admin/main"><button type="button" class="btn btn-outline-dark">관리자 페이지</button></a></p>
                            		</div>
	 								<div class="header__top__right__language">
	                               		<p><a href="${contextPath }/admin/logout"><button type="button" class="btn btn-outline-success">로그아웃</button></a></p>
                            		</div>
                            	</c:when>
                            	<c:otherwise>
									<c:choose>
										<c:when test="${sessionScope.role eq 'user'}">
		                            	  	<div class="header__top__right__auth">
			                               		<p><a href="${contextPath }/digging/addDigging"><button type="button" class="btn btn-danger">디깅하기</button></a></p>
        		                    		</div>
                            	     		<div class="header__top__right__auth">
		                            			<p><a href="${contextPath }/myPage/main"><button type="button" class="btn btn-outline-dark">내 회원정보</button></a></p>
                            				</div>
		                            	  	<div class="header__top__right__language">
		                            	   		<p><a href="${contextPath }/user/logout"><button type="button" class="btn btn-outline-success">로그아웃</button></a></p>
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
                        <ul>
                            <li></li>
                            <li></li>
                            <li><a href="${contextPath }/">홈</a></li>
                            <li><a href="${contextPath }/shop/">상점</a>
                                <ul class="header__menu__dropdown">
                                    <li><a href="./shop-details.html">Shop Details</a></li>
                                    <li><a href="./shoping-cart.html">Shoping Cart</a></li>
                                    <li><a href="./checkout.html">Check Out</a></li>
                                    <li><a href="./blog-details.html">Blog Details</a></li>
                                </ul>
                            </li>
                            <li class="active"><a href="${contextPath }/digging/main">디깅</a></li>
                            <li><a href="${contextPath }/digging/ranking">디깅랭킹</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3">
                    <div class="header__cart">
                        <ul>
                            <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                            <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
                       		<li><a href="#"><img src="${contextPath }/resources/bootstrap/img/message.png"></a></li>
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
                            <span>Digging Topic</span>
                        </div>
                        <ul>
                            <li><a href="#">게임</a></li>
                            <li><a href="#">K-POP</a></li>
                            <li><a href="#">OTT</a></li>
                            <li><a href="#">동물 & 애완동물</a></li>
                            <li><a href="#">비즈니스</a></li>
                            <li><a href="#">스포츠</a></li>
                            <li><a href="#">연예인</a></li>
                            <li><a href="#">정치</a></li>
                            <li><a href="#">패션</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="#">
                                <input type="text" name="search" placeholder="What do yo u need?">
                                <button type="submit" class="site-btn">SEARCH</button>
                            </form>
                        </div>
                        <div class="hero__search__phone">
                            <div class="hero__search__phone__icon">
                                <i class="fa fa-phone"></i>
                            </div>
                            <div class="hero__search__phone__text">
                                <h5>광고문의</h5>
                                <span>support 24/7 time</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>