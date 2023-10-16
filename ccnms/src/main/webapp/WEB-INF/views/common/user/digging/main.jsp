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
  	a {color:black}
  	a:visited { color:black; }
	a:hover { color:purple; }   

</style>
<script>

	$().ready(function(){
		$("#onePageViewCnt").val("${onePageViewCnt}");
		$("#search").val("${search}");
		
		$("#thumbsUp").click(function(){
			var diggingId = $("#diggingId").val();
			$.ajax ({
				url : "${contextPath}/thumbsUp",
				type : "post",
				data : {"diggingId" : diggingId},
				success : function(data){
					
					updatethumbsUp();
				}
			});	
		});
		
	});
	
	function updatethumbsUp(){
			
			var thumbsUp = document.getElementById("thumbsUp").value;
			thumbsUp += 1;
			document.getElementById("thumbsUp").innerHTML = thumbsUp;
			return;
	}
		 
	function getDiggingList() {
		
		var url = "${contextPath }/digging/main"
		    url += "?onePageViewCnt=" + $("#onePageViewCnt").val();
		  	url += "&search=" + $("#search").val();
		  	url += "&diggingTopic" + $("#diggingTopic").val();
		location.href = url;
	} 
</script>
</head>
<body>
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="${contextPath}/resources/bootstrap/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Blog</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Home</a>
                            <span>Blog</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Blog Section Begin -->
    <section class="blog spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-5">
                    <div class="blog__sidebar">
                        <div class="blog__sidebar__search">
                        </div>
                        <div class="blog__sidebar__item" style="background:ghostwhite">
                            <strong>인기많은 게시물</strong>
                            <br>
                            <br>
                            <div class="blog__sidebar__recent">
                            	<c:forEach var="diggingDTO" items="${populerList }">
                                <a href="#" class="digging__sidebar__populer__List">
                                    <div class="digging__sidebar__populer__List__file">
                                    <c:choose>
                                    	<c:when test="${diggingDTO.file != ''}">
                                        	<img src="${contextPath}/digging//thumbnails?file=${diggingDTO.file}" alt="" width="50" height="50">
                                    	</c:when>
                                    </c:choose>
                                    </div>
                                    <div class="digging__sidebar__populer__text">
                                        <h6>${diggingDTO.writer}<br />${diggingDTO.subject } </h6>
                                        <span>${diggingDTO.enrollDT }</span>
                                    </div>
                                </a>
                                <br>
                            	</c:forEach>
                            </div>
                        </div>
                        <div class="blog__sidebar__item">
                            <h4>관련 태그</h4>
                            <div class="blog__sidebar__item__tags">
                     			 <button type="button" class="btn btn-outline-info">연예</button>	
                     			 <button type="button" class="btn btn-outline-info">게임</button>	
                     			 <button type="button" class="btn btn-outline-info">비즈니스</button>	
                     			 <button type="button" class="btn btn-outline-info">만화</button>	
                     			 <button type="button" class="btn btn-outline-info">OTT</button>	
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8 col-md-7">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12">
			               <div class="card border-light mb-3" >
							  <div class="card-header" style="background:white">
				                <ul>
				                	<li>
					                    <select>
					                    	<option>인기순</option>
					                    	<option>댓글순</option>
					                    	<option>최신순</option>
					                    </select>
				                	</li>
				                </ul>	
			                	<ul id="onePageViewCnt"> 
			                   		<li> 
										<select id="onePageViewCnt" onchange="getDiggingList()" >
											<option>5</option>
											<option>7</option>
											<option selected>10</option>
										</select>
			                   		</li>
		                    	</ul>
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
                 				<div class="card mb-3" style="background:whitesmoke">
								  <div class="card-body">
                 					 <h5 align="center"><a href="${contextPath }/digging/diggingDetail?diggingId=${diggingDTO.diggingId}">${diggingDTO.subject }</a></h5>
									  <hr>
									  <h6 class="card-title">${diggingDTO.writer }
									 	&emsp;<i class="fa fa-calendar-o"></i><fmt:formatDate value="${diggingDTO.enrollDT }" pattern="yyyy-MM-dd"/>
									  </h6>
								  </div>
								  <div class="card-body">
								    <p class="card-text"><a href="${contextPath }/digging/diggingDetail?diggingId=${diggingDTO.diggingId}">${diggingDTO.content }</a></p>
								  </div>
								  <div class="card-footer" style="background:white">
								    &emsp;<a href="#" class="card-link"><img alt="" src="${contextPath }/resources/bootstrap/img/thumbs.PNG" width="40" height="40" id="thumbsUp" value="${diggingDTO.diggingId }"/>${diggingDTO.thumbsUp }</a>
								    &emsp;&emsp;<a href="#" class="card-link"><img alt="" src="${contextPath }/resources/bootstrap/img/comment.png"/> ${diggingDTO.replyCnt }</a>
								    &emsp;&emsp;<a href="#" class="card-link"><img alt="" src="${contextPath }/resources/bootstrap/img/show.png"/> ${diggingDTO.readCnt }</a>
								   <input type="hidden" value="${diggingDTO.diggingId }"/>
								   <input type="hidden" id="diggingTopic" value="${diggingDTO.diggingTopic }"/>
								  </div>
								</div>
                      	 </c:forEach>
						</div>		               
                         <div class="product__pagination blog__pagination" align="center">
					        <c:if test="${startPage > 10 }">
						        <a href="${contextPath }/digging/main?currentPageNumber=${startPage - 10}&onePageViewCnt=${onePageViewCnt}&search=${search}"><i class="fa fa-long-arrow-left"></i></a>
					        </c:if>
					        <c:forEach var="i" begin="${startPage }" end="${endPage -1 }">
					        <a href="${contextPath }/digging/main?currentPageNumber=${i}&onePageViewCnt=${onePageViewCnt}&search=${search}">${i }</a>
					        </c:forEach>
					        <c:if test="${endPage != allPageCnt && endPage >= 10 }">
					        	<a href="${contextPath }/digging/main?currentPageNumber=${startPage + 10}&onePageViewCnt=${onePageViewCnt}&search=${search}"><i class="fa fa-long-arrow-right"></i></a>
					        </c:if>
					     </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Section End -->

</body>
</html>