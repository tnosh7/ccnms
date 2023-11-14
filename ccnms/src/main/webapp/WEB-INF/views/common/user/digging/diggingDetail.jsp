<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<c:set var="sessionId" value="${sessionScope.userId }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  table {
    width: 100%;
    height: 500px;
  }
  #modify {
  	hide;
  }
</style>
<script>
	var writer= $("#writer").val();
	$().ready(function(){
		 $("#modifyBtn").click(function(){
			  $("#modify").show();
			  });
		
		$("#addBtn").click(function(){
			Swal.fire({
				  icon: 'info',
				  title: '로그인 후에 이용가능합니다.',
				  footer: '<a href="${contextPath }/user/loginUser">로그인 페이지로 이동하기</a>'
				})
		});
		$("#thumbsUp").click(function(){
			var diggingId = $("#diggingId").val();
			$.ajax ({
				url : "${contextPath}/digging/thumbsUp",
				type : "post",
				data : {"diggingId" : diggingId}
			});	
		});	
		$("likeBtn").click(function(){
			var writer = $("#writer").val();
			$.ajax ({
				url : "${contextPath}/digging/likeUp",
				type : "post",
				data : {"writer" : writer}
			});	
		});
		$("#delete").click(function(){
			Swal.fire({
				  title: '게시물을 삭제하시겠습니까?',
				  showCancelButton: true,
				  confirmButtonText: '삭제',
				}).then((result) => {
					if (result.isConfirmed) {
						$.ajax({
							type:"get",
							url:"${contextPath}/digging/removeDigging?diggingId=${diggingDTO.diggingId}",
							success:function(data) {
						    	Swal.fire('삭제완료!', '', 'success')
						    	history.go(-1)
							}
						});
				  	} 
				  });
				});			
		});
</script>
</head>
<body>
    <!-- Blog Details Section Begin -->
    <section class="blog-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-5 order-md-1 order-2">
                    <div class="blog__sidebar">
                        <div class="blog__sidebar__item">
                            <h4>새로운 디깅</h4>
                            <div class="blog__sidebar__recent">
                            <c:forEach var="recentDTO" items="${recentList }"> 
                                <a href="#" class="blog__sidebar__recent__item">
                                    <div class="blog__sidebar__recent__item__pic">
                                        <img src="${contextPath }/resources/bootstrap/img/blog/sidebar/sr-3.jpg" alt="">
                                    </div>
                                    <div class="blog__sidebar__recent__item__text">
                                        <h6>${recentDTO.writer }<br />${recentDTO.subject }</h6>
                                        <span>${recentDTO.enrollDT }</span>
                                    </div>
                                </a>
                            </c:forEach>
                            </div>
                        </div>
                        <div class="blog__sidebar__item">
                            <h4>Search By</h4>
                            <div class="blog__sidebar__item__tags">
                                <a href="#">Apple</a>
                                <a href="#">Beauty</a>
                                <a href="#">Vegetables</a>
                                <a href="#">Fruit</a>
                                <a href="#">Healthy Food</a>
                                <a href="#">Lifestyle</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8 col-md-7 order-md-1 order-1">
                    <div class="blog__details__text">
                    	<div>
                    			<div class="col-lg-12">
                                <div class="blog__details__author">
                                    <div class="blog__details__author__text">
                                       <table >
		                            	<thead>
		                            		<tr height="30">
		                            		<c:choose>
		                            			<c:when test="${userDTO.profile eq null }">
		                            				<th><img src="${contextPath }/resources/bootstrap/img/person.png"> ${diggingDTO.writer }
		                            				<button type="button" class="btn btn-outline-primary" >
						                              LIKE
						                              <span class="badge">${likePoint}</span>
						                            </button>
						                            <input type="hidden" value="${diggingDTO.writer }">
		                            				</th>
		                            			</c:when>
		                            			<c:otherwise>
			                            			<th><img src="${contextPath }/myPage/thumbnails?file=${userDTO.profile }" alt="프로필이미지">
			                            			${diggingDTO.writer }</th>
		                            			</c:otherwise>
		                            		</c:choose>
		                            			<td align="right"><i class="fa fa-calendar-o"></i><fmt:formatDate value="${diggingDTO.enrollDT }" pattern="yyyy-MM-dd"/></td>
		                            			<td align="right"><img src="${contextPath }/resources/bootstrap/img/show.png"/> ${diggingDTO.readCnt }</td>
		                            		</tr>
		                            		<tr height="60">
	                            				<th colspan="3">&emsp;${diggingDTO.subject }</th>
		                            		</tr>
		                            	</thead>
                            			<tbody>
		                            		<tr>
                            			<c:choose>
                            				<c:when test="${diggingDTO.file eq '' }">
	                            				<td colspan="3">${diggingDTO.content }</td>
                            				</c:when>
                            				<c:otherwise>
                            					<td colspan="3">
			                                       <img src="${contextPath }/thumbnails?file=${diggingDTO.file}" width="300" height="300">
			                                       ${diggingDTO.content }
                            					</td>
                            				</c:otherwise>
                            			</c:choose>
		                            		</tr>
                            			</tbody>
                            			<tfoot>
                            				<tr>
												<th colspan="2"><span id="thumbsUp"><img src="${contextPath }/resources/bootstrap/img/thumbs.PNG" width="30" height="30"/>${diggingDTO.thumbsUp }                        				
                            					&emsp;<img src="${contextPath }/resources/bootstrap/img/comment.png"/>
                            					 ${allReplyCnt }</span></th>
                            				</tr>
                            			</tfoot>
                            			</table>
                            			<input type="hidden" value="${diggingDTO.diggingTopic }">
                            			<input type="hidden" value="${diggingDTO.writer }">
                                    </div>
                                </div>
                            </div>
                            <c:choose>
                            	<c:when test="${diggingDTO.writer eq sessionId }">
									<span>
										<span id='modify'>
											<a href="${contextPath }/digging/modifyDigging?diggingId=${diggingDTO.diggingId}"><input type="button" value="수정"></a>
											<input type="button" id="delete" value="삭제" >
										</span>
									</span>
                            	</c:when>
                            	<c:otherwise>
                            	</c:otherwise>
                            </c:choose>
						 	<hr>
							<div align="center" >
									<div class="reply-body" style="background:whitesmoke">
									<c:forEach var="replyDTO" items="${replyList }" >
				                      <dl class="row mt-2">
				                        <dt class="col-sm-3"> ${replyDTO.writer }</dt>
				                        <dd class="col-sm-9">${replyDTO.content }</dd>
				                        <dt class="col-sm-3"><fmt:formatDate value="${replyDTO.enrollDT }" pattern="yyyy-MM-dd"/></dt>
				                      	<c:if test="${replyDTO.writer eq sessionId }">
				                      		<dd class="col-sm-9">
				                      		<span id='modify' >
												<input type="button" value="수정">
												<input type="button" id="delete" value="삭제" >
											</span>
											</dd>
				                      	</c:if>
				                      </dl>
				                      <hr>
									</c:forEach>
				                    </div>
									<form action="${contextPath }/reply/addReply">
										<br>
										<c:choose>
											<c:when test="${sessionScope.userId != null }">
											<div class="input-group">
						                        <span class="input-group-text">
						                        	${sessionScope.userId}
						                        	<input type="hidden" id="loginUserId" value="${sessionScope.userId}"/>
						                        </span>
						                        <textarea class="form-control" aria-label="With textarea" placeholder="댓글을 입력해주세요." id="content" name="content" maxlength="200"></textarea>
						                      	<input type='submit' value='작성' id='addReplyBtn'>
						                      	<input type="hidden" value="${diggingDTO.diggingId }" id="diggingId" name="diggingId"/>
												<input type="hidden" value="${sessionScope.userId }" id="writer" name="writer">
						                      </div>
											</c:when>
										<c:otherwise>
											<button type="button" class="btn rounded-pill btn-outline-success" id="addBtn" >댓글 입력</button>
										</c:otherwise>
										</c:choose>
									<div>
									</div>
								</form>
							</div>
                    	</div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>