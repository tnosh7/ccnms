<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
</script>
</head>
<body>
	<fieldset>
	<form>
	  <div class="breadcrumb-option">
	       <div class="container">
	           <div class="row">
	               <div class="col-lg-12">
	                   <div class="breadcrumb__links">
	                       <a href="${contextPath }/"><i class="fa fa-home"></i> Home > </a>
	                       <span>프로필 수정</span>
	                   </div>
	               </div>
	           </div>
	       </div>
	   </div>
	    <div class="content-wrapper">
	     <section class="checkout spad">
	       <div class="container" align="center">
	           <!-- Content -->
	             <div class="row">
	               <div class="col-md-12">
	                 <ul class="nav nav-pills flex-column flex-md-row mb-3">
	                   <li class="nav-item">
	                     <a class="nav-link active" href="javascript:void(0);"><i class="bx bx-user me-1"></i>내프로필</a>
	                   </li>
	                   <li class="nav-item">
	                     <a class="nav-link" href="pages-account-settings-notifications.html"
	                       ><i class="bx bx-bell me-1"></i> 알림</a
	                     >
	                   </li>
	                   <li class="nav-item">
	                     <a class="nav-link" href="pages-account-settings-connections.html"
	                       ><i class="bx bx-link-alt me-1">이력관리</i> </a
	                     >
	                   </li>
	                 </ul>
	                 <div class="card mb-4">
	                   <h5 class="card-header">${userDTO.userNm } 님</h5>
	                   <!-- Account -->
	                   
	                   <div class="card-body">
	                     <div class="d-flex align-items-start align-items-sm-center gap-4">
						   <c:choose>
						   	<c:when test="${userDTO.profile eq null}">
						   		<img
		                         src="${contextPath}/resources/admin/assets/img/avatars/2.png"
		                         alt="user-avatar"
		                         class="d-block rounded"
		                         height="100"
		                         width="100"
		                         id="profile"
		                         name="profile"
		                       />
						   	</c:when>
						   	<c:otherwise>
						   		<img
		                         src="${userDTO.profile }"
		                         alt="user-avatar"
		                         class="d-block rounded"
		                         height="100"
		                         width="100"
		                         id="profile"
		                         name="profile"
		                       />
						   	</c:otherwise>
						   
						   </c:choose>
	                       &emsp;&emsp;&emsp;
	                       <div class="button-wrapper">
	                        <p class="text-muted mb-0"></p>
	                         <label for="upload" class="btn btn-primary me-2 mb-4" tabindex="0">
	                          <span class="d-none d-sm-block">프로필 사진 업로드</span>
	                           <i class="bx bx-upload d-block d-sm-none"></i>
	                           <input
	                             type="file"
	                             id="upload"
	                             class="account-file-input"
	                             hidden
	                             accept="image/png, image/jpeg"
	                           />
	                         </label>
	                         <button type="button" class="btn btn-outline-secondary account-image-reset mb-4">
	                           <i class="bx bx-reset d-block d-sm-none"></i>
	                           <span class="d-none d-sm-block">Reset</span>
	                         </button>
	                       </div>
	                     </div>
	                   </div>
	                   <hr class="my-0" />
	                   <div class="card-body">
	                   <div class="mb-3 col-md-12" align="left">
                  	       <legend class="mt-4"><img src="${contextPath}/resources/admin/assets/img/icons/unicons/user-detail.png">기본 정보</legend>
                         </div>
	                       <div class="row">
	                         <div class="mb-3 col-md-6">
	                           <label for="userId" class="form-label">ID</label>
	                           <input
	                             class="form-control"
	                             type="text"
	                             id="userId"
	                             name="userId"
	                             value="${userDTO.userId }"
	                             autofocus
	                             readonly
	                           />
	                         </div>
	                         <div class="mb-3 col-md-6">
	                           <label for="userNm" class="form-label">이름</label>
	                           <input class="form-control" type="text" name="userNm" id="userNm" value="${userDTO.userNm}" readonly/>
	                         </div>
	                         <div class="mb-3 col-md-6">
	                           <label for="email" class="form-label">이메일</label>
	                           <input
	                             class="form-control"
	                             type="text"
	                             id="email"
	                             name="email"
	                             value="${userDTO.email }"
	                             readonly
	                           />
	                         </div>
	                         <div class="mb-3 col-md-6">
	                           <label for="organization" class="form-label">생년월일</label>
	                           <input
	                             type="text"
	                             class="form-control"
	                             id="birthDT"
	                             name="birthDT"
	                             value="${userDTO.birthDT }"
	                             readonly
	                           />
	                         </div>
	                        <div class="mb-3 col-md-6">
	                           <label for="organization" class="form-label">핸드폰번호</label>
	                           <input
	                             type="text"
	                             class="form-control"
	                             id="hp"
	                             name="hp"
	                             value="${userDTO.hp }"
	                             readonly
	                           />
	                         </div>
	                         <div class="mb-6 col-md-6">
	                           <label for="state" class="form-label">성별</label>
	                           <div>
		                         	<select name="sex" >
	                                	<option selected="selected" value="N">선택안함</option>
	                                	<option value="M" >남성</option>
	                                	<option value="W" >여성</option>
	                                </select>
		                       </div>
		                       <input type="hidden" value="${userDTO.sex }">
	                         </div>
	                         <div class="mb-3 col-md-12" align="left">
	                            <legend class="mt-4"><img src="${contextPath}/resources/admin/assets/img/icons/unicons/map.png">배송지 관리</legend>
	                         </div>
	                         <div class="mb-3 col-md-3">
	                           <label for="address" class="form-label">우편번호</label>
	                           <input type="text" class="form-control" id="zipcode" name="zipcode" value="${userDTO.zipcode }" readonly/>
	                         </div>
	                         <div class="mb-3 col-md-9">
	                           <label for="address" class="form-label">주소</label>
	                           <input type="text" class="form-control" id="fullAddress" name="fullAddress" value="${userDTO.roadAddress} ${userDTO.namujiAddress}" readonly/>
	                         </div>
	                       </div>
	                   		<div class="mb-3 col-md-12" align="left">
	                   		 <legend class="mt-4"><img src="${contextPath}/resources/admin/assets/img/icons/unicons/user-detail.png">프로모션 정보수신 동의</legend>
	                   		 <div class="form-check form-switch">
						        <input class="form-check-input" type="checkbox" id="emailYN" <c:if test="${userDTO.emailYN =='Y'}"> checked</c:if>/>
						        <label class="form-check-label" for="emailYN">Checked switch checkbox input</label>
						      </div>
	                         </div>
	                         <br>
	                       <div class="mt-2">
	                         <button type="button" class="btn btn-primary me-2" onclick="location.href='${contextPath }/myPage/authenticationUser?userId=${userDTO.userId }'">&emsp;수정&emsp;</button>
	                       </div>
	                   </div>
	                   <br>
	                   <br>
             		  <div class="mb-2 col-md-12" align="right">
		             <div>
		                <button type="button" class="btn btn-danger deactivate-account" >회원탈퇴</button>
		             </div>
		           </div>  
	                   <!-- /Account -->
	                 </div>
                 </div>
                </div>
               </div>
              </section>
             </div>
          </form>
</fieldset>          
</body>
</html>