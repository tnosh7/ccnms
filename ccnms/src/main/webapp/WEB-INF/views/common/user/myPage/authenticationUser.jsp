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
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="${contextPath }/"><i class="fa fa-home"></i> Home > </a>
                        <span><small>비밀번호 인증</small></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
     <section class="checkout spad">
        <div class="container" align="center">
        	<form action="${contextPath }/myPage/authenticationUser" method="post">
               <div class="col-lg-8">
                   <img src="${contextPath }/resources/bootstrap/img/logo.png" width="200"/>
				   <br>
                   <hr>
                   <div class="row">
                       <div class="col-lg-12">
                           <div class="checkout__form__input">
								<h4>비밀번호 인증</h4>
								<br>
								<c:choose>
								<c:when test="${menu eq 'update'}">
									<p><strong>${userDTO.userId}님의 회원정보를 수정하기 위해 인증절차가 필요합니다.</strong></p>
								</c:when>
								 <c:otherwise>
									<p><strong>${userDTO.userId}님의 회원정보를 삭제하기 위해 인증절차가 필요합니다.</strong></p>
								 </c:otherwise>
								</c:choose>
                           </div>
                           <br>
                           <div class="checkout__form__input">
	     					  <input type="password" class="form-control" id="passwd" name="passwd" placeholder="비밀번호" autocomplete="off" >
                           </div>
                           <br>
                           <div align="center">
                           	   <input type="hidden" name="userId" value="${userDTO.userId }"/>
                           	   <input type="hidden" name="menu" value="${menu}"/>
                           	   <c:if test="${result eq 'fail'}">
                           	   	 	<h5 style="color:red">비밀번호를 잘못입력하셨습니다.</h5>
                           	   </c:if>
                           	   <br>
	                           <button type="submit" class="site-btn" width="600">인증</button>
                           </div>
                           <br>
			            </div>
                       </div>
               		</div>
               	</form>
               </div>
    </section>

</body>
</html>