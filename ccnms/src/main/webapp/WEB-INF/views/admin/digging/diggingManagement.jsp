<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	
	function selectAllDigging(){
		if ($("#allDigging").prop("checked")){
			$("[name='diggingId']").prop("checked", true);
		}
		else {
			$("[name='diggingId']").prop("checked", false);
		}
	}
	
	function removeDigging(){
		var removeDiggingList = "";
		if($("input[name='diggingId']:checked")) {
			$("input[name='diggingId']:checked").each(function(){
				removeDiggingList += $(this).val() + ",";
				location.href="${contextPath}/admin/digging/removeDigging?removeDiggingList=" + removeDiggingList;
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
			var url = "${contextPath}/admin/digging/diggingManagement"
				url +="?searchWord=" + searchWord;
				url +="&searchKey=" + searchKey;
			location.href= url;
		}
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
                <img alt="아이디카드" src="${contextPath }/resources/bootstrap/img/id.png"/><strong> 디깅 조회</strong></h5>
	            <nav>
					<ul class="nav nav-pills flex-md-row mb-3" >
                        <li>
                          <button type="button" class="btn btn-outline-primary" onclick="location.href='${contextPath }/admin/digging/diggingAdd'">디깅하기</button>
                        </li>
						&emsp;
						<li><a href="${contextPath }/admin/management/userExcelExport"><img alt="아이디카드" src="${contextPath }/resources/bootstrap/img/excel.jpeg" width="50"/></a></li>
						&emsp;
					</ul>
				</nav>               	
             </header>
             <hr>
                <div class="table-responsive text-nowrap">
	               <ul class="nav nav-pills flex-column flex-md-row mb-3">
                	<li>
	                <select class="form-select" id="searchKey" name="searchKey" aria-label="Default select example">
                          <option value="null">검색어 선택</option>
                          <option value="topic">디깅 토픽</option>
                          <option value="subject">제목</option>
                          <option value="writer">글쓴이</option>
                          <option value="content">내용</option>
                    </select>
                	</li>
                	&emsp;
                	<li><input id="defaultInput" class="form-control" id="searchWord" name="searchWord" type="text" placeholder="검색어를 입력하세요"></li>
                	&emsp;
                	<li><button type="button" class="btn btn-success" onclick="search()">조 회</button></li>
                	&emsp;
                	<li><button type="reset" class="btn btn-outline-success" onclick="location.href='${contextPath}/admin/digging/diggingManagement'">새로고침</button></li>
               	 </ul>
                </div>
                </div>
                  <table class="table">
                    <thead class="table-light" align="center">
                      <tr>
                      	<th width="30"><input type="checkbox" id="allDigging" onchange="selectAllDigging()"></th>
                        <th>토픽</th>
                        <th>글쓴이</th>
                        <th>제목</th>
                        <th>조회수</th>
                        <th width="80">추천수</th>
                        <th>등록일</th>
                      </tr>
                    </thead>
                    <tbody align="center">
                    <c:choose>
	                    <c:when test="${empty diggingList}">
		                      <tr>
		                      	<td colspan="12">게시글이 없습니다.</td>
		                      </tr>
		                </c:when>
	                <c:otherwise>
	                	<c:forEach var="diggingDTO"  items="${diggingList}">
	                		<tr>
		                      	<td><input type="checkbox" id="diggingId" name="diggingId" value="${diggingDTO.diggingId }"></td>
		                        <td><a href="${contextPath }/digging/main?diggingTopic=${diggingDTO.diggingTopic }">${diggingDTO.diggingTopic }</a></td>
		                        <td><a href="${contextPath }/ranking/otherUserInfo?userId=${diggingDTO.writer }">${diggingDTO.writer }</a></td>
		                        <td><a href="${contextPath }/digging/diggingDetail?diggingId=${diggingDTO.diggingId}">${diggingDTO.subject}</a></td>
		                        <td>${diggingDTO.readCnt}</td>
		                        <td>${diggingDTO.thumbsUp}</td>
		                        <td><fmt:formatDate value="${diggingDTO.enrollDT}" pattern="yyyy-MM-dd" /></td>
	                      	</tr>
	                	</c:forEach>
	                </c:otherwise>
                   </c:choose>
	              </tbody>
                  </table>
                  <br>
               	 <div align="right">
                	 <span>
	                  <button type="button" class="btn btn-danger" onclick="updateDigging();">수정</button>
	                  </span>
	                  &emsp;
                 	  <span>
	                  <button type="button" class="btn btn-danger" onclick="removeDigging();">삭제</button>
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