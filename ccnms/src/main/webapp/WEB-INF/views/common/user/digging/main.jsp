<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
 	a:link {color:black}
  	a:visited { color:black; }
	a:hover { color:black; }   
	a:active {color:purple;}
	ul{
   list-style:none;
   }
.head-wrap {
	position: relative;
}
.head-wrap img {
	width: 60%;
	vertical-align: middle;
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
	var diggingTopic = "";
	$().ready(function(){
		diggingTopic  = ${diggingTopic};
		
		$("#onePageViewCnt").val("${onePageViewCnt}");
	});
	
	function getDiggingList() {
		
		var url = "${contextPath }/digging/main"
		    url += "?onePageViewCnt=" + $("#onePageViewCnt").val();
		  	url += "&diggingTopic=" + $("#diggingTopic").val();
		location.href = url;
	} 
	
	function updateThumb(diggingId) {
		$.ajax({
			url: "${contextPath}/updateThumbsUp",
			type:"get",
			data: {
				"diggingId" : diggingId
			},
			success: function(data){
				$("#updateThumbs"+diggingId).html(data);
			}
		});
	}
	function changeSort() {
		var sort = $("#sort").val();
		var diggingTopic = $("#diggingTopic").val();
		var url ="${contextPath}/digging/main"
		 	url+="?sort=" + sort;
			url+="&diggingTopic=" + diggingTopic
		location.href= url;
	}
</script>
</head>
<body>
    <!-- Breadcrumb Section Begin -->
   <section align="center">
	   <div class="head-wrap" >
            <div class="head-img">
	   			<img alt="" src="${contextPath}/resources/bootstrap/img/header/${diggingTopic }.jpg" height="150" width="100%">
	   			     <div class="col-lg-12 head-text">
	   			     <h1 style="color:white">${diggingTopic }</h1>
                </div>
	  		 </div>
	   </div>
   </section>
    <!-- Blog Section Begin -->
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-5">
                    <div class="blog__sidebar">
                        <div class="blog__sidebar__search">
                        </div>
                        <div class="blog__sidebar__item" >
                        	<div class="blog__sidebar__item">
                            	<h4><img alt="" src="${contextPath}/resources/bootstrap/img/icon/user.PNG" height="40" width="40"> DIGGING</h4>
	                            <ul>
	                                <li><a href="#">전체</a></li>
	                                <li><a href="#"></a></li>
	                                <li><a href="#"></a></li>
	                                <li><a href="#">Life Style (9)</a></li>
	                                <li><a href="#">Travel (10)</a></li>
	                            </ul>
                       		 </div>
                            <h4><img alt="" src="${contextPath}/resources/bootstrap/img/hot.png"> 인기 게시물</h4>
                            <br>
                            <div class="blog__sidebar__recent">
                            	<c:forEach var="diggingDTO" items="${populerList }">
                                    <div class="digging__sidebar__populer__List__file">
                                    <c:choose>
                                    	<c:when test="${diggingDTO.file != ''}">
                                        	<img src="${contextPath}/thumbnails?file=${diggingDTO.file}" alt="" width="50" height="50">
                                    	</c:when>
                                    </c:choose>
                                    </div>
                                    <div class="digging__sidebar__populer__text">
	                                        ${diggingDTO.writer}<span><fmt:formatDate value="${diggingDTO.enrollDT }" pattern="yyyy-MM-dd"/></span>
                                        <a href="${contextPath }/digging/diggingDetail?diggingId=${diggingDTO.diggingId}">
	                                        <h5>${diggingDTO.subject }</h5>
                                        </a>
                                    </div>
                                <hr>
                            	</c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8 col-md-7">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12">
			               <div class="card border-light mb-3" >
							  <div class="card-header" style="background:white">
				                <ul style="list-style:none;">
				                	<li style="float: left;">
					                    <select id="sort" onchange="changeSort()">
					                    	<option value="readCnt">인기많은순</option>
					                    	<option value="thumbsUp">추천순</option>
					                    	<option value="recent">최신순</option>
					                    </select>
				                	</li>
				                </ul>
				                <div align="right">
			                	<ul> 
			                   		<li style="float: left;"> 
										<select id="onePageViewCnt" onchange="getDiggingList()" >
											<option>5</option>
											<option>7</option>
											<option>10</option>
										</select>
			                   		</li>
		                    	</ul>
				                </div>	
							  </div>
							</div>
							<c:choose>
								<c:when test="${empty diggingList }">
								<div align="center">
									<p>등록된 게시글이 없습니다.</p>
								</div>
								</c:when>
							</c:choose>
							<c:forEach var="diggingDTO" items="${diggingList }">
							<c:set var="startDiggingIdx" value="${startDiggingIdx = startDiggingIdx + 1}"/>
                 				<div class="card mb-3" style="background:whitesmoke">
								  <div class="card-body">
									<span>${startDiggingIdx }. </span>
                 					 <h5 align="center"><a href="${contextPath }/digging/diggingDetail?diggingId=${diggingDTO.diggingId}"><strong>${diggingDTO.subject }</strong></a></h5>
									  <hr>
									  <c:choose>
	                           			<c:when test="${diggingDTO.profile eq null }">
	                           				<span><img src="${contextPath }/resources/bootstrap/img/person.png"> ${diggingDTO.writer }
	                           				</span>
	                           				<span>&emsp;<i class="fa fa-calendar-o"></i> <fmt:formatDate value="${diggingDTO.enrollDT }" pattern="yyyy-MM-dd"/></span>
	                           			</c:when>
	                           			<c:otherwise>
	                            			<span><img src="${contextPath }/thumbnails?file=${diggingDTO.profile }" alt="프로필이미지" width="40" height="40">
	                            			</span>
	                           				<span>&emsp;<i class="fa fa-calendar-o"></i> <fmt:formatDate value="${diggingDTO.enrollDT }" pattern="yyyy-MM-dd"/></span>
	                           			</c:otherwise>
                           			 </c:choose>
								  </div>
								  <div class="card-body">
								    <p class="card-text"><a href="${contextPath }/digging/diggingDetail?diggingId=${diggingDTO.diggingId}">${diggingDTO.content }</a></p>
								  </div>
								  <div class="card-footer" style="background:white">
								    &emsp;<a href="javascript:updateThumb(${diggingDTO.diggingId })" class="card-link"><img alt="" src="${contextPath }/resources/bootstrap/img/thumbs.PNG" width="40" height="40" id="thumbsUp"/>
								    	<span id="updateThumbs${diggingDTO.diggingId }">${diggingDTO.thumbsUp }</span></a>
								    &emsp;&emsp;<a href="#" class="card-link"><img alt="" src="${contextPath }/resources/bootstrap/img/comment.png"/> ${diggingDTO.replyCnt }</a>
								    &emsp;&emsp;<a href="#" class="card-link"><img alt="" src="${contextPath }/resources/bootstrap/img/show.png"/> ${diggingDTO.readCnt }</a>
								   <input type="hidden" value="${diggingDTO.diggingId }"/>
								   <input type="hidden" id="diggingTopic" value="${diggingDTO.diggingTopic }"/>
								  </div>
								</div>
                      	 </c:forEach>
						</div>		       
						<br>
                        <div class="product__pagination blog__pagination" align="center">
					        <c:if test="${startPage > 10 }">
						        <a href="${contextPath }/digging/main?currentPageNumber=${startPage - 10}&onePageViewCnt=${onePageViewCnt}"><i class="fa fa-long-arrow-left"></i>이전</a>
					        </c:if>
					        <c:forEach var="i" begin="${startPage }" end="${endPage }">
					       		<a href="${contextPath }/digging/main?currentPageNumber=${i}&onePageViewCnt=${onePageViewCnt}">${i }</a>
					        </c:forEach>
					        <c:if test="${endPage != allPageCnt && endPage >= 10 }">
					        	<a href="${contextPath }/digging/main?currentPageNumber=${startPage + 10}&onePageViewCnt=${onePageViewCnt}"><i class="fa fa-long-arrow-right"></i>다음</a>
					        </c:if>
						</div>        
                    </div>
                </div>
            </div>
        </div>
    <!-- Blog Section End -->

</body>
</html>