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
</head>
<body>
<section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead align="center">
                                <tr>
                                	<th>배송조회</th>
                                    <th colspan="2">상품</th>
                                    <th>상품수량</th>
                                    <th>주문가격</th>
                                    <th>주문날짜</th>
                                    <th>리뷰</th>
                                </tr>
                            </thead>
                            <tbody >
                            	<c:choose>
                            		<c:when test="${empty orderList }">
                            			<tr align="center">
                            				<td colspan="5" ><h5>조회된 상품이 없습니다.</h5></td>
                            			</tr>
                            		</c:when>
									<c:otherwise>
										<c:forEach var="myOrder" items="${orderList }">
			                                <tr>
			                                	<td>
			                                		<span>${myOrder.deliveryStatus}</span>
			                                	</td>
			                                    <td class="shoping__cart__product__pic">
			                                    	<img src="${contextPath }/shop/thumbnails?file=${myOrder.productFile}" width="50" height="50"/>
			                                    </td>
			                                    <td class="shoping__cart__product" align="left">
			                                    	<a href="${contextPath }/myShop/orderDetail?orderCd=${myOrder.orderCd}&userId=${myOrder.userId}">
			                                    		${myOrder.productNm }
			                                    	</a>
			                                    </td>
			                                    <td class="shoping__cart__price">
			                                    	<span>${myOrder.orderQty }개</span>
			                                    </td>
			                                    <td>
			                                    	<span><fmt:formatNumber value="${myOrder.paymentAmt }"/>원</span>
			                                    </td>
			                                    <td>
			                                    	<span><fmt:formatDate value="${myOrder.payOrderTime }"  pattern="yyyy-MM-dd"/></span>
			                                    </td>
			                                    <td>
			                                    	<span></span>
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
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns" align="center">
                        <a href="${contextPath }/shop/" class="primary-btn cart-btn">계속 쇼핑하기</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>