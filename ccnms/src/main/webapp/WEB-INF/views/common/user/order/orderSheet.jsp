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
 <section class="checkout spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h6><span class="icon_tag_alt"></span> Have a coupon? <a href="#">Click here</a> to enter your code
                    </h6>
                </div>
            </div>
            <div class="checkout__form">
                <h4>주문/결제</h4>
                <form action="${contextPath }/shop/shop" method="post">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <div class="row">
                            <div class="col-lg-6">
                                <label for="delivery">
                                     <p>배송지 선택<span>*</span></p>
                                    <input type="radio" name="delivery_place">
                                    	기본 배송지
                                    <span class="checkmark"></span>
                                    <input type="radio" name="delivery_place">
                                    	신규 배송지
                                    <span class="checkmark"></span>
                                    
                                </label>
                            </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p style="color:green"><span>*</span>
                                    	주문자 정보로 결제관련 정보가 제공됩니다. 정확한 정보로 등록되어있는지 확인해주세요.
                                        </p>
                                    </div>
                                </div>
                            <hr>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>배송지명<span>*</span></p>
                                        <input type="text">
                                    </div>
                                </div>
                                 <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="checkout__form__input">
                                    <p>주문자 연락처 <span>*</span></p>
                                    <select>
                                    	<option>선택</option>
                                    	<option>010</option>
                                    </select>
                                    - <input type="text" name="ordererHp" placeholder="뒷번호 8자리 숫자만 입력">
                                </div>
                            </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>배송지 주소<span>*</span></p>
                                        <input type="text">
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input">
                                <p>배송메모<span>*</span></p>
                                <input type="text" placeholder="요청사항을 직접 입력합니다.">
                            </div>
                            <div class="checkout__input">
                                <p>지불방법<span>*</span></p>
                                <input type="text">
                            </div>
                            <div class="checkout__input">
                                <p>Postcode / ZIP<span>*</span></p>
                                <input type="text">
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Phone<span>*</span></p>
                                        <input type="text">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Email<span>*</span></p>
                                        <input type="text">
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input__checkbox">
                                <label for="diff-acc">
                                    Ship to a different address?
                                    <input type="checkbox" id="diff-acc">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="checkout__order">
                                <h4>결제상세</h4>
                                <div class="checkout__order__products">상품<span></span></div>
                                <ul>
                                    <li>${shopDTO.productNm }<span><fmt:formatNumber value="${shopDTO.price - shopDTO.price * shopDTO.discountRate /100}"/>원</span></li>
                                    <li>배송비<span>${shopDTO.deliveryPrice}원</span></li>
                                </ul>
                                <div class="checkout__order__total">총액 <span><fmt:formatNumber value="${shopDTO.deliveryPrice + (shopDTO.price -shopDTO.price * shopDTO.discountRate / 100) }"/>원</span></div>
                                </div>
                                <p>Lorem ipsum dolor sit amet, consectetur adip elit, sed do eiusmod tempor incididunt
                                    ut labore et dolore magna aliqua.</p>
                                <button type="submit" class="site-btn">PLACE ORDER</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
</body>
</html>