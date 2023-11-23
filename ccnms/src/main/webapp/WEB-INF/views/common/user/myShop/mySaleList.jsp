<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<c:set var="sessionId" value="${sessionScope.userId }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function selectAllMySale(){
		if ($("#allMySale").prop("checked")){
			$("[name='productCd']").prop("checked", true);
		}
		else {
			$("[name='productCd']").prop("checked", false);
		}
	}

	function removeMySale(){
		var removeMySaleList= "";
		if($("input[name='productCd']:checked")) {
			$("input[name='productCd']:checked").each(function(){
				removeMySaleList += $(this).val() + ",";
				location.href="${contextPath}/myShop/removeMySale?removeMySaleList=" + removeMySaleList;
			});
		}
		else return;
	}
</script>
</head>
<body>
<section class="shoping-cart spad">
	<c:if test="${userId eq null}">
		<script>
			location.href = "${contextPath }/user/loginUser";
		</script>
	</c:if>	
	 <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="${contextPath }/"><i class="fa fa-home"></i> Home > </a>
                        <a href="${contextPath }/myShop/saleList">내 상점</a>
                        <span> > 내 판매 상품</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                	<div align="right">
		                <a href="${contextPath }/myShop/saleExcelExport"><img alt="엑셀이미지" src="${contextPath }/resources/bootstrap/img/excel.jpeg" width="50"/></a>
                	</div>
               		<a href="${contextPath }/shop/addProduct" class="primary-btn cart-btn"/>상품 등록</a>
               		<a href="${contextPath }/myShop/saleList" class="primary-btn cart-btn"/>결재된 상품 내역</a>
               		<a href="${contextPath }/qna/qnaList" class="primary-btn cart-btn"/>Q&A 확인</a>
                	<hr>
                    <div class="shoping__cart__table">
                        <table>
                            <thead align="center">
                            	<tr>
                            		<th colspan="9" >내 판매상품</th>
                            	</tr>
                                <tr>
                                	<th>
	                        			<input type="checkbox" id="allMySale" onchange="selectAllMySale()">
								 	</th>
                                    <th colspan="2">상품이름</th>
                                    <th>재고</th>
                                    <th>할인률</th>
                                    <th>가격</th>
                                    <th>배송방법</th>
                                    <th>배송비</th>
                                    <th>등록일</th>
                                </tr>
                            </thead>
                            <tbody >
                            	<c:choose>
                            		<c:when test="${empty mySaleList }">
                            			<tr align="center">
                            				<td colspan="9" ><h5>등록한 판매 상품이 없습니다.</h5></td>
                            			</tr>
                            		</c:when>
									<c:otherwise>
										<c:forEach var="mySale" items="${mySaleList }">
			                                <tr>
			                                	<td>
               							       		<input type="checkbox" name="productCd" value="${mySale.productCd}">
               							        </td>
			                                    <td class="shoping__cart__product__pic">
			                                    	<img src="${contextPath }/shop/thumbnails?file=${mySale.productFile}" width="50" height="50"/>
			                                    </td>
			                                    <td class="shoping__cart__product" align="left">
			                                    	<a href="${contextPath }/shop/shopDetail?productCd=${mySale.productCd }">
			                                    		${mySale.productNm }
			                                    	</a>
			                                    </td>
			                                    <td>
			                                    	<span>${mySale.stock }</span>
			                                    </td>
			                                    <td class="shoping__cart__price">
			                                    	<span>${mySale.discountRate }%</span>
			                                    </td>
			                                    <td>
			                                    	<span><fmt:formatNumber value="${mySale.price }"/>원</span>
			                                    </td>
			                                    <td>
			                                    	<span>${mySale.deliveryMethod }</span>
			                                    </td>
			                                    <td>
			                                    	<span><fmt:formatNumber value="${mySale.deliveryPrice }"/>원</span>
			                                    </td>
			                                    <td>
			                                    	<span><fmt:formatDate value="${mySale.enrollDt }"  pattern="yyyy-MM-dd"/></span>
			                                    </td>
			                                </tr>
										</c:forEach>	                            	
									</c:otherwise>                            	
                            	</c:choose>
                            </tbody>
                        </table>
                        <br>
	                 	 <div align="center">
		                 	  <span>
			                  	<button type="button" class="btn btn-danger" onclick="removeMySale();">삭제</button>
		                 	 </span>
		                 </div>
	                 	<br>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>