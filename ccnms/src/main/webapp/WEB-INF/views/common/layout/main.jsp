<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  	a {color:black}
  	a:visited { color:black; }
	a:hover { color:purple; }   
   h1 { margin: 50px 0px; }
</style>
</head>

<script>
	$().ready(function(){
		$( '[data-toggle="popover"]' ).popover();
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
		
		$("#userInfoBtn").click(function(){
			var writer= $("#writer").val();
			console.log(writer);
			$.ajax ({
				url : "${contextPath}/userInfo",
				type : "post",
				data : {"writer" : writer},
				success : function(data) {
					console.log(data.likePoint);
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
               	<c:forEach var="headDiggingDTO" items="${headList }">
                    <div class="col-lg-12 col-md-12">
                        <div class="categories__item set-bg" data-setbg="${contextPath }/resources/bootstrap/img/notice.PNG">
                            <h5><a href="${contextPath }/digging/diggingDetail?diggingId=${headDiggingDTO.diggingId}">${headDiggingDTO.subject }</a></h5>
                            <input type="hidden" value="${headDiggingDTO.diggingId }">
                        </div>
                    </div>
               	</c:forEach>
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
    <section id="digging" class="section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="featured__controls">
                    	<hr>
                    	<ul>
                    		<li><a href="${contextPath }/digging/addDigging"><button type="button" class="btn btn-primary btn-lg" style="background:gold">디깅하기</button></a></li>
                    	</ul>
                    	<ul id="onePageViewCnt">
							<li><img src="${contextPath}/resources/bootstrap/img/list.png" id=list /></li>
	                   		<li><img src="${contextPath}/resources/bootstrap/img/detail.png" id=listDetail /></li>
                    	</ul>
                    	<ul align="right">
						    <li class="nav-item dropdown">
						    <a class="nav-link dropdown-toggle show" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="true">정 렬</a>
						    <div class="dropdown-menu show" data-popper-placement="bottom-start" style="position: absolute; inset: 0px auto auto 0px; margin: 0px; transform: translate(0px, 41px);">
						      <a class="dropdown-item" href="${contextPath }/?sort=readCnt">인기많은순</a>
						      <a class="dropdown-item" href="${contextPath }/?sort=thumbsUp">추천순</a>
						      <a class="dropdown-item" href="${contextPath }/?sort=recent">최신순</a>
						    </div>
						  </li>
                    	</ul>
                	</div>
	            <div class="row featured__filter">
		            <div class="col-lg-12 col-md-12 col-sm-6 readCnt">
                   	<div class="digging__item" data-type="readCnt">
	                    <c:forEach var="diggingDTO" items="${diggingList }">
                       		<input type="hidden" id="diggingId"  value="${diggingDTO.diggingId }"/>
                       		<table width="100%">
                       			<thead height="50">
	                       			<tr style="background:lightgray">
	                       				<th>
	                       				<button type="button" class="btn btn-primary text-nowrap" id="userInfoBtn" data-bs-toggle="popover" title="${diggingDTO.writer }" data-toggle="popover" data-bs-offset="0,14" data-bs-placement="top" data-bs-html="true" data-content="더보기">${diggingDTO.writer }</button>
                      					<input type="hidden" id="writer" value="${diggingDTO.writer }"/>
                      					</th>
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
								    &emsp;&emsp;<a href="#" class="card-link"><img alt="" src="${contextPath }/resources/bootstrap/img/comment.png"/> ${diggingDTO.replyCnt}</a>
								    &emsp;&emsp;<a href="#" class="card-link"><img alt="" src="${contextPath }/resources/bootstrap/img/show.png"/> ${diggingDTO.readCnt }</a>
								   <input type="hidden" value="${diggingDTO.diggingId }"/>
								  	</td>
								  	</tr>
								</tfoot>                       		
                       		</table>
		                </c:forEach>
     	<section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                      <c:forEach var="diggingDTO" items="${diggingList }">
                  		<input type="hidden" id="diggingId"  value="${diggingDTO.diggingId }"/>
                        <table border="1">
                           	<thead height="50">
                       			<tr style="background:lightgray">
                       				<th colspan="3">
                       				<button type="button" class="btn btn-primary text-nowrap" id="userInfoBtn" data-bs-toggle="popover" title="${diggingDTO.writer }" data-toggle="popover" data-bs-offset="0,14" data-bs-placement="top" data-bs-html="true" data-content="더보기">${diggingDTO.writer }</button>
                     					<input type="hidden" id="writer" value="${diggingDTO.writer }"/>
                     					</th>
                       				<th align="right">${diggingDTO.enrollDT }</th>
                       			</tr>
                      		</thead>
                            <tbody>
                                <tr>
									<th colspan="3"><a href="${contextPath }/digging/diggingDetail?diggingId=${diggingDTO.diggingId}"><h5>${diggingDTO.subject }</h5></a></th>
                                    <c:if test="${digging.file != null }">
	                                   <td class="shoping__cart__item">
	                                       <img src="${contextPath }/thumbnails?filename=${diggingDTO.file}" alt="" width="50" height="50">
	                                   </td>
                                    </c:if>
                                    <th>
                                    	${diggingDTO.content }
                                    </th>
                                </tr>
                            </tbody>
                            <tfoot>
							  	<tr><td colspan="4">
							    &emsp;<a href="#" class="card-link"><img alt="" src="${contextPath }/resources/bootstrap/img/thumbs.PNG" width="40" height="40" id="thumbsUp" value="${diggingDTO.diggingId }"/>${diggingDTO.thumbsUp }</a>
							    &emsp;&emsp;<a href="#" class="card-link"><img alt="" src="${contextPath }/resources/bootstrap/img/comment.png"/> ${diggingDTO.replyCnt}</a>
							    &emsp;&emsp;<a href="#" class="card-link"><img alt="" src="${contextPath }/resources/bootstrap/img/show.png"/> ${diggingDTO.readCnt }</a>
							   <input type="hidden" value="${diggingDTO.diggingId }"/>
							  	</td>
							  	</tr>
							</tfoot>     
                        </table>
                       </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <br>
    <br>
    <div class="product__pagination blog__pagination" align="center">
        <c:if test="${startPage > 5 }">
	        <a href="${contextPath }/?currentPageNumber=${startPage - 5}&onePageViewCnt=${onePageViewCnt}"><i class="fa fa-long-arrow-left"></i></a>
        </c:if>
        <c:forEach var="i" begin="${startPage }" end="${endPage }">
        <a href="${contextPath }/?currentPageNumber=${i}&onePageViewCnt=${onePageViewCnt}">${i }</a>
        </c:forEach>
        <c:if test="${endPage != allPageCnt && endPage >= 5 }">
        	<a href="${contextPath }/?currentPageNumber=${startPage + 5}&onePageViewCnt=${onePageViewCnt}"><i class="fa fa-long-arrow-right"></i></a>
        </c:if>
     </div>
    <!-- Featured Section End -->

    <!-- Banner Begin -->

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
            </div>
            </div>
            </div>
            </div>
            </div>
        </div>
    </section>
    <!-- Latest Product Section End -->

</body>
</html>