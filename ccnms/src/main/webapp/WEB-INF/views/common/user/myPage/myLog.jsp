<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<c:set var="sessionId" value="${sessionScope.userId }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.table{
       table-layout:fixed;
       width: 100%;
     }
</style>
<script>
	function selectAllDigging(){
		if ($("#allDiggingChoice").prop("checked")) {
			$("[name='diggingId']").prop("checked", true);
		}
		else {
			$("[name='diggingId']").prop("checked", false);
		}
	}
	function selectAllReply(){
		if ($("#allReplyChoice").prop("checked")) {
			$("[name='replyId']").prop("checked", true);
		}
		else {
			$("[name='replyId']").prop("checked", false);
		}
	}
	function removeDigging(){
		var diggingIdList ="";
		if ($("input[name='diggingId']:checked")) {
			$("input[name='diggingId']:checked").each(function(){
				diggingIdList += $(this).val() + ",";
				location.href= "${contextPath}/myPage/removeDigging?diggingIdList=" + diggingIdList;
			});
		}	
	}
	function removeReply(){
		var replyIdList = "";
		if ($("input[name='replyId']:checked")) {
			$("input[name='replyId']:checked").each(function(){
				replyIdList += $(this).val() + ",";
				location.href= "${contextPath}/myPage/removeReply?replyIdList=" + replyIdList;
			});
		}
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
                                <li><a href="${contextPath }/myPage/main?userId=${sessionId}"><strong>내프로필</strong></a></li>
                                <li><a href="${contextPath }/myPage/myLog?userId=${sessionId}"><strong>이력관리</strong></a></li>
                            </ul>
                        </div>
                        <hr>
                        <div class="blog__sidebar__item">
                            <h4>고객센터</h4>
                             <ul>
                                <li><a href="${contextPath }/myPage/myContact"> 문의메시지</a></li>
                                  <li><a href="${contextPath }/myPage/authenticationUser?userId=${sessionId}&menu=delete"> 탈퇴</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8 col-md-7 order-md-1 order-1" align="center">
                      <div class="product__details__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                                    aria-selected="true">디깅 목록</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
                                    aria-selected="false">댓글 목록</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__tab__desc">
                                     <div class="container">
			            <div class="row">
			               <div class="card">
			                <div class="table-responsive text-nowrap">
			                  <table class="table">
			                    <thead class="table-light" align="center">
			                      <tr>
			                        <th style="width:5%"><input type="checkbox" id="allDiggingChoice" onchange="selectAllDigging()"></th>
			                        <th style="width:65%">내용</th>
			                        <th style="width:20%">날짜</th>
			                        <th style="width:10%">추천수</th>
			                      </tr>
			                    </thead>
			                    <tbody class="table-border-bottom-0">
			                    	<c:choose>
			                    		<c:when test="${empty diggingList }">
			                    			<tr>
			                    				<th colspan="5">등록된 게시물이 없습니다.</th>
			                    			</tr>
			                    		</c:when>
			                    		<c:otherwise>
					                       <c:forEach var="diggingDTO" items="${diggingList }">
					                            <tbody align="center" >
					                                <tr>
					                                    <td class="shoping__cart__item__close" >
					                                        <input type="checkbox" name="diggingId" value="${diggingDTO.diggingId }">
					                                    </td>
					                                    <td class="shoping__cart__item" >
					                                        <strong><a href="${contextPath }/digging/diggingDetail?diggingId=${diggingDTO.diggingId}">${diggingDTO.subject }</a></strong>
					                                    </td>
					                                    <td class="shoping__cart__price">
					                                       <fmt:formatDate value="${diggingDTO.enrollDT }" pattern="yyyy-MM-dd"/>
					                                    </td>
					                                    <td class="shoping__cart__item" style="width:10%" >
					                                    	${diggingDTO.thumbsUp }
					                                    </td>
					                                </tr>
					                            </tbody>
					                        </c:forEach>
			                    		</c:otherwise>
			                    	</c:choose>
			                    </tbody>
		                    </table>
                    	<hr>
                    	  <div class="col-lg-12">
	                    <div class="shoping__cart__btns">
	                        <input type="button" class="primary-btn cart-btn cart-btn-center" onclick="removeDigging()" value="삭제">
	                    </div>
	                </div>
                    	</div>
                    	</div>
                    	</div>
                    	</div>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-2" role="tabpanel">
                                <div class="product__details__tab__desc">
					            <div class="row">
					               <div class="card">
					                <div class="table-responsive text-nowrap">
					                  <table class="table">
					                    <thead class="table-light" align="center">
					                      <tr>
					                        <th style="width:5%"><input type="checkbox" id="allReplyChoice" onchange="selectAllReply()"></th>
					                        <th style="width:65%">내용</th>
					                        <th style="width:20%">날짜</th>
					                        <th style="width:10%">추천수</th>
					                      </tr>
					                    </thead>
					                    <tbody class="table-border-bottom-0" align="center">
					                    	<c:choose>
					                    		<c:when test="${empty replyList }">
					                    			<tr>
					                    				<th colspan="5">등록된 댓글이 없습니다.</th>
					                    			</tr>
					                    		</c:when>
					                    		<c:otherwise>
							                        <c:forEach var="replyDTO" items="${replyList}">
							                            <tbody align="center">
							                                <tr>
							                                    <td class="shoping__cart__item__close">
							                                         <input type="checkbox" name="replyId" value="${replyDTO.replyId }">
							                                    </td>
							                                    <td class="shoping__cart__item" >
							                                         <strong><a href="${contextPath }/digging/diggingDetail?diggingId=${replyDTO.diggingId}">${replyDTO.content}</a></strong>
							                                    </td>
							                                    <td class="shoping__cart__price">
							                                      <fmt:formatDate value="${replyDTO.enrollDT }" pattern="yyyy-MM-dd"/>
							                                    </td>
							                                    <td class="shoping__cart__item" >
							                                    	${replyDTO.thumbsUp }
							                                    </td>
							                                </tr>
							                            </tbody>
							                        </c:forEach>
					                    		</c:otherwise>
					                    	</c:choose>
					                    </tbody>
				                    </table>
		                    	<hr>
			                <div class="col-lg-12">
			                    <div class="shoping__cart__btns">
			                        <input type="button" class="primary-btn cart-btn cart-btn-center" onclick="removeReply()" value="삭제">
			                    </div>
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