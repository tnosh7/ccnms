<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function selectAllDigging(){
		if ($("#allChoice").prop("checked")) {
			$("[name='diggingId']").prop("checked", true);
		}
		else {
			$("[name='diggingId']").prop("checked", false);
		}
	}
	function removeLog(){
		var diggingIdList ="";
		$("input[name='diggingId']:checked").each(function(){
			diggingIdList += $(this).val() + ",";
		});
		console.log(diggingIdList);
		location.href= "${contextPath}/myPage/removeDigging?diggingIdList=" + diggingIdList;
	}
</script>
<style>
	table {
    width: 100%;
    height: 500px;
  }
</style>
</head>
<body>
<section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-5 order-md-1 order-2">
                    <div class="blog__sidebar">
                        <div class="blog__sidebar__item">
                            <h4>Categories</h4>
                            <ul>
                                <li><a href="${contextPath }/myPage/main"><strong>내프로필</strong></a></li>
                                <li><a href="${contextPath }/myPage/myLog?userId=${userDTO.userId}"><strong>이력관리</strong></a></li>
                                <li><a href="#"><strong>설정</strong></a></li>
                            </ul>
                        </div>
                        <hr>
                        <div class="blog__sidebar__item">
                            <h4>고객센터</h4>
                             <ul>
                                <li><a href="#"> 문의메시지</a></li>
                                  <li><a href="${contextPath }/myPage/authenticationUser?userId=${userDTO.userId }&menu=delete"> 탈퇴</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8 col-md-9 order-md-1 order-1" align="center">
        <div class="container">
            <div class="row">
                    <div class="blog__details__text">
                    <c:choose>
                    <c:when test="${diggingList eq null }">
						<table>
							<tr>
								<th colspan="5">이력이 없습니다.</th>
							</tr>
						</table>
                    </c:when>
                    <c:otherwise>
                    <h5>디깅 목록</h5>
                        <table border="1">
                            <thead align="center" border="1">
                                <tr>
                                    <th width="10%"><input type="checkbox" id="allChoice" onchange="selectAllDigging()"></th>
                                    <th class="shoping__product" width="50%">제목</th>
                                    <th width="30%">날짜</th>
                                    <th width="10%">추천</th>
                                </tr>
                            </thead>
                            <c:forEach var="diggingDTO" items="${diggingList }">
                            <tbody align="center" width="100%">
                                <tr>
                                    <td class="shoping__cart__item__close">
                                        <input type="checkbox" name="diggingId" value="${diggingDTO.diggingId }">
                                    </td>
                                    <td class="shoping__cart__item" >
                                        <strong>${diggingDTO.subject }</strong>
                                    </td>
                                    <td class="shoping__cart__price">
                                      <fmt:formatDate value="${diggingDTO.enrollDT }" pattern="yyyy-MM-dd"/>
                                    </td>
                                    <td class="shoping__cart__item" >
                                    	${diggingDTO.thumbsUp }
                                    </td>
                                </tr>
                            </tbody>
                            </c:forEach>
                        </table>
                    </c:otherwise>
                    </c:choose>
                    </div>
                </div>
                <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <input type="button" class="primary-btn cart-btn cart-btn-right" onclick="removeLog()" value="삭제">
                   		<input type="hidden" value="${sessionScope.userId }"/>
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