<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="${contextPath }/"><i class="fa fa-home"></i> Home > </a>
                        <span> 찜한 상품</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->
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
	                      	<c:choose>
	                      		<c:when test="${empty myKeepList }">
	                      			<tr align="center">
	                      				<td colspan="5"><h5>조회된 상품이 없습니다.</h5></td>
	                      			</tr>
	                      		</c:when>
	                      		<c:otherwise>
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
	                      		</c:otherwise>
	                      	</c:choose>
	                      </tbody>
	                     </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <a href="#" class="primary-btn cart-btn">CONTINUE SHOPPING</a>
                        <a href="#" class="primary-btn cart-btn cart-btn-right"><span class="icon_loading"></span>
                            Upadate Cart</a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__continue">
                        <div class="shoping__discount">
                            <h5>Discount Codes</h5>
                            <form action="#">
                                <input type="text" placeholder="Enter your coupon code">
                                <button type="submit" class="site-btn">APPLY COUPON</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__checkout">
                        <h5>Cart Total</h5>
                        <ul>
                            <li>Subtotal <span>$454.98</span></li>
                            <li>Total <span>$454.98</span></li>
                        </ul>
                        <a href="#" class="primary-btn">PROCEED TO CHECKOUT</a>
                    </div>
                </div>
            </div>
        </div>
    </section>	

</body>
</html>