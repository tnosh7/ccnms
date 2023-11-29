<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<c:set var="admin" value="${sessionScope.adminId }"/>
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
	function selectAllContact(){
		if ($("#allContact").prop("checked")){
			$("[name='contactCd']").prop("checked", true);
		}
		else {
			$("[name='contactCd']").prop("checked", false);
		}
	}
	
	function removeContact(){
		var removeContactList = "";
		if($("input[name='contactCd']:checked")) {
			$("input[name='contactCd']:checked").each(function(){
				removeContactList += $(this).val() + ",";
				location.href="${contextPath}/admin/contact/removeContact?removeContactList=" + removeContactList;
			});
		}
		else return;
	}
	
	function search(){
		var searchKey = $("[name='searchKey']").val();
		var searchWord = $("[name='searchWord']").val();
		if (searchWord == "" || searchKey == "null") {
			return;
		}
		else {
			var url = "${contextPath}/admin/contact/contactList"
				url +="?searchWord=" + searchWord;
				url +="&searchKey=" + searchKey;
			location.href= url;
		}
	}
</script>
</head>
<body>
<fieldset>
<section>
	<c:if test="${adminId eq null}">
		<script>
			location.href = "${contextPath }/admin/loginAdmin";
		</script>
	</c:if>	
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
               <input
                 type="text"
                 class="form-control border-0 shadow-none"
                 placeholder="관리자 페이지 입니다."
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
              <img alt="아이디카드" src="${contextPath }/resources/bootstrap/img/id.png"/><strong> 고객문의 조회</strong></h5>
           <nav>
			</nav>               	
           </header>
           <hr>
              <div class="table-responsive text-nowrap">
              <ul class="nav nav-pills flex-column flex-md-row mb-3">
              	<li>
               <select class="form-select" id="searchKey" name="searchKey" aria-label="Default select example" name="searchKey">
                        <option value="null">검색어 선택</option>
                        <option value="userId">아이디</option>
                        <option value="subject">제목</option>
                        <option value="category">카테고리</option>
                  </select>
              	</li>
              	&emsp;
              	<li><input id="defaultInput" class="form-control" name="searchWord" type="text" placeholder="검색어를 입력하세요"></li>
              	&emsp;
               	<li><button type="button" class="btn btn-success" onclick="search()">조 회</button></li>
           		&emsp;
              	<li><button type="reset" class="btn btn-outline-success" onclick="location.href='${contextPath}/admin/contact/contactList'">새로고침</button></li>
             	 </ul>
              </div>
              </div>
                <table class="table">
                  <thead class="table-light" align="center">
                    <tr height="">
                      <th width="30"><input type="checkbox" id="allContact" onchange="selectAllContact()"></th>
                      <th>답글완료여부</th>
                      <th>카테고리</th>
                      <th>아이디</th>
                      <th>제목</th>
                      <th>등록날짜</th>
                    </tr>
                  </thead>
                  <tbody id="contactList" align="center">
                   <c:choose>
                    <c:when test="${empty contactList }">
                       <tr>
                     	 	<td colspan="6">접수된 고객문의 메시지가 없습니다.</td>
                       </tr>
                    </c:when>
                    <c:otherwise>
                     <c:forEach var="contactDTO" items="${contactList }"> 
                     	<tr>
	                      	<td><input type="checkbox" id="contactCd" name="contactCd" value="${contactDTO.contactCd }"></td>
                     	 	<td><span class="badge bg-label-primary me-1">${contactDTO.replyYN }</span></td>
                     	 	<td>${contactDTO.category }</td>
	                        <td>${contactDTO.userId }</td>
	                        <td><a href="${contextPath }/admin/contact/contactDetail?contactCd=${contactDTO.contactCd}">${contactDTO.subject }</a></td>
	                        <td><fmt:formatDate value="${contactDTO.regDt }" pattern="yyyy-MM-dd"/> </td>
                     	</tr>
                     </c:forEach>
                    </c:otherwise>
                   </c:choose>
                  </tbody>
                </table>
                <br>
                <div align="right">
                	<span>
                 	  <button type="button" class="btn btn-danger" onclick="removeContact();">삭제</button>
                	</span>
                 </div>
             </form>
             </div>
           </div>
         </div>
      </div>
   </section> 
</fieldset>
</html>