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
	ul {
	    list-style:none;
	    margin:0;
	    padding:0;
	}
	
	li {
	    margin: 0 0 0 0;
	    padding: 0 0 0 0;
	    border : 0;
	    float: left;
	}
	table {
    width: 100%;
    height: 500px;
  }
</style>
<script>wC	$().ready(function(){
		
	});
	

nt = $("[name='onePageViewCnt']").val();

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
                        <div class="blog__sidebar__item">
                            <h4>인기많은 게시물</h4>
                            <div class="blog__sidebar__recent">
                                <a href="#" class="blog__sidebar__recent__item">
                                    <div class="blog__sidebar__recent__item__pic">
                                        <img src="${contextPath}/resources/bootstrap/img/blog/sidebar/sr-1.jpg" alt="">
                                    </div>
                                    <div class="blog__sidebar__recent__item__text">
                                        <h6>09 Kinds Of Vegetables<br /> Protect The Liver</h6>
                                        <span>MAR 05, 2019</span>
                                    </div>
                                </a>
                                <a href="#" class="blog__sidebar__recent__item">
                                    <div class="blog__sidebar__recent__item__pic">
                                        <img src="${contextPath}/resources/bootstrap/img/blog/sidebar/sr-2.jpg" alt="">
                                    </div>
                                    <div class="blog__sidebar__recent__item__text">
                                        <h6>Tips You To Balance<br /> Nutrition Meal Day</h6>
                                        <span>MAR 05, 2019</span>
                                    </div>
                                </a>
                                <a href="#" class="blog__sidebar__recent__item">
                                    <div class="blog__sidebar__recent__item__pic">
                                        <img src="${contextPath}/resources/bootstrap/img/blog/sidebar/sr-3.jpg" alt="">
                                    </div>
                                    <div class="blog__sidebar__recent__item__text">
                                        <h6>4 Principles Help You Lose <br />Weight With Vegetables</h6>
                                        <span>MAR 05, 2019</span>
                                    </div>
                                </a>
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
			                <ul>
			                	<li>
				                    <select>
				                    	<option>인기순</option>
				                    	<option>댓글순</option>
				                    	<option>최신순</option>
				                    </select>
			                	</li>
			                	<li>
				                    <select name="onePageViewCnt" >			                   
				                     	<option value="list"><img src="${contextPath }/resources/bootstrap/img/list.png">리스트</option>
				                    	<option value=""><img src="${contextPath }/resources/bootstrap/img/detail.png">자세히</option>
				                    </select>
			                	</li>
			                </ul>	
                           <c:forEach var="diggingDTO" items="${diggingList }">
                            <div class="blog__item">
                            <div>
                                <div class="blog__item__text">
                                	<table border="1" width="300" height="200">
                                		<thead>
                                			<tr>
                                				<td colspan="2">${diggingDTO.writer }</td>
                                				<td><i class="fa fa-calendar-o"></i><fmt:formatDate value="${diggingDTO.enrollDT }" pattern="yyyy-MM-dd"/></td>
                                			</tr>
                                		</thead>
										<tbody align="center">
											<tr>
												<th colspan="3"><h5><a href="${contextPath }/digging/diggingDetail?diggingId=${diggingDTO.diggingId}">${diggingDTO.subject }</a></h5></th>
											</tr>
											<tr>
											<c:if test="${diggingDTO.file != null }">
												<th colspan="3"><a href="#"><img src="${contextPath}/digging/thumbnails?file=${diggingDTO.file }" width="300" height="100" alt="이미지&동영상"/></a></th>
											</c:if>
											</tr>
											<tr>
												<th colspan="3"><a href="${contextPath }/digging/diggingDetail?diggingId=${diggingDTO.diggingId}">${diggingDTO.content }</a></th>
											</tr>
										</tbody>    
										<tfoot>
											<tr>
												<th><i class="fa fa-comment-o"></i> 댓글수 ${replyDTO.replyCnt }</th>
												<th>likecnt</th>
											</tr>
										</tfoot>                            	
                                	</table>
                                	<input type="hidden" value="${diggingDTO.diggingId }"/>
                                </div>
							 </div>                                
                            </div>
                       </c:forEach>
						</div>		               
                        <div class="col-lg-12">
                            <div class="product__pagination blog__pagination">
                            <c:if test="${startPage > 10 }">
                                <a href="${contextPath }/digging/main?currentPageNumber=${startPage - 10}&onePageViewCnt=${onePageViewCnt}"><i class="fa fa-long-arrow-left"></i></a>}"><i class="fa fa-long-arrow-left"></i></a>
                            </c:if>
                            <c:forEach  var="i" begin="${startPage }" end="${endPage }">
                                <a href="#">i</a>
                            </c:forEach>
                            <c:if test="${endPage != allPageCnt && endPage >= 10 }">  
                                <a href="${contextPath }/digging/main?currentPageNumber=${startPage + 10}&onePageViewCnt=${onePageViewCnt}"><i class="fa fa-long-arrow-right"></i></a>
                            </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Section End -->

</body>
</html>