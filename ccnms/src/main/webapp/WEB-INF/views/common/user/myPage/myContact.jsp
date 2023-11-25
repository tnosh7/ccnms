<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<c:set var="sessionId" value="${sessionScope.userId }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$().ready(function(){
		
		$("#picBtn").click(function(){
			$("#picWarn").html("비밀번호 인증 후에 변경가능.");
		});
	});


</script>
</head>
<body>
	<fieldset>
	  <div class="content-wrapper" style="padding-top: 50px">
	       <div class="container">
	           <div class="row">
	               <div class="col-lg-12">
	                   <div class="breadcrumb__links">
	                       <a href="${contextPath }/"><i class="fa fa-home"></i> Home > </a>
	                       <span>내 프로필 > 문의메시지</span>
	                   </div>
	               </div>
	           </div>
	       </div>
	   </div>
	<form action="${contextPath }/myPage/modifyMyPage" method="post" enctype="multipart/form-data">
		  <section class="blog-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-5 order-md-1 order-2">
                    <div class="blog__sidebar"  style="padding-top: -10px">
                        <div class="blog__sidebar__item">
                            <h4>Categories</h4>
                            <ul>
                                <li><a href="${contextPath }/myPage/main"><strong>내프로필</strong></a></li>
                                <li><a href="${contextPath }/myPage/myLog?userId=${sessionId}"><strong>이력관리</strong></a></li>
                            </ul>
                        </div>
                        <hr>
                        <div class="blog__sidebar__item">
                            <h4>고객센터</h4>
                             <ul>
                                <li><a href="${contextPath }//myPage/myContact"> 문의메시지</a></li>
                                <li><a href="${contextPath }/myPage/authenticationUser?userId=${sessionId}&menu=delete"> 탈퇴</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
			  <div class="col-lg-8 col-md-7 order-md-1 order-1" align="center">
                   <div class="blog__details__text">
                       <div class="card mb-4">
                       		 <c:forEach var="contactDTO" items="${myContactList}" varStatus="i">
                                   <div class="card">
									  <div class="card-body" align="left">
									    <h4 class="card-title">제목 : <span>${contactDTO.subject }</span></h4> 
									    <h6 class="card-subtitle mb-2 text-muted">${contactDTO.regDt }</h6>
									    <p class="card-text">문의 내용 : <span>${contactDTO.content }</span></p>
								  		<c:choose>
								  			<c:when test="${contactDTO.replyYN eq 'F'}">
										    <p class="card-text">문의 답변 (확인중) : <span style="color:orange">관리자가 메시지를 확인중입니다. 조금만 기다려주세요.</span></p>
								  			</c:when>
								  			<c:otherwise>
								  				<p class="card-text">문의 답변 (완료) : <span style="color:blue">${contactDTO.reply }</span></p>
								  			</c:otherwise>
								  		</c:choose>
									  </div>
									</div>
                             </c:forEach>
                       </div>
                      </div>
                     </div>
                    </div>
                   </div>
                       
		</section>
</form>
</fieldset>
</body>
</html>