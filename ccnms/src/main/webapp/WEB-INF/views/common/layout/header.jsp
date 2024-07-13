<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="mainTitleDTO" value="${mainTitleDTO }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.28/dist/sweetalert2.all.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.28/dist/sweetalert2.min.css" rel="stylesheet">
<script	src="https://cdn.ckeditor.com/ckeditor5/31.1.0/classic/ckeditor.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/mixitup@3/dist/mixitup.min.js"></script>
<style>
.header__top {
	background: aliceblue;
}

.hero__categories__all {
	background: ghostwhite;
	border-style: groove;
}

.site-btn {
	background: ghostwhite;
	color: black;
	border-style: groove;
}

.search__option {
	margin: 20px;
	height: 100px;
	width: 90%;
}

#search {
	height: 64px;
	border-radius: 30px;
	cursor: pointer;
	border: 3px solid #000;
}
</style>
</head>
<header class="header">
	<div class="header__top">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="header__top__left">
						<ul>
							<li><i class="fa fa-envelope"></i> tnosh73@gmail.com</li>
							<li>Find a new hobby!</li>
						</ul>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="header__top__right">
						<div class="header__top__right__social">
							<a href="https://github.com/tnosh7"><i class="fa fa-github"></i></a>
							<a href="https://tnosh7.github.io"><i class="fa fa-home"></i></a>
						</div>
						<div class="header__top__right__auth">
							<c:choose>
								<c:when test="${sessionScope.role eq 'admin'}">
									<div class="header__top__right__auth">
										<p>
											<a href="${contextPath }/admin/digging/diggingAdd">
											<button type="button" class="btn btn-secondary disabled">디깅하기</button></a>
										</p>
									</div>
									<div class="header__top__right__auth">
										<p>
											<a href="${contextPath }/admin/main">
											<button type="button" class="btn btn-outline-dark">관리자 페이지</button></a>
										</p>
									</div>
									<div class="header__top__right__language">
										<p>
											<a href="${contextPath }/admin/logout"><button
													type="button" class="btn btn-outline-danger">로그아웃</button></a>
										</p>
									</div>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${sessionScope.role eq 'user'}">
											<div class="header__top__right__auth">
												<p>
													<a href="${contextPath }/digging/addDigging"><button
															type="button" class="btn btn-secondary disabled">디깅하기</button></a>
												</p>
											</div>
											<div class="header__top__right__auth">
												<p>
													<a href="${contextPath }/myPage/main"><button
															type="button" class="btn btn-outline-dark">내 회원정보</button></a>
												</p>
											</div>
											<div class="header__top__right__language">
												<p>
													<a href="${contextPath }/user/logout"><button
															type="button" class="btn btn-outline-danger">로그아웃</button></a>
												</p>
											</div>
										</c:when>
										<c:otherwise>
											<div class="header__top__right__auth">
												<p>
													<a href="${contextPath }/user/loginUser"><button
															type="button" class="btn btn-outline-dark">Sign	in</button></a>
												</p>
											</div>
											<div class="header__top__right__language">
												<p>
													<a href="${contextPath }/user/register"><button
															type="button" class="btn btn-outline-success">Sing up</button></a>
												</p>
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
					<a href="${contextPath }/"><img
						src="${contextPath }/resources/bootstrap/img/logo.png"
						alt="로고이미지에러"></a>
				</div>
			</div>
			<div class="col-lg-6">
				<nav class="header__menu">
					<ul style="">
						<li><a href="${contextPath }/"><img alt="홈에러"
								src="${contextPath }/resources/bootstrap/img/home.png"> 홈</a></li>
						<li><a href=""><img
								alt="상점에러"
								src="${contextPath }/resources/bootstrap/img/shop.png"> 디깅
						</a>
							<ul class="header__menu__dropdown">
							<c:forEach var="mainTitleDTO" items="${mainTitleDTO }" >
								<li><a href="${contextPath }/digging/main?mainTitle=${mainTitleDTO.mainId}"><img
										alt="케이팝에러"
										src="${contextPath }/resources/bootstrap/img/icon/${mainTitleDTO.mainTitle}.png"><strong>&emsp;${mainTitleDTO.mainTitle}</strong></a></li>
							</c:forEach>
							</ul>
						<li><a href="${contextPath }/shop/"><img alt="상점에러"
								src="${contextPath }/resources/bootstrap/img/shop.png"> 상점</a>
							<ul class="header__menu__dropdown">
								<li><a href="${contextPath }/shop/?sort=sale"">유저마켓</a></li>
								<li><a href="${contextPath }/shop/?sort=Modudigging">디깅마켓</a></li>
								<li><a href="${contextPath }/shop/?sort=exchange">교환마켓</a></li>
								<li><a href="${contextPath }/myShop/saleList">내 상점</a></li>
							</ul></li>
						<li><a href="${contextPath }/ranking/ranking"><img
								alt="디깅랭킹에러"
								src="${contextPath }/resources/bootstrap/img/hot.png">
								디깅랭킹</a></li>
						<li class="active"><a href="${contextPath }/contact/user"><img
								alt="문의에러" src="${contextPath }/resources/bootstrap/img/qna.png">
								문의</a></li>
					</ul>
				</nav>
			</div>

			<div class="col-lg-3">
				<div class="header__cart">
					<ul>
						<c:choose>
							<c:when test="${sessionScope.role == 'user' }">
								<li><a href="${contextPath }/myShop/myKeep"><i
										class="fa fa-heart"></i> <span>${sessionScope.myKeepCnt}</span></a>
								</li>
								<li><a href="${contextPath }/myShop/cartList"><i
										class="fa fa-shopping-bag"></i> <span>${sessionScope.myCartCnt}</span></a>
								</li>
								<li><a href="${contextPath }/myShop/orderList"><img
										src="${contextPath }/resources/bootstrap/img/purchase.png">
										<span>${sessionScope.myOrderCnt}</span></a></li>
							</c:when>
							<c:otherwise>
								<li><a href="${contextPath }/myShop/myKeep"><i
										class="fa fa-heart"></i><span>0</span></a></li>
								<li><a href="${contextPath }/myShop/cartList"><i
										class="fa fa-shopping-bag"></i><span>0</span></a></li>
								<li><a href="${contextPath }/myShop/orderList"><img
										src="${contextPath }/resources/bootstrap/img/purchase.png"><span>0</span></a></li>
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
<section class="breadcrumb-section set-bg">
	<div class="container">
			<div class="col-lg-12 text-center">
				<div class="search__text">
					<div class="search__option">
						<form class="d-flex" action="${contextPath }/search"
							style="background: ghostwhite">
							<input class="form-control me-sm-2" type="search" id="search"
								name="search" placeholder="검색어를 입력해 주세요." maxlength="100"
								onclick="onfocus">
							<button class="btn btn-secondary my-2 my-sm-0" type="submit"
								style="background: blue;">Search</button>
						</form>
					</div>
				</div>
			</div>
		</div>
</section>
</body>
</html>