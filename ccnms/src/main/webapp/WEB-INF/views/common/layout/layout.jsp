<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="zxx">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title><tiles:insertAttribute name="title"/></title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/style.css" type="text/css">
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="${contextPath}/resources/bootstrap/js/jquery-3.3.1.min.js"></script>
	<script>
		function execDaumPostcode() {
		    new daum.Postcode({
		        oncomplete: function(data) {
		
		            var fullRoadAddr = data.roadAddress; 
		            var extraRoadAddr = ''; 	
		            if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                extraRoadAddr += data.bname;
		            }
		            if (data.buildingName !== '' && data.apartment === 'Y'){
		               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		            }
		            if (extraRoadAddr !== ''){
		                extraRoadAddr = ' (' + extraRoadAddr + ')';
		            }
		            if (fullRoadAddr !== ''){
		                fullRoadAddr += extraRoadAddr;
		            }
		
		            document.getElementById('zipcode').value = data.zonecode; 
		            document.getElementById('roadAddress').value = fullRoadAddr;
		            document.getElementById('jibunAddress').value = data.jibunAddress;
		        }
		    }).open();
		}
	</script>
	<style>
	    .menu a{cursor:pointer;}
	    .menu .hide{display:none;}
	    a:link {color:black}
	  	a:visited { color:black; }
		a:hover { color:black; }   
		a:active {color:purple;}
	</style>
</head>
<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
    <!-- Humberger Begin -->
    <div class="humberger__menu__overlay"></div>
    <div class="humberger__menu__wrapper">
        <div class="humberger__menu__logo">
            <a href="#"><img src="${contextPath }/resources/bootstrap/img/logo.png" alt="로고이미지에러"></a>
        </div>
        <div class="humberger__menu__cart">
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
        <div class="humberger__menu__widget">
            <div class="header__top__right__language">
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
        <nav class="humberger__menu__nav mobile-menu">
            <ul>
                <li><a href="${contextPath }/"><img alt="홈에러" src="${contextPath }/resources/bootstrap/img/home.png"> 홈</a></li>
                <li><a href="${contextPath }/shop/"><img alt="상점에러" src="${contextPath }/resources/bootstrap/img/shop.png"> 상점</a>
                    <ul class="header__menu__dropdown">
                        <li><a href="${contextPath }/shop/?sort=sale"">유저마켓</a></li>
                        <li><a href="${contextPath }/shop/?sort=Modudigging">디깅마켓</a></li>
                        <li><a href="${contextPath }/shop/?sort=exchange">교환마켓</a></li>
                        <li><a href="${contextPath }/myShop/saleList">내 상점</a></li>
                    </ul>
                </li>
                <li><a href="${contextPath }/ranking/ranking"><img alt="디깅랭킹에러" src="${contextPath }/resources/bootstrap/img/hot.png">디깅랭킹</a></li>
                <li class="active"><a href="${contextPath }/contact/user"><img alt="문의에러" src="${contextPath }/resources/bootstrap/img/qna.png"> 문의</a></li>
            </ul>
        </nav>
        <div id="mobile-menu-wrap"></div>
        <div class="humberger__menu__contact">
            <ul>
                <li><i class="fa fa-envelope"></i> moduDigging@gmail.com</li>
                <li>Let's Digging!!</li>
                <li>What you like More digging!</li>
            </ul>
        </div>
    </div>
    <!-- Humberger End -->

    <!-- Header Section Begin -->
   	<tiles:insertAttribute name="header"/>	
    <!-- Header Section End -->

    <!-- Hero Section Begin -->
  	<tiles:insertAttribute name="body"/>	
    <!-- Blog Section End -->

    <!-- Footer Section Begin -->
   	<tiles:insertAttribute name="footer"/>	
    <!-- Footer Section End -->

    <!-- Js Plugins -->
  
    <script src="${contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
    <script src="${contextPath}/resources/bootstrap/js/jquery.nice-select.min.js"></script>
    <script src="${contextPath}/resources/bootstrap/js/jquery-ui.min.js"></script>
    <script src="${contextPath}/resources/bootstrap/js/jquery.slicknav.js"></script>
    <script src="${contextPath}/resources/bootstrap/js/mixitup.min.js"></script>
    <script src="${contextPath}/resources/bootstrap/js/owl.carousel.min.js"></script>
    <script src="${contextPath}/resources/bootstrap/js/main.js"></script>



</body>

</html>