<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$().ready(function(){
		$("form").submit(function(){
			var birth = "${userDTO.birthDT}";
			var hp = "${userDTO.hp}";
			if(birth.charAt(2) > 1 || birth.charAt(4) > 3) {
				return false;
			}
			else if (birth.charAt(2) == 1 && birth.charAt(3) > 2 || birth.charAt(4) == 3  && birth.charAt(5) > 1 ) {
				return false;
			}
			if(hp.charAt(0) != 0) {
				return false;
			}
		})
	});
</script>
</head>
<body>
	<fieldset>
	   <div class="content-wrapper">
	       <div class="container">
	           <div class="row">
	               <div class="col-lg-12">
	                   <div class="breadcrumb__links">
	                       <a href="${contextPath }/"><i class="fa fa-home"></i> Home > </a>
	                       <span>내 프로필 > </span>
	                       <span>프로필 수정</span>
	                   </div>
	               </div>
	           </div>
	       </div>
	   </div>
	<form action="${contextPath }/myPage/modifyMyPage" method="post" enctype="multipart/form-data">
	  <div class="content-wrapper">
	   <section class="blog-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-5 order-md-1 order-2">
                    <div class="blog__sidebar">
                        <div class="blog__sidebar__item">
                            <h4>Categories</h4>
                            <ul>
                                <li><a href="${contextPath }/myPage/main"><strong>내프로필</strong></a></li>
                                <li><a href="${contextPath }/myPage/myLog?userId=${userDTO.userId}"><strong>이력관리</strong></a></li>
                            </ul>
                        </div>
                        <hr>
                        <div class="blog__sidebar__item">
                            <h4>고객센터</h4>
                             <ul>
                                <li><a href="${contextPath }/myPage/myContact"> 문의메시지</a></li>
                                  <li><a href="${contextPath }/myPage/authenticationUser?userId=${userDTO.userId }&menu=delete"> 탈퇴</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8 col-md-7 order-md-1 order-1" align="center">
                    <div class="blog__details__text">
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
		                         src="${contextPath }/admin/management/thumbnails?fileName=${userDTO.profile }"
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
			                      <div class="d-flex align-items-start align-items-sm-center gap-4">
		                        <div class="button-wrapper">
		                          <label for="upload" class="btn btn-primary me-2 mb-4" tabindex="0">
		                            <span class="d-none d-sm-block">사진변경</span>
		                            <i class="bx bx-upload d-block d-sm-none"></i>
		                            <input type="file" id="upload" name="profile" class="account-file-input" hidden="" accept="image/png, image/jpeg">
		                          </label>
		                           <input type="hidden" name="beforeFileName" value="${userDTO.profile }"/>
		                         <button type="button" class="btn btn-outline-secondary account-image-reset mb-4">
		                           <i class="bx bx-reset d-block d-sm-none"></i>
		                           <span class="d-none d-sm-block">삭제</span>
		                         </button>
		                        </div>
		                      </div>
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
	                             value="${userDTO.userId }"
	                             autofocus
	                             disabled
	                           />
	                         </div>
	                         <div class="mb-3 col-md-6">
	                           <label for="userNm" class="form-label">이름</label>
	                           <input class="form-control" type="text" name="userNm" id="userNm" value="${userDTO.userNm}" />
	                         </div>
	                         <div class="mb-3 col-md-6">
	                           <label for="email" class="form-label">이메일</label>
	                           <input
	                             class="form-control"
	                             type="text"
	                             id="email"
	                             name="email"
	                             value="${userDTO.email }"
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
	                             maxlength="6" 
	                             oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
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
	                             maxlength="11" 
	                             oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
	                           />
	                         </div>
	                         <div class="mb-6 col-md-6">
	                           <label for="state" class="form-label">LIKE 포인트</label>
	                           <div>
			                       <input type="text" id="likePoint" name="likePoint" value="${userDTO.likePoint }" disabled>
		                       </div>
	                         </div>
	                           <div class="card-body">
	                         <div class="mb-3 col-md-12" align="left">
	                            <legend class="mt-4">
	                            	<img src="${contextPath}/resources/admin/assets/img/icons/unicons/map.png">배송지 관리
	                            </legend>
	                         </div>
	                  			<div class="checkout__input">
		                                <div class="checkout__form__input">
		                                   <div class="mb-12 col-md-12">
	       				                    <input type="text" class="form-control" id="fullAddress" name="fullAddress" value="${userDTO.zipcode } ${userDTO.roadAddress} ${userDTO.namujiAddress}" readonly/>
				        	                </div>
				        	                <hr>
		                                	<p><input type="text" id="zipcode" placeholder="우편번호" name="zipcode" value="${orderer.zipcode }" style="width: 55%;">
	                                    	<input type="button" value="주소 검색" onclick="javascript:execDaumPostcode()" style="width: 40%; padding-left: 0"></p>
		                                    <p><input type="text" id="roadAddress"   placeholder="도로명 주소" name="roadAddress"   value="${order.roadAddress }" ></p>
		                                    <p><input type="text" id="jibunAddress"  placeholder="지번 주소"   name="jibunAddress"  value="${order.jibunAddress }" ></p>
		                                    <p><input type="text" id="namujiAddress" placeholder="나머지 주소" name="namujiAddress" value="${order.namujiAddress }" ></p>
		                                </div>
	                           		 </div>
	                            </div>
	                            <div class="mb-3 col-md-12" align="left">
	                   		 	<div class="form-check form-switch">
						      </div>
           					 <div align="center">
           					 <input type="hidden" name="userId" value="${userDTO.userId }">
	                         <button type="submit" class="btn btn-primary me-2" onclick="location.href='${contextPath }/myPage/modifyMyPage'">&emsp;수정&emsp;</button>
         				</div>
       				</div>
   				</div>
			</div>
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
			
     				