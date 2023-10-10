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
  	a {color:black}
  	a:visited { color:black; }
	a:hover { color:purple; }   

</style>
<script>
	


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
				                	<li>
					                    <select name="onePageViewCnt" >			                   
					                     	<option value="list"><img src="${contextPath }/resources/bootstrap/img/list.png">리스트</option>
					                    	<option value=""><img src="${contextPath }/resources/bootstrap/img/detail.png">자세히</option>
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
                 				<div class="card mb-3">
                 				<c:choose>
                 					<c:when test="${diggingDTO.diggingTopic eq 'game' }">	<div class="label game">game</div></c:when>	
                 					<c:when test="${diggingDTO.diggingTopic eq 'kPop' }">	<div class="label kPop">kPop</div></c:when>		
                 					<c:when test="${diggingDTO.diggingTopic eq 'ott' }">	<div class="label ott">ott</div></c:when>		
                 					<c:when test="${diggingDTO.diggingTopic eq 'animal' }">	<div class="label animal">animal</div></c:when>	
                 					<c:when test="${diggingDTO.diggingTopic eq 'business'}"><div class="label business">business</div></c:when>	
                 					<c:when test="${diggingDTO.diggingTopic eq 'sport' }">	<div class="label sport">sport</div></c:when>	
                 					<c:when test="${diggingDTO.diggingTopic eq 'celeb' }">	<div class="label celeb">celeb</div></c:when>	
                 					<c:when test="${diggingDTO.diggingTopic eq 'trevel' }">	<div class="label trevel">trevel</div></c:when>	
                 					<c:when test="${diggingDTO.diggingTopic eq 'fashion' }"><div class="label game">fashion</div></c:when>		
                 				</c:choose>
								  <h6 class="card-header"><c:forEach var="userDTO" items="${userList}"><img src="${contextPath }/myPage/thumbnails?fileName=${userDTO.profile }" width="30"></c:forEach>${diggingDTO.writer }
								 	<i class="fa fa-calendar-o"></i><fmt:formatDate value="${diggingDTO.enrollDT }" pattern="yyyy-MM-dd"/>
								  </h6>
								  <div class="card-body">
								    <h5 class="card-title" ><a href="${contextPath }/digging/diggingDetail?diggingId=${diggingDTO.diggingId}">${diggingDTO.subject }</a></h5>
								  </div>
								  <svg xmlns="http://www.w3.org/2000/svg" class="d-block user-select-none" width="100%" height="200" aria-label="Placeholder: Image cap" focusable="false" role="img" preserveAspectRatio="xMidYMid slice" viewBox="0 0 318 180" style="font-size:1.125rem;text-anchor:middle">
								    <rect width="100%" height="100%" fill="#868e96"></rect>
								    <text x="50%" y="50%" fill="#dee2e6" dy=".3em">Image cap</text>
								  </svg>
								  <div class="card-body">
								    <p class="card-text"><a href="${contextPath }/digging/diggingDetail?diggingId=${diggingDTO.diggingId}">${diggingDTO.content }</a></p>
								  </div>
								  <div class="card-footer" style="background:white">
								    &emsp;<a href="#" class="card-link"><img alt="" src="${contextPath }/resources/bootstrap/img/thumbs.PNG" width="40" height="40" id="thumbsUp" value="${diggingDTO.diggingId }"/>${diggingDTO.thumbsUp }</a>
								    &emsp;&emsp;<a href="#" class="card-link"><img alt="" src="${contextPath }/resources/bootstrap/img/comment.png"/> ${diggingDTO.replyCnt }</a>
								    &emsp;&emsp;<a href="#" class="card-link"><img alt="" src="${contextPath }/resources/bootstrap/img/show.png"/> ${diggingDTO.readCnt }</a>
								   <input type="hidden" value="${diggingDTO.diggingId }"/>
								  </div>
								</div>
                      	 </c:forEach>
						</div>		               
                        <div class="col-lg-12">
                            <div class="product__pagination blog__pagination">
                            <c:if test="${startPage > 5 }">
                                <a href="${contextPath }/digging/main?currentPageNumber=${startPage - 5}&onePageViewCnt=${onePageViewCnt}"><i class="fa fa-long-arrow-left"></i></a>}"><i class="fa fa-long-arrow-left"></i></a>
                            </c:if>
                            <c:forEach  var="i" begin="${startPage }" end="${endPage }">
                                <a href="#">i</a>
                            </c:forEach>
                            <c:if test="${endPage != allPageCnt && endPage >= 5 }">  
                                <a href="${contextPath }/digging/main?currentPageNumber=${startPage + 5}&onePageViewCnt=${onePageViewCnt}"><i class="fa fa-long-arrow-right"></i></a>
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