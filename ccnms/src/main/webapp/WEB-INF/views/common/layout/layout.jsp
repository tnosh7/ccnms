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
</head>
<style>
    .menu a{cursor:pointer;}
    .menu .hide{display:none;}
</style>
<script src="${contextPath}/resources/bootstrap/js/jquery-3.3.1.min.js"></script>
<script src="${contextPath }/resources/ckeditor/ckeditor.js"></script>  
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
                <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
            </ul>
            <div class="header__cart__price">item: <span>$150.00</span></div>
        </div>
        <div class="humberger__menu__widget">
            <div class="header__top__right__language">
                <img src="${contextPath }/resources/bootstrap/img/language.png" alt="언어변경이미지에러">
               		<div class="header__top__right__auth">
                      	<a href="#"><button type="button" class="btn btn-outline-dark">login</button></a>
                     </div>
            	</div>
             <div class="header__top__right__language">
                <a href="#"><button type="button" class="btn btn-outline-success">sign up</button></a>
             </div>
        </div>
        <nav class="humberger__menu__nav mobile-menu">
            <ul>
                <li class="active"><a href="./index.html">Home</a></li>
                <li><a href="./shop-grid.html">Digging</a></li>
                <li><a href="#">Shop</a>
                    <ul class="header__menu__dropdown">
                        <li><a href="./shop-details.html">Shop Details</a></li>
                        <li><a href="./shoping-cart.html">Shoping Cart</a></li>
                        <li><a href="./checkout.html">Check Out</a></li>
                        <li><a href="./blog-details.html">Blog Details</a></li>
                    </ul>
                </li>
                <li><a href="./blog.html">Best</a></li>
                <li><a href="./contact.html">Rank</a></li>
            </ul>
        </nav>
        <div id="mobile-menu-wrap"></div>
        <div class="header__top__right__social">
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-linkedin"></i></a>
            <a href="#"><i class="fa fa-pinterest-p"></i></a>
        </div>
        <div class="humberger__menu__contact">
            <ul>
                <li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
                <li>Free Shipping for all Order of $99</li>
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