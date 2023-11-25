<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
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
	
	function removeKeep(){
		var keepCdList= "";
		$("input[name='keepCd']:checked").each(function(){
			keepCdList += $(this).val() + ",";
		});
		location.href = "${contextPath}/myShop/removeKeep?keepCdList=" + keepCdList;
	}
	
</script>
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
                            <thead align="center">
                                <tr>
                                	<th></th>
                                    <th>판매자</th>
                                    <th colspan="2">제품</th>
                                    <th>가격</th>
                                    <th>등록일</th>
                                </tr>
                            </thead>
                            <tbody >
                            	<c:choose>
                            		<c:when test="${empty myKeepList }">
                            			<tr>
                            				<td colspan="6" ><h5>조회된 상품이 없습니다.</h5></td>
                            			</tr>
                            		</c:when>
									<c:otherwise>
										 <c:forEach var="keepDTO" items="${myKeepList}" >
			                                <tr>
			                                    <td class="shoping__cart__checkbox">
			                                    	<input type="checkbox" name="keepCd" value="${keepDTO.keepCd }">
			                                    </td>
			                                	<td>
		                                		   <div>
			                                       	판매자 : <span>${keepDTO.writer }</span>
			                                       </div>
			                                	</td>
			                                    <td class="shoping__cart__product__pic">
			                                    	<img alt="" src="${contextPath }/thumbnails?file=${keepDTO.productFile}" width="50" height="50">
			                                    </td>
			                                    <td class="shoping__cart__product" align="left">
			                                    	 <a href="${contextPath }/shop/shopDetail?productCd=${keepDTO.productCd }"> 	
					                             		 ${keepDTO.productNm }
				                              	 	 </a>
			                                    </td>
			                                    <td class="shoping__cart__price">
			                                      	<span style="text-decoration: line-through; color: gray" ><fmt:formatNumber value="${keepDTO.price }"/></span><br>
			                                    	<span><fmt:formatNumber value="${keepDTO.price - keepDTO.price * keepDTO.discountRate / 100}"/>원</span>
			                                    </td>
			                                    <td>
			                                    	<span><fmt:formatDate value="${keepDTO.enrollDt }" pattern="yyyy-MM-dd"/></span>
			                                    </td>
		                                    </tr>
	                                    </c:forEach>
                                    </c:otherwise>
                                   </c:choose>
                                  </tbody>
                                </table>
                               <br>
							<div class="row">
				                <div class="col-lg-12" align="right">
				                    <div class="shoping__cart__btns">
				                        <a href="${contextPath }/shop/" class="primary-btn cart-btn">계속 쇼핑하기</a>
				                        <a href="javascript:removeKeep();" class="primary-btn cart-btn">찜 취소</a>
				                    </div>
			                    </div>
		                    </div>
                    	</div>
                   </div>
                  </div>
                 </div>
              </section>
</body>
</html>