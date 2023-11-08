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
	function setDelivery() {
		$("#deliveryInfo").hide();
		$("#newDelivery").show();
	}
	function execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	
	            var fullRoadAddr = data.roadAddress; 
	            var extraRoadAddr = ''; 	
	            if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                extraRoadAddr += data.bname;
	            }
	            if (data.buildingName !== '' && data.apartment === 'Y'){
	               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	            }
	            if (extraRoadAddr !== ''){
	                extraRoadAddr = ' (' + extraRoadAddr + ')';
	            }
	            if (fullRoadAddr !== ''){
	                fullRoadAddr += extraRoadAddr;
	            }
	
	            document.getElementById('zipcode').value = data.zonecode; 
	            document.getElementById('roadAddress').value = fullRoadAddr;
	            document.getElementById('jibunAddress').value = data.jibunAddress;
	        }
	    }).open();
	}
	function setPayMethod(){
		var method = $("[name='payMethod']").val();
		if (method == 'card') {
			$("#cardPayMonth,#cardCompanyNm").show();
			$("#payOrdererHp").hide();
			$("#accountCompanyNm,#account").hide();
		}
		else if (method =='phone') {
			$("#payOrdererHp").show();
			$("#cardPayMonth,#cardCompanyNm").hide();
			$("#accountCompanyNm,#account").hide();
		}
		else {
			$("#accountCompanyNm,#account").show();
			$("#cardPayMonth,#cardCompanyNm").hide();
			$("#payOrdererHp").hide();
		}
	}
</script>

</head>
<body>
<c:if test="${sessionScope.userId eq null}">
	<script>
		location.href = "${contextPath}/user/loginUser";
	</script>
</c:if>
 <section class="checkout spad">
        <div class="container">
           <form action="${contextPath }/order/orderSheet" method="post">
            <div class="row">
                <div class="col-lg-12">
                     <div class="checkout__order">
                        <div class="checkout__order__products">배송지<span>  <input type="button" id="diff-delivery" value="배송지 변경" onclick="setDelivery()"></span></div>
                        <hr>
                        <ul>
                            <li>${userDTO.userNm}</li>
                            <li>${userDTO.hp }</li>
                        </ul>
                        <div id="deliveryInfo">
                        	${userDTO.roadAddress} ${userDTO.namujiAddress } ( ${userDTO.zipcode} )
                        	<input type="hidden" name="zipcode" value="${userDTO.zipcode}" />
                        	<input type="hidden" name="roadAddress" value="${userDTO.roadAddress}" />
                        	<input type="hidden" name="jibunAddress" value="${userDTO.jibunAddress}" />
                        	<input type="hidden" name="namujiAddress" value="${userDTO.namujiAddress}" />
                        </div>
                        <div id="newDelivery" style="display: none"  >
                        	<p><input type="text" id="zipcode" placeholder="우편번호"  style="width: 40%;">
                           		<input type="button" value="주소 검색" onclick="javascript:execDaumPostcode()" style="width: 30%; padding-left: 0"></p>
                            <p><input type="text" id="roadAddress"   placeholder="도로명 주소"   style="width: 40%;"></p>
                            <p><input type="text" id="jibunAddress"  placeholder="지번 주소"     style="width: 40%;"></p>
                            <p><input type="text" id="namujiAddress" placeholder="나머지 주소"   style="width: 40%;"></p>
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
                                        <input type="text" name="ordererNm" id="ordererNm" value="${userDTO.userNm }"> 
                               		</div>
                                </div>
                                <div class="col-lg-6">
	                                <div class="checkout__input">
	                                    <p>주문자 연락처 <span>*</span></p>
	                                    <input type="text" name="ordererHp" id="ordererHp" value="${userDTO.hp }" placeholder="숫자만 입력" maxlength="11">
	                                </div>
                            	</div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>받는분 성함<span>*</span></p>
                                        <input type="text" name="receiverNm" id="receiverNm" value="${userDTO.userNm }" >
                               		</div>
                                </div>
                                <div class="col-lg-6">
	                                <div class="checkout__input">
	                                    <p>받는분 연락처 <span>*</span></p>
	                                    <input type="text" name="receiverHp" id="receiverHp" value="${userDTO.hp }" placeholder="숫자만 입력" maxlength="11">
	                                </div>
                            	</div>
                                <div class="col-lg-12">
                                    <div class="checkout__input">
                                       <p>지불방법<span>*</span></p>
		                               	<select name="payMethod" onchange="setPayMethod()">
		                               		<option value="card">카드결제</option>
		                               		<option value="account">계좌이체</option>
		                               		<option value="phone">휴대폰결제</option>
		                               	</select>
                               		</div>
                                </div>
	                                <div id="cardCompanyNm" class="col-lg-6">
	                                    <div class="checkout__input">
	                                       <p>카드회사 <span>*</span></p>
			                                <select name="cardCompanyNm">
												<option value="삼성">삼성</option>
												<option value="하나SK">하나SK</option>
												<option value="현대">현대</option>
												<option value="KB">KB</option>
												<option value="신한">신한</option>
												<option value="롯데">롯데</option>
												<option value="BC">BC</option>
												<option value="시티">시티</option>
												<option value="NH농협">NH농협</option>
										   </select>
	                               		</div>
	                                </div>
	                                <div id="cardPayMonth" class="col-lg-6">
		                                <div class="checkout__input">
		                                    <p>할부개월 <span>*</span></p>
		                                    <select name="cardPayMonth">
												<option value="0">일시불</option>                                    
												<option value="1">1개월</option>                                    
												<option value="2">2개월</option>                                    
												<option value="3">3개월</option>                                    
												<option value="4">4개월</option>                                    
												<option value="5">5개월</option>                                    
												<option value="6">6개월</option>                                    
		                                    </select>
		                                </div>
	                            	</div>
	                                  <div id="accountCompanyNm" class="col-lg-6 col-md-6 col-sm-6" style="display: none">
	                                    <div class="checkout__input">
	                                       <p> 은행 <span>*</span></p>
			                                <select name="accountCompanyNm">
												<option value="삼성">삼성</option>
												<option value="하나SK">하나SK</option>
												<option value="현대">현대</option>
												<option value="KB">KB</option>
												<option value="신한">신한</option>
												<option value="롯데">롯데</option>
												<option value="BC">BC</option>
												<option value="시티">시티</option>
												<option value="NH농협">NH농협</option>
										   </select>
	                               		</div>
	                                </div>
	                                  <div id="account" class="col-lg-6 col-md-6 col-sm-6" style="display: none">
		                                <div class="checkout__input">
		                                     <p>계좌번호 <span>*</span></p>
	                                    <input type="text" name="account" placeholder="계좌번호를 입력하세요.">
		                                </div>
	                            	</div>
	                              <div id="payOrdererHp" class="col-lg-6 col-md-6 col-sm-6" style="display: none">
		                            <div class="checkout__input">
		                                  <p>결제 휴대폰 번호 <span>*</span></p>
		                                  <input type="text" name="payOrdererHp" placeholder="숫자만 입력" maxlength="11">
		                            </div>
	                            </div>
		                          </div>  
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="checkout__input">
                                        <p>배송 메시지<span>*</span></p>
                                        <input type="text" name="deliveryMessage" id="deliveryMessage" placeholder="배송 메시지를 입력하세요." maxlength="45">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="checkout__order">
                                <h4>결제상세</h4>
                                <div class="checkout__order__products">상품<span></span></div>
                                <ul>
                                    <li>${shopDTO.productNm }<span>${orderQty } 개</span></li>
                                    <li>가격<span><fmt:formatNumber value="${(shopDTO.price - shopDTO.price * shopDTO.discountRate /100) * orderQty}"/>원</span></li>
                                    <li>배송비<span>${shopDTO.deliveryPrice}원</span></li>
                                	<li>배송방법<span>${shopDTO.deliveryMethod }</span></li>
                                	<li>포장 여부<span><input type="radio" name="giftWrapping" value="Y">예 <input type="radio" name="giftWrapping" value="N">아니오</span></li>
                                </ul>
                                <input type="hidden" name="deliveryMethod" value="${shopDTO.deliveryMethod }"/>
                                <hr>
                                <div class="checkout__order__total">
                                	<c:set var="paymentAmt" value="${(shopDTO.price - shopDTO.price * shopDTO.discountRate /100) * orderQty + shopDTO.deliveryPrice}" />
                                	총액 <span><fmt:formatNumber value="${paymentAmt}"/>원</span></div>
                                </div>
                                <input type="hidden" name="paymentAmt" value='<fmt:parseNumber integerOnly="true" value="${paymentAmt }"/>'/> 
                                <p style="color:green"><span>*</span>
                                 	주문자 정보로 결제관련 정보가 제공됩니다. 정확한 정보로 등록되어있는지 확인해주세요.
                                </p>
                                <div align="center">
	                                <button type="submit" class="site-btn"><span class="icon_check"></span>&emsp;주문</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
    </section>
</body>
</html>