<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$().ready(function(){
		
		$("[name='payOrdererHp']").val("${orderDTO.payOrdererHp}");
		$("[name='cardCompanyNm']").val("${orderDTO.cardCompanyNm}");
		$("[name='cardPayMonth']").val("${orderDTO.cardPayMonth}");
		$("[name='accountCompanyNm']").val("${orderDTO.accountCompanyNm}");
		$("[name='account']").val("${orderDTO.account}");

	});
</script>
</head>
<body>
 <section class="checkout spad">
        <div class="container">
           <form action="${contextPath }/order/orderSheet" method="post">
            <div class="row">
                <div class="col-lg-12">
                     <div class="checkout__order">
                        <div class="checkout__order__products">배송지<span><fmt:formatDate value="${orderDTO.payOrderTime }" pattern="yyyy-MM-dd"/></span></div>
                        <hr>
                        <ul>
                            <li>${orderDTO.ordererNm}</li>
                            <li>${orderDTO.ordererHp }</li>
                        </ul>
                        <div id="deliveryInfo">
                        	${orderDTO.roadAddress} ${orderDTO.namujiAddress } ( ${orderDTO.zipcode} )
                        </div>
                      </div>
                </div>
            </div>
            <br>
             <input type="hidden" name="productCd" value="${shopDTO.productCd }">
             <input type="hidden" name="orderQty" value='<fmt:parseNumber integerOnly="true" value="${orderQty}"/>'/>
             <input type="hidden" name="userId" value="${userDTO.userId}">
             <input type="hidden" name="point" value="${shopDTO.point * orderQty}">
            <div class="checkout__form">
                <h4>주문/결제</h4>
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <div class="row">
                             <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>주문자 성함<span>*</span></p>
                                        <input type="text" name="ordererNm" id="ordererNm" value="${orderDTO.ordererNm }" disabled> 
                               		</div>
                                </div>
                                <div class="col-lg-6">
	                                <div class="checkout__input">
	                                    <p>주문자 연락처 <span>*</span></p>
	                                    <input type="text" name="ordererHp" id="ordererHp" value="${orderDTO.ordererHp }" disabled>
	                                </div>
                            	</div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>받는분 성함<span>*</span></p>
                                        <input type="text" name="receiverNm" id="receiverNm" value="${orderDTO.receiverNm }" disabled>
                               		</div>
                                </div>
                                <div class="col-lg-6">
	                                <div class="checkout__input">
	                                    <p>받는분 연락처 <span>*</span></p>
	                                    <input type="text" name="receiverHp" id="receiverHp" value="${orderDTO.receiverHp }" disabled>
	                                </div>
                            	</div>
                                <div class="col-lg-12">
                                    <div class="checkout__input">
                                       <p>지불방법<span>*</span></p>
                                       <input type="text" name="payMethod" value="${orderDTO.payMethod}" disabled/>
                               		</div>
                                </div>
                                <c:choose>	
                                	<c:when test="${orderDTO.payMethod eq 'card'}">
	                                <div id="cardCompanyNm" class="col-lg-6">
	                                    <div class="checkout__input">
	                                       <p>카드회사 <span>*</span></p>
		                                   <input type="text" name="cardCompanyNm" value="${orderDTO.cardCompanyNm}" disabled/>	
	                               		</div>
	                                </div>
	                                <div id="cardPayMonth" class="col-lg-6">
		                                <div class="checkout__input">
		                                    <p>할부개월 <span>*</span></p>
	                                       <c:choose>
		                                    	<c:when test="${orderDTO.cardPayMonth == 0}">
				                                    <input type="text" name="cardPayMonth" value="일시불" disabled> 
		                                    	</c:when>
		                                    	<c:otherwise>
				                                    <input type="text" name="cardPayMonth" value="${orderDTO.cardPayMonth }개월" disabled>
		                                    	</c:otherwise>
		                                    </c:choose>
		                                </div>
	                            	</div>
                            	  	</c:when>
                            		<c:when test="${orderDTO.payMethod eq 'account'}">
	                                  <div id="accountCompanyNm" class="col-lg-6 col-md-6 col-sm-6" style="display: none">
	                                    <div class="checkout__input">
	                                       <p> 은행 <span>*</span></p>
	                                       	 <input type="text" name="accountCompanyNm" value="${orderDTO.accountCompanyNm }" disabled>
	                               		</div>
	                                </div>
	                                  <div id="account" class="col-lg-6 col-md-6 col-sm-6" style="display: none">
		                                <div class="checkout__input">
		                                     <p>계좌번호 <span>*</span></p>
	                                    <input type="text" name="account" value="${orderDTO.account }" disabled>
		                                </div>
	                            	</div>
	                            </c:when>
	                            <c:otherwise>
`	                              <div id="payOrdererHp" class="col-lg-6 col-md-6 col-sm-6" style="display: none">
		                            <div class="checkout__input">
		                                  <p>결제 휴대폰 번호 <span>*</span></p>
		                                  <input type="text" name="payOrdererHp" value="${orderDTO.payOrdererHp }" disabled>
		                            </div>
	                           	 </div>
	                            </c:otherwise>
	                           	</c:choose>
                           	</div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="checkout__input">
                                        <p>배송 메시지<span>*</span></p>
                                        <input type="text" name="deliveryMessage" value="${orderDTO.deliveryMessage }" disabled>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="checkout__order">
                                <h4>결제상세</h4>
                                <div class="checkout__order__products">상품<span></span></div>
                                <ul>
                                    <li>${orderDTO.productNm }<span>${orderDTO.orderQty } 개</span></li>
                                    <li>가격<span><fmt:formatNumber value="${(orderDTO.price - orderDTO.price * orderDTO.discountRate /100) * orderDTO.orderQty}"/>원</span></li>
                                    <li>배송비<span>${orderDTO.deliveryPrice}원</span></li>
                                	<li>배송방법<span>${orderDTO.deliveryMethod }</span></li>
                                	<li>포장 여부
                                		<span>
                                			<c:choose>
                                				<c:when test="${orderDTO.giftWrapping == 'Y'}">
                                					포장
                                				</c:when>
                                				<c:otherwise>
                                					미포장
                                				</c:otherwise>
                                			</c:choose>
                                		</span>
                                	</li>
                                	<li>포인트<span><fmt:formatNumber value="${orderDTO.point }"/></span></li>
                                </ul>
                                <hr>
                                <div class="checkout__order__total">
                                	<c:set var="paymentAmt" value="${(orderDTO.price - orderDTO.price * orderDTO.discountRate /100) * orderDTO.orderQty + shopDTO.deliveryPrice}" />
                                	총액 <span><fmt:formatNumber value="${orderDTO.paymentAmt}"/>원</span></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
    </section>
</body>
</html>