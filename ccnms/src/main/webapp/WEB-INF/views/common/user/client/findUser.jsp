<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$("#emailCheckBtn").click(function(){
	
	var emailDomain = $("[name='emailDomain']").val();
	var email = $("#email").val();
	var emailCheck = $("#emailCheck") 
	if ( emailDomain != "") {
		email += emailDomain;
	}
	
	$.ajax ({
		type :"get",
		url : "${contextPath}/user/emailCheck",
		data : {"email" : email},
		success : function(data){
			console.log("data : " +  data);
			$("#emailCheck").prop("disabled", false);
			alert('인증번호가 전송되었습니다.');
			
		}			
	});
	
	});


</script>
</head>
<body>
	<input type="hidden" id="menu" value="${menu }"/>
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="${contextPath }/"><i class="fa fa-home"></i> Home </a> >
                        <a href="${contextPath }/user/loginUser"> Login </a> >
                        <c:choose>
                        	<c:when test="${find eq 'id'}">
                        		<span>아이디 찾기</span>
                        	</c:when>
                        	<c:otherwise>
                        		<span>비밀번호 찾기</span>
                        	</c:otherwise>
                        </c:choose>
                        <span></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
     <section class="checkout spad">
        <div class="container" align="center">
               <div class="col-lg-8">
                   <img src="${contextPath }/resources/bootstrap/img/logo.png" width="200"/>
				   <br>
                   <hr>
                   <div class="row">
                       <div class="col-lg-12">
                       	<c:choose>
                       		<c:when test="${find eq 'id'}">
                       			<h4>아이디 찾기</h4>
                       			<br>
                       			<h5>본인확인 이메일 주소와 입력한 이메일 주소가 같아야, 인증번호를 받을 수 있습니다.</h5>
	                           	<br>
	                           <div class="checkout__form__input">
		    						 <input type="text" class="form-control" id="userNm" name="userNm" aria-describedby="emailHelp" placeholder="성명을 입력해주세요.">
	                           </div>
	                           	<br>
	                           <div class="checkout__form__input">
		    						 <input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp" placeholder="이메일을 입력해주세요.">
	                           </div>
	                           <div align="center">
	                           		<button type="submit" class="site-btn" width="400">인증번호 받기</button>
                          	   </div>
                          	   <br>
	                           <div class="checkout__form__input">
		    						 <input type="text" class="form-control" id="email" name="email" aria-describedby="emailHelp" placeholder="인증번호 6자리 숫자입력." disabled="disabled">
	                           </div>
                          	   <br>
	                           <div align="center">
	                           		<button type="submit" class="site-btn" width="400">인 증</button>
                          	   </div>
                       		</c:when>
							<c:otherwise>
								<h4>비밀번호 찾기</h4>
								<br>
                       			<h5>비밀번호를 찾고자 하는 아이디를 입력해주세요.</h5>
                       			<h5>본인확인 이메일 주소와 입력한 이메일 주소가 같아야, 인증번호를 받을 수 있습니다.</h5>
	                           	<br>
	                           <div class="checkout__form__input">
		    						 <input type="text" class="form-control" id="userId" name="userId" aria-describedby="emailHelp" placeholder="아이디를 입력해주세요.">
	                           </div>
	                           	<br>
	                           <div class="checkout__form__input">
		    						 <input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp" placeholder="이메일을 입력해주세요.">
	                           </div>
	                           <div align="center">
	                           		<button type="submit" class="site-btn" width="400">인증번호 받기</button>
                          	   </div>
                          	   <br>
	                           <div class="checkout__form__input">
		    						 <input type="text" class="form-control" id="email" name="email" aria-describedby="emailHelp" placeholder="인증번호 6자리 숫자입력." disabled="disabled">
	                           </div>
                          	   <br>
	                           <div align="center">
	                           		<button type="submit" class="site-btn" width="400">인 증</button>
                          	   </div>
							</c:otherwise>                       		 
                       	</c:choose>
                           <br>
			            </div>
                       </div>
                   </div>
                 </div>
    </section>

</body>
</html>