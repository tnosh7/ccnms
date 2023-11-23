<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<c:set var="sessionId" value="${sessionScope.userId}"/>
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
   .headDigging a{
		font-family: 'Black Han Sans', sans-serif;
   		background-color:transparent;
   		color:white;
   		text-align:center;
   		font-size: x-large;
   }
    table {
    width: 100%;
    height: 200px;
  }
</style>
</head>
<script>

	$().ready(function(){
		
		$("#onePageViewCnt").val("${onePageViewCnt}");
	});
	
	function getDiggingList() {
		var url = "${contextPath }/"
		    url += "?onePageViewCnt=" + $("#onePageViewCnt").val();
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
				$("#updateThumbs").html(data);
			}
		});
	}
</script>
<body>
    <section class="categories">
        <div class="container">
            <div class="row">
               <div class="categories__slider owl-carousel">
               	<c:forEach var="headDiggingDTO" items="${headList }">
                    <div class="col-lg-12 col-md-12">
                        <div class="categories__item set-bg" data-setbg="${contextPath }/thumbnails?file=${headDiggingDTO.file}">
                            <span class="headDigging">${headDiggingDTO.writer}
                        	</span>
                            <br><br><br><br><br><br><br><br>
                             <span class="headDigging">
                            <a href="${contextPath }/digging/diggingDetail?diggingId=${headDiggingDTO.diggingId}">
                             ${headDiggingDTO.subject }</a></span>
                            <input type="hidden" value="${headDiggingDTO.diggingId }">
                        </div>
                    </div>
               	</c:forEach>
                </div>
            </div>
        </div>
    </section>
    <section class="section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="featured__controls">
                    	<hr>
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
                    	<ul> 
	                   		<li> 게시물 보기
								<select id="onePageViewCnt" onchange="getDiggingList()" >
									<option value="5">5</option>
									<option value="7">7</option>
									<option value="10">10</option>
								</select>
	                   		</li>
                    	</ul>
                	</div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="digging__table" id="list-content">
                      <c:forEach var="diggingDTO" items="${diggingList }">
                  		<input type="hidden" id="diggingId"  value="${diggingDTO.userList}"/>
                        <table style="width:100%">
                           	<thead height="50">
                       			<tr style="background:whitesmoke">
                       				<th align="left" colspan="4" style="width:70%">
	                       				<c:choose>
	                       					<c:when test="${diggingDTO.profile eq null}">
	                       						<a href="${contextPath }/ranking/otherUserInfo?userId=${diggingDTO.userId}"><img src="${contextPath}/resources/admin/assets/img/avatars/2.png" width="40" height="40">&emsp;${diggingDTO.userId }&emsp;${diggingDTO.likePoint }</a>
	                       					</c:when>
	                       					<c:otherwise>
			                       				<img src="${contextPath }/thumbnails?file=${diggingDTO.profile}"  width="40" height="40">&emsp;
			                       				<a href="${contextPath }/ranking/otherUserInfo?userId=${diggingDTO.userId }">
			                       					${diggingDTO.userId }&emsp;${diggingDTO.likePoint }
			                       				</a>
	                       					</c:otherwise>
	                       				</c:choose>
                     					<input type="hidden" id="writer" value="${diggingDTO.userId }"/>
                     					</th>
                       				<th align="right">${diggingDTO.enrollDT }</th>
                       			</tr>
                      		</thead>
                            <tbody style="height:50">
                                <tr>
                                	<th align="left">
                               			<c:set var="startDiggingIdx" value="${startDiggingIdx = startDiggingIdx + 1 }"/>
	                       				<span>${startDiggingIdx }. </span>
                                	</th>
									<th colspan="3"><a href="${contextPath }/digging/diggingDetail?diggingId=${diggingDTO.diggingId}"><h5>${diggingDTO.subject }</h5></a></th>
	                                   <c:choose>
	                                   	<c:when test="${diggingDTO.file eq ''}">
	                                   	</c:when>
	                                   	<c:otherwise>
		                                   <td class="shoping__cart__item">
		                                       <img src="${contextPath }/thumbnails?file=${diggingDTO.file}" width="250" height="200" alt="ㅇㅇㅇㅇ" >
		                                   </td>
	                                   	</c:otherwise>
	                                   </c:choose>
                                </tr>
                            </tbody>
                            <tfoot>
							  	<tr><td colspan="4" align="left">
							    &emsp;<a href="javascript:updateThumb(${diggingDTO.diggingId })" class="card-link"><img alt="" src="${contextPath }/resources/bootstrap/img/thumbs.PNG" width="40" height="40" id="thumbsUp"/>
							   		<span id="updateThumbs">${diggingDTO.thumbsUp }</span></a>
							    &emsp;&emsp;<a href="#" class="card-link"><img alt="" src="${contextPath }/resources/bootstrap/img/comment.png"/> ${diggingDTO.replyCnt}</a>
							    &emsp;&emsp;<a href="#" class="card-link"><img alt="" src="${contextPath }/resources/bootstrap/img/show.png"/> ${diggingDTO.readCnt }</a>
							   <input type="hidden" value="${diggingDTO.diggingId }"/>
							  	</td>
							  	</tr>
							</tfoot>     
                        </table>
                        <hr>
                       </c:forEach>
                    </div>
                </div>
            </div>
   		<br>
    <div class="product__pagination blog__pagination" align="center">
        <c:if test="${startPage > 10 }">
	        <a href="${contextPath }/?currentPageNumber=${startPage - 10}&onePageViewCnt=${onePageViewCnt}"><i class="fa fa-long-arrow-left"></i>이전</a>
        </c:if>
        <c:forEach var="i" begin="${startPage }" end="${endPage }">
       		<a href="${contextPath }/?currentPageNumber=${i}&onePageViewCnt=${onePageViewCnt}">${i }</a>
        </c:forEach>
        <c:if test="${endPage != allPageCnt && endPage >= 10 }">
        	<a href="${contextPath }/?currentPageNumber=${startPage + 10}&onePageViewCnt=${onePageViewCnt}"><i class="fa fa-long-arrow-right"></i>다음</a>
        </c:if>
     </div>
    <section class="latest-product spad">
        <div class="container">
            <div class="row">
                 <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>최신 상품</h4>
                        <div class="latest-product__slider owl-carousel">
                            <div class="latest-prdouct__slider__item">
                            <c:forEach var="recentShopDTO" items="${recentShopList }"> 
                                <a href="${contextPath }/shop/shopDetail?productCd=${recentShopDTO.productCd }" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="${contextPath}/thumbnails?file=${recentShopDTO.productFile}" alt="" width="30" height="30">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>${recentShopDTO.productNm}</h6>
                                        <span>${recentShopDTO.price }</span>
                                    </div>
                                </a>
                            </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>인기많은 상품</h4>
                        <div class="latest-product__slider owl-carousel">
                            <div class="latest-prdouct__slider__item">
                            <c:forEach var="populerShopDTO" items="${populerShopList }"> 
                                <a href="${contextPath }/shop/shopDetail?productCd=${populerShopDTO.productCd }" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="${contextPath}/thumbnails?file=${populerShopDTO.productFile}" alt="" width="30" height="30">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>${populerShopDTO.productNm}</h6>
                                        <span>${populerShopDTO.price }</span>
                                    </div>
                                </a>
                            </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
                 <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>교환 상품</h4>
                        <div class="latest-product__slider owl-carousel">
                            <div class="latest-prdouct__slider__item">
                            <c:forEach var="exchangeShopDTO" items="${exchangeShopList }"> 
                                <a href="${contextPath }/shop/shopDetail?productCd=${exchangeShopDTO.productCd }" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="${contextPath}/thumbnails?file=${exchangeShopDTO.productFile}" alt="" width="30" height="30">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>${exchangeShopDTO.productNm}</h6>
                                    </div>
                                </a>
                            </c:forEach>
                            <input type="hidden" name="userId" value="${sessionId }">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </section>
           </div>
          </div>
         </div>
    </section>
</body>
</html>