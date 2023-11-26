<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<c:set var="adminId" value="${sessionScope.adminId }"/>
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
	function selectAllProduct(){
		if ($("#allProduct").prop("checked")){
			$("[name='productCd']").prop("checked", true);
		}
		else {
			$("[name='productCd']").prop("checked", false);
		}
	}
	
	function removeProduct(){
		var removeProductList = "";
		if($("input[name='productCd']:checked")) {
			$("input[name='productCd']:checked").each(function(){
				removeProductList += $(this).val() + ",";
				location.href="${contextPath}/admin/shop/removeProduct?removeProductList=" + removeProductList;
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
			var url = "${contextPath}/admin/shop/shopList"
				url +="?searchWord=" + searchWord;
				url +="&searchKey=" + searchKey;
			location.href= url;
		}
	}
</script>
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
                <img alt="아이디카드" src="${contextPath }/resources/bootstrap/img/id.png"/><strong> 전체상품 조회</strong></h5>
	            <nav>
					<ul class="nav nav-pills flex-md-row mb-3" >
					  	<li>
                          <button type="button" class="btn btn-outline-primary" onclick="location.href='${contextPath }/admin/shop/productAdd'">상품 등록</button>
                        </li>
						&emsp;
						<li><a href="${contextPath }/admin/shop/shopExcelExport"><img alt="아이디카드" src="${contextPath }/resources/bootstrap/img/excel.jpeg" width="50"/></a></li>
						&emsp;
					</ul>
				</nav>               	
             </header>
             <hr>
                <div class="table-responsive text-nowrap">
	               <ul class="nav nav-pills flex-column flex-md-row mb-3">
                	<li>
	                <select class="form-select" name="searchKey" aria-label="Default select example" >
                          <option value="null">검색어 선택</option>
                          <option value="productNm">상품 이름</option>
                          <option value="writer">판매자</option>
                          <option value="sort">분류</option>
                          <option value="tag">태그</option>
                    </select>
                	</li>
                	&emsp;
                	<li><input id="defaultInput" class="form-control" name="searchWord" type="text" placeholder="검색어를 입력하세요"></li>
                	&emsp;
                	<li><button type="button" class="btn btn-success" onclick="search()">조 회</button></li>
                	&emsp;
                	<li><button type="button" class="btn btn-outline-success" onclick="location.href='${contextPath}/admin/shop/shopList'">새로고침</button></li>
               	 </ul>
                </div>
                </div>
                  <table class="table">
                    <thead class="table-light" align="center">
                      <tr>
                      	<th width="30"><input type="checkbox" id="allProduct" onchange="selectAllProduct()"></th>
                        <th>판매자</th>
                        <th width=300>상품이름</th>
                        <th>가격</th>
                        <th>분류</th>
                        <th>태그</th>
                        <th>조회수</th>
                        <th>등록일</th>
                      </tr>
                    </thead>
                    <tbody align="center">
                    <c:choose>
	                    <c:when test="${empty shopList}">
		                      <tr>
		                      	<td colspan="12">유저가 없습니다.</td>
		                      </tr>
		                </c:when>
	                <c:otherwise>
	                	<c:forEach var="shopDTO"  items="${shopList}">
	                		<tr>
		                      	<td><input type="checkbox" id="productCd" name="productCd" value="${shopDTO.productCd }"></td>
		                        <td>${shopDTO.writer }</td>
		                        <td ><a href="${contextPath }/shop/shopDetail?productCd=${shopDTO.productCd }">${shopDTO.productNm }</a></td>
		                        <td><fmt:formatNumber value="${shopDTO.price}"/></td>
		                        <td><a href="${contextPath }/shop/?sort=${shopDTO.sort }">${shopDTO.sort }</a></td>
		                        <td>${shopDTO.tag }</td>
		                        <td>${shopDTO.readCnt}</td>
		                        <td><fmt:formatDate value="${shopDTO.enrollDt}" pattern="yyyy-MM-dd"/></td>
	                      	</tr>
	                	</c:forEach>
	                </c:otherwise>
                   </c:choose>
	              </tbody>
                  </table>
                  <br>
               	 <div align="right">
	               	 <span>
	                 	<button type="button" class="btn btn-danger" onclick="removeProduct();">삭제</button>
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