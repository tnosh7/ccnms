<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <footer class="footer spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="footer__about">
                        <div class="footer__about__logo">
                            <a href="${contextPath }/"><img src="${contextPath}/resources/bootstrap/img/logo.png" alt="로고" ></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
                    <div class="footer__widget">
                        <ul>
                            <li><a href="${contextPath }/contact/user#introduce"><strong>모두디깅이란?</strong></a></li>
                            <li><a href="${contextPath }/contact/user#askCenter">1:1문의</a></li>
                            <li>ModuDigging Inc</li>
                        </ul>
                        <ul>
                            <li><a href="${contextPath }/contact/user#modudiggingPolicy"><strong>모두디깅 정책</strong></a></li>
                            <li><a href="${contextPath }/contact/user#modudiggingPolicy#personalPolicy">개인보호처리방침</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-md-12">
                    <div class="footer__widget">
                        <h6>모두디깅 이메일</h6>
                        <p>사업관련 문의는 아래 이메일로 보내주세요.</p>
                        <h6> modudig@gmail.com</h6>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="footer__copyright">
                        <div class="footer__copyright__text"><p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by </a>
						  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p></div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
</body>
</html>