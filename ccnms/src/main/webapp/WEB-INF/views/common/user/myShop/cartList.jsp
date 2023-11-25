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
<style>
	a {color:black}
  	a:visited { color:black; }
	a:hover { color:purple; }   
</style>
<script>
	$().ready(function(){
		getTotalPrice();

		$("[name='cartCd']").change(function(){
			getTotalPrice();
			getCartCdPrice();
		});
	});

	function getTotalPrice(){
		var totalPrice = 0;
		
		$("[name='cartCd']:checked").each(function(){
			var tempCartCd = $(this).val();
			totalPrice += Number($("#price" + tempCartCd).val()) * Number($("#cartQty" + tempCartCd).val());
			for (var i = 0; i < this.length; i++) {
				cdPrice[i] += Number($("#price" + tempCartCd).val()) * Number($("#cartQty" + tempCartCd).val());
			}
		});
		totalPrice = totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + " 원";
		$("#totalPrice").html(totalPrice);
	};
	
	function getCartCdPrice(cartCd){
		var cartCdPrice = 0;
		var tempCartCd = ""; 
		tempCartCd= cartCd;
		cartCdPrice= Number($("#price" + tempCartCd).val()) * Number($("#cartQty"+tempCartCd).val());
		cartCdPrice = cartCdPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + " 원";
		$("#cdPrice" + tempCartCd).html(cartCdPrice);
	}
	
	function modifyCartQty(cartCd) {
		$.ajax({
			type: "get",
			url: "${contextPath}/myShop/modifyCartQty",
			data: {
				"cartCd" : cartCd,
				"cartQty" : $("#cartQty" + cartCd).val()
			},
			success:function(){
				getTotalPrice();
				getCartCdPrice(cartCd);
			}
		});
	}
	
	function removeCart(){
		var cartCdList = "";
		Swal.fire({
			  title: '장바구니에서 삭제하시겠습니까?',
			  showCancelButton: true,
			  confirmButtonText: '삭제',
			}).then((result) => {
				if (result.isConfirmed) {
					$("input[name='cartCd']:checked").each(function(){
						cartCdList += $(this).val() + ",";
					});
					location.href= "${contextPath}/myShop/removeCart?cartCdList=" + cartCdList;
					}
			})
	} 
	
	function selectAll(){
		if ($("#allChoice").prop("checked")) {
			$("[name='cartCd']").prop("checked" , true);
		}
		else {
			$("[name='cartCd']").prop("checked" , false);
		}
		getTotalPrice();
	}
	
	function orderSheet(){
		
		var cartCdList  = "";
		var cartQtyList = "";
		var productCdList="";
		$("[name='cartCd']:checked").each(function(){
			var cartCd = $(this).val();
			var productCd = $("#productCd" + cartCd).val();
			var cartQty = $("#cartQty" + cartCd).val();
						
			cartCdList    += cartCd + ",";
			productCdList += productCd + ",";
			cartQtyList   += cartQty + ",";
		});
		
		if (cartCdList == "") {
			Swal.fire({
				  icon: 'info',
				  title: '주문 목록이 없습니다.',
			})	  
			return false;
		}
		var total= $("#totalPrice").html();
		if (total == "0 원") {
			Swal.fire({
				  icon: 'info',
				  title: '주문 수량이 0개 입니다.',
			})	  
			return false;
		}
		var url =  "${contextPath}/order/cartOrderSheet";
			url += "?cartCdList=" + cartCdList;
			url += "&productCdList=" + productCdList;
			url += "&cartQtyList=" + cartQtyList;
		location.href = url;
	}
</script>
</head>
<body>
<div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="${contextPath }/"><i class="fa fa-home"></i> Home > </a>
                        <span> 장바구니 </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
<section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead align="center">
                                <tr>
                                	<th><input type="checkbox" id="allChoice" onchange="selectAll()" checked/></th>
                                	<th></th>
                                    <th class="shoping__product">&emsp;&emsp;제품</th>
                                    <th>가격</th>
                                    <th>수량</th>
                                    <th>등록일자</th>
                                    <th>금액</th>
                                </tr>
                            </thead>
                            <tbody >
                            	<c:choose>
                            		<c:when test="${empty cartList }">
                            			<tr>
                            				<td colspan="7" ><h5>조회된 상품이 없습니다.</h5></td>
                            			</tr>
                            		</c:when>
									<c:otherwise>
										<c:forEach var="myCart" items="${cartList }" >
			                                <tr>
			                                    <td class="shoping__cart__checkbox">
			                                    	<input type="checkbox" name="cartCd" value="${myCart.cartCd }" checked>
			                                    	<input type="hidden" name="cartCd${i.index }">
			                                    </td>
			                                    <td class="shoping__cart__product__pic">
			                                    	<img src="${contextPath}/thumbnails?file=${myCart.productFile}" width="50" height="50"/>
			                                    </td>
			                                    <td class="shoping__cart__product" align="left">
			                                    	<a href="${contextPath }/shop/shopDetail?productCd=${myCart.productCd}">
			                                    		${myCart.productNm }
			                                    	</a>
			                                    	<input type="hidden" id="productCd${myCart.cartCd }" value="${myCart.productCd }"/>
			                                    </td>
			                                    <td class="shoping__cart__price">
			                                      	<span style="text-decoration: line-through; color: gray" ><fmt:formatNumber value="${myCart.price }"/></span><br>
			                                    	<fmt:formatNumber value="${myCart.price - myCart.price * (myCart.discountRate / 100) }"/>원
			                                    	<input type="hidden" id="price${myCart.cartCd }" value="${myCart.price - myCart.price * (myCart.discountRate / 100) }"/>
			                                    </td>
			                                    <td class="shoping__cart__quantity">
			                                        <div class="quantity" onmouseleave="modifyCartQty(${myCart.cartCd })">
			                                            <div class="pro-qty">
			                                                <input type="text" id="cartQty${myCart.cartCd }" value="${myCart.cartQty }"/>
			                                            </div>
			                                        </div>
			                                    </td>
			                                    <td>
			                                    	<span><fmt:formatDate value="${myCart.enrollDt }" pattern="yyyy-MM-dd"/></span>
			                                    </td>
			                                    <td class="shoping__cart__total">
			                                    	<span id="cdPrice${myCart.cartCd }" >${myCart.price - myCart.price * (myCart.discountRate / 100) }원</span>
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
            <div class="row" align="right">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <a href="${contextPath }/shop/" class="primary-btn cart-btn">계속 쇼핑하기</a>
                         <a href="javascript:removeCart();" class="primary-btn" style="background:grey">물품 삭제</a>
                    </div>
                </div>
                <div class="col-lg-6 md-6" >
                    <div class="shoping__checkout">
                        <h5>총 금액</h5>
                        <ul>
                            <li>Total<span id="totalPrice" onclick="total()">&esmp;</span></li>
                        </ul>
                        <a href="javascript:orderSheet()" class="primary-btn" style="background:salmon">구매진행하기</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>