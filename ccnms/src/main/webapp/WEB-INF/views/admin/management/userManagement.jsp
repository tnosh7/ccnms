<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.table{
       table-layout:fixed;
       width: 100%;
     }
header {
  display: flex;
}

nav {
  margin-left: auto;
}
</style>
</head>
<script>
	$().ready(function(){
		
		$("#allCheck").change(function(){
			if($("#allCheck").prop("checked")) {
				$("[name='userId']").prop("checked", true);			
			}
			else if($("#allCheck").prop("checked", false)) {
				$("[name='userId']").prop("checked", false);	
			}
		});
	});
	function deleteUser(){
		var deluserIdList = "";
		$("input[name='userId']:checked").each(function(){
			deluserIdList = $(this).val() + ",";
		});
		Swal.fire({
			  title: '유저를 삭제하시겠습니까?',
			  showDenyButton: true,
			  showCancelButton: true,
			  confirmButtonText: '네',
			  denyButtonText: '아니요',
			}).then((result) {
			  if (result.isConfirmed) {
				location.href="${contextPath}//admin/management/delUser?deluserIdList=" + deluserIdList;
			   	
			  } else if (result.isDenied) {
				  return;
			  }
		})
	}
		
</script>
<body>
<fieldset>
<section>

  <div class="row">
     <div class="col-xl">
       <div class="card mb-4">
         <div class="card-header d-flex justify-content-between align-items-center">
         </div>
         <div class="card-body">
	<nav
         class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
         id="layout-navbar"
       >
        <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0   d-xl-none ">
       <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
         <i class="bx bx-menu bx-sm"></i>
       </a>
     	</div>
         <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
           <!-- Search -->
           <div class="navbar-nav align-items-center">
             <div class="nav-item d-flex align-items-center">
               <i class="bx bx-search fs-4 lh-0"></i>
               <input
                 type="text"
                 class="form-control border-0 shadow-none"
                 placeholder="Search..."
                 aria-label="Search..."
               />
             </div>
           </div>
        </div>
     </nav>
           <form>
           <hr>
             <div class="mb-3">
             <header>
                <h5 class="card-header">
                <img alt="아이디카드" src="${contextPath }/resources/bootstrap/img/id.png"/><strong> 유저정보 조회</strong></h5>
	            <nav>
					<ul class="nav nav-pills flex-md-row mb-3" >
						<li><a href="${contextPath }/admin/management/userExcelExport"><img alt="아이디카드" src="${contextPath }/resources/bootstrap/img/excel.jpeg" width="50"/></a></li>
						&emsp;
						<li><div class="btn-group">
                          <button type="button" class="btn btn-primary btn-icon rounded-pill dropdown-toggle hide-arrow show" data-bs-toggle="dropdown" aria-expanded="true">
                            <i class="bx bx-dots-vertical-rounded"></i>
                          </button>
                          <ul class="dropdown-menu dropdown-menu-end show" data-popper-placement="bottom-end" style="position: absolute; inset: 0px 0px auto auto; margin: 0px; transform: translate3d(0px, 40px, 0px);">
                            <li><a class="dropdown-item"  onclick="updateUser();">유저수정</a></li>
                            <li><a class="dropdown-item"  onclick="deleteUser();">유저삭제</a></li>
                          </ul>
                        </div></li>
					</ul>
				</nav>               	
             </header>
             <hr>
                <div class="table-responsive text-nowrap">
	               <ul class="nav nav-pills flex-column flex-md-row mb-3">
                	<li>
	                <select class="form-select" id="exampleFormControlSelect1" aria-label="Default select example">
                          <option selected="">검색선택1</option>
                          <option value="1">핸드폰 번호</option>
                          <option value="2">생년월일</option>
                          <option value="3">이름</option>
                    </select>
                	</li>
                	&emsp;
                	<li>
	                <select class="form-select" id="exampleFormControlSelect1" aria-label="Default select example">
                          <option selected="">검색선택2</option>
                          <option value="1">핸드폰 번호</option>
                          <option value="2">생년월일</option>
                          <option value="3">이름</option>
                    </select>
                	</li>
                	&emsp;
                	<li><input id="defaultInput" class="form-control" type="text" placeholder="검색어를 입력하세요"></li>
                	&emsp;
                	<li><button type="button" class="btn btn-success">조 회</button></li>
                	&emsp;
                	<li><button type="reset" class="btn btn-outline-success" onclick="window.location.reload()">새로고침</button></li>
               	 </ul>
                </div>
                </div>
                  <table class="table">
                    <thead class="table-light" align="center">
                      <tr>
                      	<th width="30"><input type="checkbox" id="allCheck"></th>
                        <th>아이디</th>
                        <th>이름</th>
                        <th>생일</th>
                        <th>핸드폰번호</th>
                        <th>이메일</th>
                        <th width="80">성별</th>
                        <th width="80">수신 동의</th>
                        <th width="80">프로필</th>
                        <th width="200">주소</th>
                        <th width="80">LIKE</th>
                        <th>가입일</th>
                      </tr>
                    </thead>
                    <tbody align="center">
                    <c:choose>
	                    <c:when test="${empty userList}">
		                      <tr>
		                      	<td colspan="12">유저가 없습니다.</td>
		                      </tr>
		                </c:when>
	                <c:otherwise>
	                	<c:forEach var="userDTO"  items="${userList}">
	                		<tr>
		                      	<td><input type="checkbox" id="userCheck" name="userId" value="${userDTO.userId }"></td>
		                        <td><i class="fab fa-angular fa-lg text-danger me-3"></i>${userDTO.userId }</td>
		                        <td>${userDTO.userNm }</td>
		                        <td>${userDTO.birthDT}</td>
		                        <td>${userDTO.hp}</td>
		                        <td>${userDTO.email}</td>
		                        <td><span class="badge bg-label-primary me-1">${userDTO.sex}</span></td>
		                        <td><span class="badge bg-label-success me-1">${userDTO.emailYN}</span></td>
		                        <td>
			                        <c:if test="${userDTO.profile != null }">
			                        	<img src="${contextPath }/admin/management/thumbnails?fileName=${userDTO.profile }" width="40" height="40">
			                        </c:if>
		                        </td>
		                        <td>${userDTO.zipcode} ${userDTO.roadAddress} ${userDTO.namujiAddress}</td>
		                        <td>${userDTO.likePoint}</td>
		                        <td>${userDTO.joinDT}</td>
	                      	</tr>
	                	</c:forEach>
	                </c:otherwise>
                   </c:choose>
	              </tbody>
                  </table>
                  <br>
               </form>
             </div>
           </div>
         </div>
      </div>
   </section> 
</fieldset>
</html>