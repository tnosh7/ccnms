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
	function changeDeliveryStatus(){
		var deliveryList="";
		if ($("#deliveryCheck").prop("checked")) {
			$("#deliveryCheck:checked").each(function(){
				deliveryList+= $(this).val()+",";
				location.href="${contextPath}/myShop/changeDeliveryStatus?deliveryList=" + deliveryList;
			});
		}
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
                        <span>내 상점</span>
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
               		<a href="${contextPath }/qna/qnaList" class="primary-btn cart-btn"/>Q&A 확인</a>
                	<hr>
                    <div class="shoping__cart__table">
                        <table>
                            <thead align="center">
                            	<tr>
                            		<th colspan="9" >주문상품</th>
                            	</tr>
                                <tr>
                                	<th>체크</th>
                                    <th colspan="2">주문정보</th>
                                    <th>주문자</th>
                                    <th>상품수량</th>
                                    <th>주문가격</th>
                                    <th>주문날짜</th>
                                    <th>배송상태</th>
                                    <th>Q&A</th>
                                </tr>
                            </thead>
                            <tbody >
                            	<c:choose>
                            		<c:when test="${empty saleList }">
                            			<tr align="center">
                            				<td colspan="8" ><h5>조회된 상품이 없습니다.</h5></td>
                            			</tr>
                            		</c:when>
									<c:otherwise>
										<c:forEach var="sale" items="${saleList }">
			                                <tr>
			                                	<td width=7>
			                                		<input type="checkbox" id="deliveryCheck" name="orderCd" value="${sale.orderCd }">
			                                	</td>
			                                    <td class="shoping__cart__product__pic">
			                                    	<img src="${contextPath }/shop/thumbnails?file=${sale.productFile}" width="50" height="50"/>
			                                    </td>
			                                    <td class="shoping__cart__product" align="left">
			                                    	<a href="${contextPath }/shop/shopDetail?productCd=${sale.productCd }">
			                                    		${sale.productNm }
			                                    	</a>
			                                    </td>
			                                    <td>
			                                    	<span>
			                                    		<a href="${contextPath }/myShop/orderDetail?orderCd=${sale.orderCd}&userId=${sale.userId}">
			                                    			${sale.userId }
			                                    		</a>
			                                    	</span>
			                                    </td>
			                                    <td class="shoping__cart__price">
			                                    	<span>${sale.orderQty }개</span>
			                                    </td>
			                                    <td>
			                                    	<span><fmt:formatNumber value="${sale.paymentAmt }"/>원</span>
			                                    </td>
			                                    <td>
			                                    	<span><fmt:formatDate value="${sale.payOrderTime }"  pattern="yyyy-MM-dd"/></span>
			                                    </td>
			                                    <td>
			                                    	<span>${sale.deliveryStatus }</span>
			                                    </td>
			                                    <td>
			                                    	<span>${sale.qnaCnt}</span>
			                                    </td>
			                                </tr>
										</c:forEach>	                            	
									</c:otherwise>                            	
                            	</c:choose>
                            </tbody>
                        </table>
                        
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>