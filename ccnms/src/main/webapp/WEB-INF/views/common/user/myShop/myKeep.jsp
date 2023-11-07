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
	                      	<c:choose>
	                      		<c:when test="${empty myKeepList }">
	                      			<tr align="center">
	                      				<td colspan="5"><h5>조회된 상품이 없습니다.</h5></td>
	                      			</tr>
	                      		</c:when>
	                      		<c:otherwise>
		                           <c:forEach var="keepDTO" items="${myKeepList}" >
	                                    <a href="${contextPath }/shop/shopDetail?productCd=${keepDTO.productCd } class="list-group-item list-group-item-action flex-column align-items-start">
				                            <div class="d-flex justify-content-between w-100">
				                              <h6><input type="checkbox" name="keepCd" value="${keepDTO.productCd }"> &emsp;
				                              	<img alt="" src="${contextPath }/shop/thumbnails?file=${keepDTO.productFile}" width="50" height="50">
				                              </h6>
				                              <br>
				                              <h6 >
				                              	<span>${keepDTO.productNm }</span>
				                              	<br>
				                              	<span style="text-decoration: line-through; color: gray">${keepDTO.price }원</span>
				                              	<span><fmt:formatNumber value="${keepDTO.price - keepDTO.price * keepDTO.discountRate / 100}"/>원</span>	                
				                              </h6>
				                              <small class="text-muted">판매자 : ${keepDTO.writer } </small>
				                            </div>
			                          	</a>
                                    </c:forEach>
	                      		</c:otherwise>
	                      	</c:choose>
	                     </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12" align="right">
                    <div class="shoping__cart__btns">
                        <a href="${contextPath }/shop/" class="primary-btn cart-btn">계속 쇼핑하기</a>
                        <a href="javascript:removeKeep();" class="primary-btn cart-btn">찜 취소</a>
                    </div>
                </div>
            </div>
        </div>
    </section>	

</body>
</html>