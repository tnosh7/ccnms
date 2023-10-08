<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
	$().ready(function(){
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
		var menu="${menu}";
		if (menu=='del') {
			Swal.fire({
				  position: 'center',
				  icon: 'success',
				  title: '회원탈퇴가 완료되었습니다.',
				  showConfirmButton: false,
				  timer: 1500
				});
		}
	});
	
	function updatethumbsUp(){
		
		var thumbsUp = document.getElementById("thumbsUp").value;
		thumbsUp += 1;
		document.getElementById("thumbsUp").innerHTML = thumbsUp;
		return;
	}
	
</script>
<body>
    <!-- Categories Section Begin -->
    <section class="categories">
        <div class="container">
            <div class="row">
               <div class="categories__slider owl-carousel">
                    <div class="col-lg-6 col-md-6">
                        <div class="categories__item set-bg" data-setbg="${contextPath}/resources/bootstrap/img/categories/cat-1.jpg">
                            <h5><a href="#">Fresh Fruit</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="categories__item set-bg" data-setbg="${contextPath}/resources/bootstrap/img/categories/cat-2.jpg">
                            <h5><a href="#">Dried Fruit</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="${contextPath}/resources/bootstrap/img/categories/cat-3.jpg">
                            <h5><a href="#">Vegetables</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="${contextPath}/resources/bootstrap/img/categories/cat-4.jpg">
                            <h5><a href="#">drink fruits</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="${contextPath}/resources/bootstrap/img/categories/cat-5.jpg">
                            <h5><a href="#">drink fruits</a></h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Categories Section End -->

    <!-- Featured Section Begin -->
    <section class="featured spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="featured__controls">
                    	<ul align="right">
                    		<li><c:if test="${sessionScope.userId eq null }"><button type="button" class="btn btn-primary btn-lg">디깅하기</button></c:if></li>
                    		
                    	</ul>
                        <ul>
                            <li class="active" data-filter="*">All</li>
                            <li data-filter=".oranges">Oranges</li>
                            <li data-filter=".fresh-meat">Fresh Meat</li>
                            <li data-filter=".vegetables">Vegetables</li>
                            <li data-filter=".fastfood">Fastfood</li>
                        </ul>
                	</div>
            <div class="row featured__filter">
                <div class="col-lg-12 col-md-12 col-sm-6 mix oranges fresh-meat">
                    <div class="featured__item">
                    <c:choose>
                    	<c:when test="${sort eq 'thumbsUp'}">
		                    <c:forEach var="diggingDTO" items="${thumbsUpList }">
	                       		<table border="1" width="100%">
	                       			<thead>
		                       			<tr>
		                       				<th>${diggingDTO.writer }</th>
		                       				<th align="right">${diggingDTO.enrollDT }</th>
		                       			</tr>
	                       			</thead>
									<tbody>
										<tr>
											<th colspan="2"><h4>${diggingDTO.subject }</h4></th>
										</tr>
										<tr>
											<td colspan="2">${diggingDTO.content}</td>
										</tr>
									</tbody>                       			
									<tfoot>
										<tr>
											<td><img alt="" src="${contextPath }/resources/bootstrap/img/thumbs.PNG" width="40" height="40" id="thumbsUp" value="${diggingDTO.diggingId }"/>${diggingDTO.thumbsUp }</td>
											<td>${diggingDTO.readCnt }</td>
										</tr>
									</tfoot>                       		
	                       		</table>
			                </c:forEach>
                    	</c:when>
                    	<c:when test="${sort eq 'recent'}">
		                    <c:forEach var="diggingDTO" items="${recentList }">
	                       		<table border="1" width="100%">
	                       			<thead>
		                       			<tr>
		                       				<th>${diggingDTO.writer }</th>
		                       				<th align="right">${diggingDTO.enrollDT }</th>
		                       			</tr>
	                       			</thead>
									<tbody>
										<tr>
											<th colspan="2"><h4>${diggingDTO.subject }</h4></th>
										</tr>
										<tr>
											<td colspan="2">${diggingDTO.content}</td>
										</tr>
									</tbody>                       			
									<tfoot>
										<tr>
											<td>${diggingDTO.thumbsUp }</td>
											<td>${diggingDTO.readCnt }</td>
										</tr>
									</tfoot>                       		
	                       		</table>
			                </c:forEach>
                    	</c:when>
                    	<c:otherwise>
		                    <c:forEach var="diggingDTO" items="${diggingList }">
	                       		<input type="hidden" id="diggingId"  value="${diggingDTO.diggingId }"/>
	                       		<table width="100%">
	                       			<thead height="50">
		                       			<tr style="background:lightgray">
		                       				<th>${diggingDTO.writer }</th>
		                       				<th align="right">${diggingDTO.enrollDT }</th>
		                       			</tr>
	                       			</thead>
									<tbody>
										<tr height="70">
											<th colspan="2"><a href="${contextPath }/digging/diggingDetail?diggingId=${diggingDTO.diggingId}"><h5>${diggingDTO.subject }</h5></a></th>
										</tr>
										<tr>
											<td colspan="2">${diggingDTO.content}</td>
										</tr>
									</tbody>                       			
									<tfoot>
									  	<tr><td>
									    &emsp;<a href="#" class="card-link"><img alt="" src="${contextPath }/resources/bootstrap/img/thumbs.PNG" width="40" height="40" id="thumbsUp" value="${diggingDTO.diggingId }"/>${diggingDTO.thumbsUp }</a>
									    &emsp;&emsp;<a href="#" class="card-link"><img alt="" src="${contextPath }/resources/bootstrap/img/comment.png"/> ${allReplyCnt }</a>
									    &emsp;&emsp;<a href="#" class="card-link"><img alt="" src="${contextPath }/resources/bootstrap/img/show.png"/> ${diggingDTO.readCnt }</a>
									   <input type="hidden" value="${diggingDTO.diggingId }"/>
									  	</td>
									  	</tr>
									  	<tr><hr></tr>
									</tfoot>                       		
	                       		</table>
			                </c:forEach>
                    	</c:otherwise>
                    </c:choose>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Featured Section End -->

    <!-- Banner Begin -->
    <div class="banner">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="banner__pic">
                        <img src="${contextPath}/resources/bootstrap/img/banner/banner-1.jpg" alt="">
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="banner__pic">
                        <img src="${contextPath}/resources/bootstrap/img/banner/banner-2.jpg" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Banner End -->

    <!-- Latest Product Section Begin -->
    <section class="latest-product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>Latest Products</h4>
                        <div class="latest-product__slider owl-carousel">
                            <div class="latest-prdouct__slider__item">
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="${contextPath}/resources/bootstrap/img/latest-product/lp-1.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="${contextPath}/resources/bootstrap/img/latest-product/lp-2.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="${contextPath}/resources/bootstrap/img/latest-product/lp-3.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                            </div>
                            <div class="latest-prdouct__slider__item">
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="${contextPath}/resources/bootstrap/img/latest-product/lp-1.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="${contextPath}/resources/bootstrap/img/latest-product/lp-2.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="${contextPath}/resources/bootstrap/img/latest-product/lp-3.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>Top Rated Products</h4>
                        <div class="latest-product__slider owl-carousel">
                            <div class="latest-prdouct__slider__item">
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="${contextPath}/resources/bootstrap/img/latest-product/lp-1.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="${contextPath}/resources/bootstrap/img/latest-product/lp-2.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="${contextPath}/resources/bootstrap/img/latest-product/lp-3.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                            </div>
                            <div class="latest-prdouct__slider__item">
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="${contextPath}/resources/bootstrap/img/latest-product/lp-1.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="${contextPath}/resources/bootstrap/img/latest-product/lp-2.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="${contextPath}/resources/bootstrap/img/latest-product/lp-3.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>Review Products</h4>
                        <div class="latest-product__slider owl-carousel">
                            <div class="latest-prdouct__slider__item">
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="${contextPath}/resources/bootstrap/img/latest-product/lp-1.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="${contextPath}/resources/bootstrap/img/latest-product/lp-2.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="${contextPath}/resources/bootstrap/img/latest-product/lp-3.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                            </div>
                            <div class="latest-prdouct__slider__item">
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="${contextPath}/resources/bootstrap/img/latest-product/lp-1.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="${contextPath}/resources/bootstrap/img/latest-product/lp-2.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="${contextPath}/resources/bootstrap/img/latest-product/lp-3.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Latest Product Section End -->

    <!-- Blog Section Begin -->
    <section class="from-blog spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title from-blog__title">
                        <h2>From The Blog</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="${contextPath}/resources/bootstrap/img/blog/blog-1.jpg" alt="">
                        </div>
                        <div class="blog__item__text">
                            <ul>
                                <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                                <li><i class="fa fa-comment-o"></i> 5</li>
                            </ul>
                            <h5><a href="#">Cooking tips make cooking simple</a></h5>
                            <p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat </p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="${contextPath}/resources/bootstrap/img/blog/blog-2.jpg" alt="">
                        </div>
                        <div class="blog__item__text">
                            <ul>
                                <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                                <li><i class="fa fa-comment-o"></i> 5</li>
                            </ul>
                            <h5><a href="#">6 ways to prepare breakfast for 30</a></h5>
                            <p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat </p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="${contextPath}/resources/bootstrap/img/blog/blog-3.jpg" alt="">
                        </div>
                        <div class="blog__item__text">
                            <ul>
                                <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                                <li><i class="fa fa-comment-o"></i> 5</li>
                            </ul>
                            <h5><a href="#">Visit the clean farm in the US</a></h5>
                            <p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
   
</body>
</html>