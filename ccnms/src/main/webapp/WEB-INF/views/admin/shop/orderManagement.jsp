<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
			var url = "${contextPath}/admin/shop/orderList"
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
                <img alt="아이디카드" src="${contextPath }/resources/bootstrap/img/id.png"/><strong> 주문 조회</strong></h5>
	            <nav>
					<ul class="nav nav-pills flex-md-row mb-3" >
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
                          <option value="productNm">상품 이름</option>
                          <option value="userId">유저</option>
                          <option value="deliveryStatus">배송 상태</option>
                    </select>
                	</li>
                	&emsp;
                	<li><input id="defaultInput" class="form-control" name="searchWord" type="text" placeholder="검색어를 입력하세요"></li>
                	&emsp;
                	<li><button type="button" class="btn btn-success" onclick="search()">조 회</button></li>
                	&emsp;
                	<li><button type="reset" class="btn btn-outline-success" onclick="location.href='${contextPath}/admin/shop/orderList'">새로고침</button></li>
               	 </ul>
                </div>
                </div>
                  <table class="table">
                    <thead class="table-light" align="center">
                      <tr>
                      	<th width="30"><input type="checkbox" id="allCheck"></th>
                        <th>유저</th>
                        <th width=300>상품 이름</th>
                        <th>주문 수량</th>
                        <th>가격</th>
                        <th>배송 상태</th>
                        <th>주문일</th>
                      </tr>
                    </thead>
                    <tbody align="center">
                    <c:choose>
	                    <c:when test="${empty orderList}">
		                      <tr>
		                      	<td colspan="12">주문내역이 없습니다.</td>
		                      </tr>
		                </c:when>
	                <c:otherwise>
	                	<c:forEach var="orderDTO"  items="${orderList}">
	                		<tr>
		                      	<td><input type="checkbox" id="orderCd" name="orderCd" value="${orderDTO.orderCd }"></td>
		                        <td>${orderDTO.userId }</td>
		                        <td >
		                        	<a href="${contextPath }/myShop/orderDetail?orderCd=${orderDTO.orderCd}&userId=${orderDTO.userId}">
				                        ${orderDTO.productNm }
		                        	</a>
		                        </td>
		                        <td>${orderDTO.orderQty }개</td>
		                        <td><fmt:formatNumber value="${orderDTO.paymentAmt}"/></td>
		                        <td>${orderDTO.deliveryStatus}</td>
		                        <td><fmt:formatDate value="${orderDTO.payOrderTime}" pattern="yyyy-MM-dd"/></td>
	                      	</tr>
	                	</c:forEach>
	                </c:otherwise>
                   </c:choose>
	              </tbody>
                  </table>
                  <br>
                  <div align="right">
	               	 <span>
	                 	<button type="button" class="btn btn-danger" onclick="removeProduct();">주문취소</button>
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