<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	var userId = "";
	var pw = "";
	var authenticationKey = "";
	function authenticationId(){
		var userNm = $("#userNm").val();
		var email = $("#email").val();
		$.ajax({
			type: "get",
			url: "${contextPath}/user/findId",
			data : {
				"userNm" : userNm,
				"email" : email
			},
			success : function(result){
				if (result == "false") {
					$("#userIdCheckWarn").html("다시 입력해주세요.");
				}
				else {
					document.getElementById("emailAuthentication").disabled = false;
					var arr = result.split(",");
					userId = arr[0];
					authenticationKey = arr[1];
				}
			}
		})
	}
	function authentication(){
		var emailAuthentication = $("#emailAuthentication").val();
		if (authenticationKey == emailAuthentication) {
			$("#authenticationBtn").hide();
			$("#idBtn").hide();
			$("#idWarn").hide();
			$("#showUser").show();
			$("#showUserId").html("아이디 : " + userId);
		}
		else  {
			$("#idWarn").html("인증번호를 다시 입력해주세요.");
		}
	}
	function authenticationPw(){
		userId = $("#userId").val();
		var email = $("#email").val();
		$.ajax({
			type: "get",
			url: "${contextPath}/user/findPw",
			data : {
				"userId" : userId,
				"email" : email
			},
			success : function(result){
				if (result == "false") {
					$("#pwWarn").html("다시 입력해주세요.");
				}
				else {
					document.getElementById("emailAuthentication").disabled = false;
					var arr = result.split(",");
					userId = arr[0];
					authenticationKey = arr[1];
				}
			}
		})
	}
	function pwAuthentication(){
		var emailAuthentication = $("#emailAuthentication").val();
		if (authenticationKey == emailAuthentication) {
			$("#pwAuthenticationBtn").hide();
			$("#pwBtn").hide();
			$("#pwWarn").hide();
			$("#showUser").show();
		}
		else  {
			$("#pwWarn").html("인증번호를 다시 입력해주세요.");
		}
	}
	
	$().ready(function(){
		$("form").submit(function(){
			var passwd = $("#passwd").val();
			var passwdCheck = $("#passwdCheck").val();
			if (passwd != null) {
			   if (passwd != passwdCheck) {
				   $("#passwdCheckWarn").html("비밀번호가 다릅니다. 다시 입력해주세요.");
			  	   return false;
			   }
			}	   
			if(passwd.length<8) {
				 $("#passwdCheckWarn").html("비밀번호는 8글자 이상이어야 합니다.");
				 return false;
			}
		})
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
	                           <div align="center" id="idBtn">
	                           		<button type="submit" class="site-btn" width="400" onclick="authenticationId()">인증번호 받기</button>
                          	   </div>
                          	   <br>
	                           <div class="checkout__form__input">
		    						 <input type="text" class="form-control" id="emailAuthentication" name="emailAuthentication" aria-describedby="emailHelp" placeholder="인증번호 6자리 숫자입력." disabled="disabled">
	                           </div>
                          	   <div>
                          	   		<span id="idWarn" style="color:red"></span>
                          	   </div>
                          	   <br>
	                           <div align="center" id="authenticationBtn">
	                           		<button type="submit" class="site-btn" width="400" onclick="authentication()">인 증</button>
                          	   </div>
                          	   <br>
                          	   <div class="checkout__form__input" id="showUser" style="display: none">
                          	   		<h5>고객님의 정보와 일치하는 아이디 목록입니다.</h5>
                          	   		<span id="showUserId"></span>
                          	   </div>
                       		</c:when>
							<c:otherwise>
								<form action="${contextPath }/user/changePw" method="post">
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
		                           <div align="center" id="pwBtn">
		                           		<button type="button" class="site-btn" width="400" onclick="authenticationPw()">인증번호 받기</button>
	                          	   </div>
	                          	   <br>
		                           <div class="checkout__form__input">
			    						 <input type="text" class="form-control" id="emailAuthentication" name="emailAuthentication"  aria-describedby="emailHelp" placeholder="인증번호 6자리 숫자입력." disabled="disabled">
		                           </div>
		                           <div>
	                          	   		<span id="pwWarn" style="color:red"></span>
	                          	   </div>
	                          	   <br>
		                           <div align="center" id="pwAuthenticationBtn">
		                           		<button type="button" class="site-btn" width="400" onclick="pwAuthentication()">인 증</button>
	                          	   </div>
	                          	    <div class="checkout__form__input" id="showUser" style="display: none">
	                         	    	<hr>
	                         	    	<br>
	                         	   		<h5>새로운 비밀번호를 입력해주세요.</h5>
	                          	   		<input type="password" class="form-control" id="passwd" name="passwd" ria-describedby="emailHelp" placeholder="8자리 이상 입력" maxlength="16">
	                          	   		<br>
	                          	   		<input type="password" class="form-control" id="passwdCheck" aria-describedby="emailHelp" placeholder="비밀번호를 다시 한번 입력해주세요" maxlength="16">
	                          	  		<br>
	                          	  		<span id="passwdCheckWarn" style="color:red"></span>
	                          	  		<input type="hidden" name="userId">
	                          	  		<div align="center" >
		                           		 	<button type="submit" class="site-btn" width="400">확 인</button>
	                          	   		</div>
	                          	   </div>
                          	   </form>
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