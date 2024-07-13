<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${contextPath}/resources/css/shop.css" rel="stylesheet">
<script src="${contextPath}/resources/js/shop.js"></script>
<script>
	function selectAllQna(){
		if ($("#allQna").prop("checked")){
			$("[name='qnaCd']").prop("checked", true);
		}
		else {
			$("[name='qnaCd']").prop("checked", false);
		}
	}

	function removeQna(){
		var removeQnaList= "";
		var updateQnaCntList = "";
		if($("input[name='qnaCd']:checked")) {
			$("input[name='qnaCd']:checked").each(function(){
				var qnaCd = $(this).val();
				var productCd = $("#productCd" +qnaCd).val();
				removeQnaList 		+= $(this).val() + ",";
				updateQnaCntList 	+= productCd + ",";
			});
			
			var url = "${contextPath}/qna/removeQna";
				url += "?removeQnaList=" 	+ removeQnaList;
				url += "&updateQnaCntList=" + updateQnaCntList;
				
			location.href=url;
		}
		else return;
	}
</script>
</head>
<body>
 <fieldset>

	 <div class="breadcrumb-option">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-12">
	                    <div class="breadcrumb__links">
	                        <a href="${contextPath }/"><i class="fa fa-home"></i> Home > </a>
	                        <span><a href="${contextPath }/myShop/saleList">내 상점 > </a></span>
	                        <span> Q&A확인 </span>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	    <section>
	     <div class="container">
            <div class="row">
		   <div class="col-lg-12">
             <div class="product__details__tab">
                 <ul class="nav nav-tabs" role="tablist">
                     <li class="nav-item">
                         <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                             aria-selected="true">내 Q&A</a>
                     </li>
                     <li class="nav-item">
                         <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
                             aria-selected="false">등록된 Q&A<span></span></a>
                     </li>
                 </ul>
                 <div class="tab-content">
                     <div class="tab-pane active" id="tabs-1" role="tabpanel">
                         <div class="product__details__tab__desc">
                         	 <table class="table">
			                  <thead>
			                    <tr>
                        		  <th>
	                        		 <input type="checkbox" id="allQna" onchange="selectAllQna()">
								  </th>
			                      <th>답변상태</th>
			                      <th>작성자</th>
			                      <th>내용</th>
			                      <th>답변 내용</th>
			                      <th>작성일</th>
			                    </tr>
			                  </thead>
			                  <c:forEach var="myQna" items="${myQnaList }" >
				                 <tbody>
					                 <c:choose>
					                 	<c:when test="${empty myQnaList}">
						                  	<tr>
						                  		<td colspan="6">
													문의한 Q&A가 없습니다.				                  		
						                  		</td>
						                  	</tr>
					                 	</c:when>
			                         	<c:otherwise>
			                         		<tr>
               							        <td>
               							       	 <input type="checkbox" name="qnaCd" value="${myQna.qnaCd}">
               							       	 <input type="hidden" id="productCd${myQna.qnaCd }" value="${myQna.productCd }">
               							       </td>
			                         			<td>
			                         				<c:if test="${myQna.qnaYn eq 'F'}">
						                         		답변 중		
			                         				</c:if>
			                         				<c:if test="${myQna.qnaYn eq 'Y'}">
						                         		답변 완료		
			                         				</c:if>
			                         			</td>
			                         			<td>${myQna.writer }</td>
			                         			<td>${myQna.content }</td>
			                         			<td>${myQna.qnaReply }</td>
			                         			<td><fmt:formatDate value="${myQna.enrollDt }" pattern="yyyy-MM-dd"/></td>
			                         		</tr>
			                         	</c:otherwise>
			                         </c:choose>
		                         </tbody>
			                  </c:forEach>
                         	 </table> 
                         	 <br>
                         	 <br>
			                 	 <div align="center">
				                 	  <span>
					                  	<button type="button" class="btn btn-danger" onclick="removeQna();">삭제</button>
				                 	 </span>
				                 </div>
			                 <br>
                         </div>
                     </div>
                      <br>
				      <br>
                     <div class="tab-pane" id="tabs-3" role="tabpanel">
                         <div class="product__details__tab__desc">
                            <div class="card">
				              <div class="table-responsive text-nowrap">
				                <table class="table">
				                  <thead>
				                    <tr>
				                      <th>상품 이름</th>
				                      <th>내용</th>
				                      <th>작성자</th>
				                      <th>답변상태</th>
				                      <th>답변</th>
				                      <th>작성일</th>
				                    </tr>
				                  </thead>
				                  <tbody >
				                  <c:forEach var="qnaDTO" items="${qnaList}">
				                  <c:choose>
				                  	<c:when test="${empty qnaList}">
				                  		<tr>
					                  		<td colspan="6">
												등록된 Q&A가 없습니다.				                  		
					                  		</td>
				                  		</tr>
				                  	</c:when>
				                  	<c:otherwise>
										<tr>
											<td>${qnaDTO.productNm}</td>
											<td>${qnaDTO.content }</td>
											<td>${qnaDTO.writer }</td>
												<c:if test="${qnaDTO.qnaYn eq 'F'}">
													<td>
						                         		답변 중		
													</td>
													<td>
														<form action="${contextPath }/qna/replyQna" method="get">
															<textarea rows="5" cols="70" name="qnaReply" maxlength="300">
															</textarea>
															<input type="hidden" name="qnaCd" value="${qnaDTO.qnaCd }">
															<input type="submit" value="등록">
														</form>
													</td>
		                         				</c:if>
		                         				<c:if test="${qnaDTO.qnaYn eq 'Y'}">
					                         		<td>
					                         			답변 완료
					                         		</td>
					                         		<td>
					                         			${qnaDTO.qnaReply }
					                         		</td>		
		                         				</c:if>
											<td><fmt:formatDate value="${qnaDTO.enrollDt }" pattern="yyyy-MM-dd"/></td>
										</tr>				                      
				                  	</c:otherwise>
				                  </c:choose>
				                 </c:forEach>
				                 </tbody>
				                 </table>
				                 <br><br>
			                 </div>
		                 </div>
	                 </div>
                 </div>
                </div>
               </div>
              </div>
              </div>
              </div>
	    </section>
	    </fieldset> 
</body>
</html>