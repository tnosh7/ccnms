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
	
	$().ready(function(){
		totalPrice();
		$("#qty").change(function(){
			totalPrice();
		});
	});
	function modifyCart(cartCD) {
		$.ajax({
			type:"get",
			url:"${contextPath}/myCart/modifyCartQty",
			data:{
				"cartCD" : cartCD,
				"cartQty" : $("qty").val()
			},
			success:function(){
				totalPrice();
			}
		});
		
	}
	function totalPrice() {
		var totalPrice= Number(${shopDTO.price - shopDTO.price * shopDTO.discountRate /100} * $("#qty").val());
		$("#totalPrice").html(totalPrice);		
	}



</script>
</head>
<body>
<section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product">제품</th>
                                    <th>가격</th>
                                    <th>수량</th>
                                    <th>총 금액</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="shoping__cart__item">
                                        <img src="img/cart/cart-1.jpg" alt="">
                                        <h5>${shopDTO.productNm}</h5>
                                    </td>
                                    <td class="shoping__cart__price">
                                    	<fmt:formatNumber value="${shopDTO.price - shopDTO.price * shopDTO.discountRate /100}"/>원
                                    </td>
                                    <td class="shoping__cart__quantity">
                                        <div class="quantity" onmouseleave="modifyCartQty(cartCd)">
                                            <div class="pro-qty">
                                                <input type="text" id="qty" value="1">
                                            </div>
                                        </div>
                                    </td>
                                    <td class="shoping__cart__total">
                                    	<span id="totalPrice"></span>
                                    </td>
                                    <td class="shoping__cart__item__close">
                                        <span class="icon_close" onclick="remove();"></span>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <a href="${contextPath }/shop/" class="primary-btn cart-btn">계속 쇼핑하기</a>
                        <a href="${contextPath }/shop/myKeep" class="primary-btn cart-btn cart-btn-right"><span class="icon_loading"></span>
                            장바구니로 이동</a>
                    </div>
                </div>
                <div class="col-lg-6 md-6">
                    <div class="shoping__checkout">
                        <h5>총 금액</h5>
                        <ul>
                            <li>Total <span><fmt:formatNumber value="${shopDTO.price - shopDTO.price * shopDTO.discountRate /100}"/>원</span></li>
                        </ul>
                        <a href="${contextPath }/order/orderSheet?productCd=${shopDTO.productCd}" class="primary-btn" style="background:salmon">구매진행하기</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>