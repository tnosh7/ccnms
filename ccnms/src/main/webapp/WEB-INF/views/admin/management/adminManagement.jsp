<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<script>
	$().ready(function(){
		
		$("#allCheck").change(function(){
			if($("#allCheck").prop("checked")) {
				$("[name='adminCheck']").prop("checked", true);			
			}
			else if($("#allCheck").prop("checked", false)) {
				$("[name='adminCheck']").prop("checked", false);	
			}
		});
		
			$("[name='searchKeyword']").keyup(function(){
					var searchKeyword = $("[name='searchKeyword']").val();
					var searchKey = $("[name='searchKey']").val();
					var param = {
							"searchKeyword" : searchKeyword,
							"searchKey" : searchKey
					}
					$.ajax ({
						type : "get",
						url  : "${contextPath}/admin/management/searchAdmin",
						data : param,
						success : function(data) {
							
							var adminList = "";
							if(data.length == 0) {
								adminList +="<tr colspan='5'>"
								adminList +="<td>검색결과가 없습니다.</td>"
								adminList +="</tr>"
						}
							else {
								$(data).each(function(){
									adminList +="<tr>"
									adminList +="<td><input type='checkbox' id='adminCheck' name='adminCheck'></td>"
									adminList +="<td>" + this.adminId+ "</td>"
									adminList +="<td>" + this.adminNm+ "</td>"
									adminList +="<td>" + this.adminRank+ "</td>"
									adminList +="<td>" + this.joinDT+ "</td>"
									adminList +="</tr>"
								});
							}
						$("#adminList").html(adminList);
						}
					})
			});		
		});
</script>
</head>
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
              <img alt="아이디카드" src="${contextPath }/resources/bootstrap/img/id.png"/><strong> 관리자 조회</strong></h5>
           <nav>
			<ul class="nav nav-pills flex-md-row mb-3" >
				<li><a href="${contextPath }/admin/management/adminExcelExport"><img alt="엑셀이미지" src="${contextPath }/resources/bootstrap/img/excel.jpeg" width="50"/></a></li>
				&emsp;
				<li><div class="btn-group">
                        <button type="button" class="btn btn-primary btn-icon rounded-pill dropdown-toggle hide-arrow show" data-bs-toggle="dropdown" aria-expanded="true">
                          <i class="bx bx-dots-vertical-rounded"></i>
                        </button>
                        <ul class="dropdown-menu dropdown-menu-end show" data-popper-placement="bottom-end" style="position: absolute; inset: 0px 0px auto auto; margin: 0px; transform: translate3d(0px, 40px, 0px);">
                          <li><a class="dropdown-item" href="javascript:void(0);">관리자 수정</a></li>
                          <li><a class="dropdown-item" href="javascript:void(0);">관리자 삭제</a></li>
                        </ul>
                      </div></li>
			</ul>
			</nav>               	
           </header>
           <hr>
              <div class="table-responsive text-nowrap">
              <ul class="nav nav-pills flex-column flex-md-row mb-3">
              	<li>
               <select class="form-select" id="exampleFormControlSelect1" aria-label="Default select example" name="searchKey">
                        <option selected value="">검색선택</option>
                        <option value="adminId">아이디</option>
                        <option value="adminNm">이름</option>
                        <option value="adminRank">직급</option>
                  </select>
              	</li>
              	&emsp;
              	<li><input id="defaultInput" class="form-control" name="searchKeyword" type="text" placeholder="검색어를 입력하세요"></li>
              	&emsp;
              	<li><button type="button" class="btn btn-outline-success">새로고침</button></li>
             	 </ul>
              </div>
              </div>
                <table class="table">
                  <thead class="table-light" align="center">
                    <tr height="">
                    	<th width="30"><input type="checkbox" id="allCheck"></th>
                      <th>아이디</th>
                      <th>이름</th>
                      <th>직급</th>
                      <th>입사일</th>
                    </tr>
                  </thead>
                  <tbody id="adminList" align="center">
                   <c:choose>
                    <c:when test="${empty adminList }">
                    <tr>
                    	<td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                   	<th></th>
                    </tr>
                    </c:when>
                    <c:otherwise>
                     <c:forEach var="adminDTO" items="${adminList }"> 
                     	 <tr>
                      	<td><input type="checkbox" id="adminCheck" name="adminCheck"></td>
                        <td><i class="fab fa-angular fa-lg text-danger me-3"></i>${adminDTO.adminId }</td>
                        <td><i class="fab fa-angular fa-lg text-danger me-3"></i>${adminDTO.adminNm }</td>
                        <td><i class="fab fa-angular fa-lg text-danger me-3"></i>${adminDTO.adminRank }</td>
                        <td><fmt:formatDate value="${adminDTO.joinDT }" pattern="yyyy-MM-dd"/> </td>
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