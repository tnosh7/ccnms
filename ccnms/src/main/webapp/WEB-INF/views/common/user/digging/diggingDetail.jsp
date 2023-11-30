<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<c:set var="sessionId" value="${sessionScope.userId }"/>
<c:set var="adminId" value="${sessionScope.adminId }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	a:link {color:black}
  	a:visited { color:black; }
	a:hover { color:black; }   
	a:active {color:purple;}
	  table {
	    width: 100%;
	    height:100%;
	  }
	  #modify {
	  	hide;
	  }
	.video-container { 
	    margin: 10;
	    padding-bottom: 100%; 
	    max-width: 100%; 
	    height:100%;  
	    position: relative;
	    overflow: hidden;
	} 
	.video-container iframe, 
	.video-container object,
	.video-container embed {
	    margin: 0;
	    padding: 0;  
	    width: 100%; 
	    height: 100%;
	    position: absolute; 
	    top: 0; 
	    left: 0; 
}
	.head-wrap {
		position: relative;
	}
	.head-text {
		padding: 5px 10px;
		text-align: center;
		position: absolute;
		color:white;
		top: 50%;
		left: 50%;
		transform: translate( -50%, -50% );
	}
</style>
<script>
	var writer= $("#writer").val();
	$().ready(function(){
		 $("#modifyBtn").click(function(){
			  $("#modify").show();
		 })
		
		$("#addBtn").click(function(){
			Swal.fire({
				  icon: 'info',
				  title: '로그인 후에 이용가능합니다.',
				  footer: '<a href="${contextPath }/user/loginUser">로그인 페이지로 이동하기</a>'
				})
		});
	});
	function updateThumb(diggingId) {
		if ("${sessionId == null}" == "true") {
			Swal.fire({
				  icon: 'info',
				  title: '로그인 후에 이용가능합니다.',
				  footer: '<a href="${contextPath }/user/loginUser">로그인 페이지로 이동하기</a>'
				})
		}
		else {
			$.ajax({
				url: "${contextPath}/updateThumbsUp",
				type:"get",
				data: {
					"diggingId" : diggingId
				},
				success: function(data){
					$("#updateThumbs").html(data);
				}
			});
		}
	}
	function updateLike(writer){
		var diggingId = $("#diggingId").val();
		var writer ="";
		writer = $("[name='writer']").val();
		if ("${sessionId == null}" == "true") {
			Swal.fire({
				  icon: 'info',
				  title: '로그인 후에 이용가능합니다.',
				  footer: '<a href="${contextPath }/user/loginUser">로그인 페이지로 이동하기</a>'
				})
		}
		else {
			$.ajax({
				url:"${contextPath}/user/updateLike",
				type:"get",
				data:{
					"writer" : writer,
					"diggingId" : diggingId
				},
				success:function(result){
						Swal.fire({
							  text: 'LIKE!'
						})
				}
			})
		}
	}
	function removeReply(){
		var replyId = $("#replyId").val();
		var diggingId = $("#diggingId").val();
		location.href="${contextPath}/reply/removeReply?replyId=" + replyId + "&diggingId=" + diggingId;
	}
	
</script>
</head>
<body>
    <!-- Blog Details Section Begin -->
        <div class="container">
                <div class="col-lg-12 col-md-12 order-md-1 order-1">
                    <div class="blog__details__text">
                    	<div>
						   <div class="head-wrap" >
					            <div class="head-img">
						   			<img alt="" src="${contextPath}/resources/bootstrap/img/header/${diggingDTO.diggingTopic}.jpg" height="150" width="100%">
						   			    <div class="col-lg-12 head-text">
						   			     	<a href="${contextPath }/digging/main?diggingTopic=${diggingDTO.diggingTopic}">
							   			     <h1 style="color:white">${diggingDTO.diggingTopic}</h1>
						   			     	</a>
					                	</div>
						  		 </div>
						  	</div>	 
                   			<div class="col-lg-12">
                               <div class="blog__details__author">
                                   <div class="blog__details__author__text">
                                      <table >
		                            	<thead>
		                            		<tr height="30">
		                            		<c:choose>
		                            			<c:when test="${diggingDTO.profile eq null }">
		                            				<th><img src="${contextPath}/resources/bootstrap/img/icon/profile.jpg"  width="40" height="40"> ${diggingDTO.writer }
			                            				&emsp;<button type="button" class="btn btn-primary btn-sm" id="writer" onclick="updateLike()">LIKE </button>
							                            <input type="hidden" name=" writer" value="${diggingDTO.writer }">
		                            				</th>
		                            			</c:when>
		                            			<c:otherwise>
			                            			<th align="left"><img src="${contextPath }/thumbnails?file=${diggingDTO.profile }" alt="프로필이미지" width="40" height="40">
			                            				<strong>&emsp;${diggingDTO.writer }</strong>
			                            				&emsp;<button type="button" class="btn btn-primary btn-sm" id="writer" onclick="updateLike()">LIKE</button>
							                            <input type="hidden" name=" writer" value="${diggingDTO.writer }">
			                            			</th>
		                            			</c:otherwise>
		                            		</c:choose>
		                            			<td align="right"><i class="fa fa-calendar-o"></i>&emsp;<fmt:formatDate value="${diggingDTO.enrollDT }" pattern="yyyy-MM-dd"/></td>
		                            		</tr>
		                            		<tr height="80">
	                            				<th colspan="3">제목 : &emsp;<span>${diggingDTO.subject }</span></th>
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
					                                       <img src="${contextPath }/thumbnails?file=${diggingDTO.file}">
					                                       ${diggingDTO.content }
			                           					</td>
			                           				</c:otherwise>
			                           			</c:choose>
		                            		</tr>
	                            			<c:if test="${diggingDTO.videoYn eq 'Y'}">
		                            			<tr align="center">
		                            				<td colspan="3">
			                            				<div class="video-container">
														    <iframe src="https://www.youtube.com/embed/${diggingDTO.videoId }"
														         style="position: absolute; width: 80%; height: 80%; top: 0; left: 0;" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen>
														    </iframe>
														</div>
		                            				</td>
												</tr>
	                            			</c:if>
	                           			</tbody>
                           			<tfoot>
                           				<tr>
											<th colspan="2">
												<span>
													<a href="javascript:updateThumb(${diggingDTO.diggingId })" class="card-link">
													<img alt="" src="${contextPath }/resources/bootstrap/img/thumbs.PNG" width="40" height="40" id="thumbsUp"/>
									    			<span id="updateThumbs">${diggingDTO.thumbsUp }</span></a>
	                           						&emsp;<img src="${contextPath }/resources/bootstrap/img/comment.png"/>
	                           					 		${allReplyCnt }
	                           					 	&emsp;<img src="${contextPath }/resources/bootstrap/img/show.png"/> 
	                           					 		${diggingDTO.readCnt }
                           					 	</span>
                           					 </th>
                           				</tr>
                           			</tfoot>
                           			</table>
                           			<input type="hidden" value="${diggingDTO.diggingTopic }">
                           			<input type="hidden" value="${diggingDTO.writer }">
                                   </div>
                               </div>
                           </div>
                           	<c:if test="${diggingDTO.writer eq sessionId }">
								<span>
									<span id='modify'>
										<a href="${contextPath }/digging/modifyDigging?diggingId=${diggingDTO.diggingId}"><input type="button" value="수정"></a>
									</span>
								</span>
                           	</c:if>
                           	<c:if test="${adminId != null}">
                        		<span>
									<span id='modify'>
										<a href="${contextPath }/digging/modifyDigging?diggingId=${diggingDTO.diggingId}"><input type="button" value="수정"></a>
									</span>
								</span>
                           	</c:if>
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
			                      			<button type="button" class="btn btn-light" id="replyId" value="${replyDTO.replyId }" onclick="removeReply()">삭제</button>
										</span>
										</dd>
			                      	</c:if>
			                      	<c:if test="${adminId != null}">
			                      		<dd class="col-sm-9">
			                      		<span id='modify' >
			                      			<button type="button" class="btn btn-light" id="replyId" value="${replyDTO.replyId }" onclick="removeReply()">삭제</button>
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
										<c:when test="${adminId != null}">
		                        			<div class="input-group">
						                        <span class="input-group-text">
						                        	ModuDigging
						                        	<input type="hidden" id="loginUserId" value="ModuDigging"/>
						                        </span>
						                        <textarea class="form-control" aria-label="With textarea" placeholder="댓글을 입력해주세요." id="content" name="content" maxlength="200"></textarea>
						                      	<input type='submit' value='작성' id='addReplyBtn'>
						                      	<input type="hidden" value="${diggingDTO.diggingId }" id="diggingId" name="diggingId"/>
												<input type="hidden" value="ModuDigging" id="writer" name="writer">
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
</body>
</html>