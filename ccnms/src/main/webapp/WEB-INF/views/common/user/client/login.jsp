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
	<input type="hidden" id="menu" value="${menu }"/>
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="${contextPath }/"><i class="fa fa-home"></i> Home > </a>
                        <span>Login</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
     <section class="checkout spad">
        <div class="container" align="center">
        	<form action="${contextPath }/user/loginUser" method="post" class="checkout__form">
               <div class="col-lg-8">
                   <img src="${contextPath }/resources/bootstrap/img/logo.png" width="200"/>
				   <br>
                   <hr>
                   <div class="row">
                       <div class="col-lg-12">
                           <div class="checkout__form__input">
	    						 <input type="text" class="form-control" id="userId" name="userId" aria-describedby="emailHelp" placeholder="모두디깅 아이디" >
                           </div>
                           <br>
                           <div class="checkout__form__input">
	     					  <input type="password" class="form-control" id="passwd" name="passwd" placeholder="비밀번호" autocomplete="off" >
                           	  <br>
                           	  <c:if test="${menu eq 'miss'}"> 
                           	  <span style="color:red"><strong>로그인 실패 다시 입력해주세요.</strong></span>
                           	  </c:if>
                           	  <span></span>
                           </div>
                           <div align="left">
	     				   <span id="autoLogin" class="form-text text-muted"><input type="checkbox" name="useCookie">&ensp;<small>간편 로그인 사용하기</small></span>
                           </div>
                           <br>
                           <div align="center">
	                           <button type="submit" class="site-btn" width="400">로그인</button>
                           </div>
                           <br>
                           <div class="row">
			                <div class="col-lg-12">
			                <p class="text-center">
			                <span><a href="${contextPath }/user/registerUser">비밀번호 찾기</a></span> ㅣ
			                <span><a href="${contextPath }/user/registerUser">아이디 찾기</a></span> ㅣ
			                <span><a href="${contextPath }/user/register">회원가입</a></span>
			             	</p>
			            </div>
                       </div>
                   </div>
                 </div>
               </div>
            </form>
        </div>
    </section>

</body>
</html>