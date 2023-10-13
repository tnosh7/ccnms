<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
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
  
</style>
<script>
	$().ready(function(){
		
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
	var recentList = document.getElementById("recentList"); 

	recentList.addEventListener("mouseover", function (event) {
	  event.target.style.color = "#fbdd97";
	}, false);


	recentList.addEventListener("mouseout", function(event){
	  event.target.style.color = "white";
	}, false)

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
		                            				<th><img src="${contextPath }/resources/bootstrap/img/person.png"> ${diggingDTO.writer }</th>
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
							<div>
								<c:choose>
									<c:when test="${digging.writer eq sessionScope.userId }" >
										<input type="button" value="수정"/>
										<input type="button" value="삭제"/>
									</c:when>
								<c:otherwise>
								</c:otherwise>	
								</c:choose>
								</div>
						 	<hr>
							<div align="center" style="padding-top: 100px">
								<form action="${contextPath }/reply/addReply">
									<br>
									<c:choose>
										<c:when test="${sessionScope.userId != null }">
										<table>
											<tr>
												<th colspan="2"><small>댓글쓴이 : ${sessionScope.userId}</small></th>
											</tr>
											<tr>
												<td><textarea rows="5" cols="60" placeholder="댓글을 입력해주세요." id="content" name="content" maxlength="200" ></textarea></td>
												<td><input type='submit' value='작성' id='addReplyBtn'></td>
											</tr>
										</table>
										<input type="hidden" value="${diggingDTO.diggingId }" id="diggingId" name="diggingId"/>
										<input type="hidden" value="${sessionScope.userId }" id="writer" name="writer">
										<br>
										<span id="addReply"></span>
										</c:when>
									<c:otherwise>
										<button type="button" class="btn rounded-pill btn-outline-success" id="addBtn" >댓글 입력</button>
									</c:otherwise>
									</c:choose>
									<br>
									<div>
									<h4>댓글 리스트 </h4>
									<table border="1">
										<c:forEach var="replyDTO" items="${replyList }" >
											<tr>
												<th colspan="2">${replyDTO.writer }</th>
												<th><fmt:formatDate value="${replyDTO.enrollDT }" pattern="yyyy-MM-dd"/></th>
											</tr>				
											<tr>
												<th colspan="2">${replyDTO.content }</th>
											</tr>
										</c:forEach>
									</table>
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