<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="sessionId" value="${sessionScope.userId}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${contextPath}/resources/css/main.css" rel="stylesheet">
 <script src="${contextPath}/resources/js/main.js"></script>
 <script type="text/javascript">
	$().ready(function() {
		$("#sort").val("${sort}");
	});

	
	function updateThumb(diggingId) {
		if ("${sessionId == null}" == "true") {
			Swal
					.fire({
						icon : 'info',
						title : '로그인 후에 이용가능합니다.',
						footer : '<a href="${contextPath }/user/loginUser">로그인 페이지로 이동하기</a>'
					})
		} else {

			$.ajax({
				url : "${contextPath}/updateThumbsUp",
				type : "get",
				data : {
					"diggingId" : diggingId
				},
				success : function(data) {
					$("#updateThumbs" + diggingId).html(data);
				}
			})
		}
	}
	function show() {
		$("[name='dropdown-menu']").show();
	}
	function hide() {
		$("[name='dropdown-menu']").hide();
	}
 </script>
</head>
<body>
	<section class="categories">
		<div class="container">
			<div class="row">
				<div class="categories__slider owl-carousel">
					<c:forEach var="headDiggingDTO" items="${headList }">
						<div class="col-lg-12 col-md-12">
							<c:choose>
								<c:when test="${headDiggingDTO.file eq ''}">
									<div class="categories__item set-bg"
										data-setbg="${contextPath }/resources/bootstrap/img/banner/notice.PNG">
								</c:when>
								<c:otherwise>
									<div class="categories__item set-bg"
										data-setbg="${contextPath }/thumbnails?file=${headDiggingDTO.file}">
								</c:otherwise>
							</c:choose>						
							<span class="headDigging"> 
								<a href="${contextPath }/digging/diggingDetail?diggingId=${headDiggingDTO.diggingId}">
									${headDiggingDTO.subject}</a>
							</span> 
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
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle show" data-bs-toggle="dropdown"
								role="button" aria-haspopup="true" aria-expanded="true"
								onmouseenter="show()" onclick="hide()">정 렬</a>
								<div class="dropdown-menu" name="dropdown-menu"
									data-popper-placement="bottom-start"
									style="position: absolute; inset: 0px auto auto 0px; margin: 0px; transform: translate(0px, 41px);">
									<a class="dropdown-item" href="${contextPath }/?sort=readCnt">인기많은순</a>
									<a class="dropdown-item" href="${contextPath }/?sort=thumbsUp">추천순</a>
									<a class="dropdown-item" href="${contextPath }/?sort=recent">최신순</a>
								</div></li>
						</ul>
					</div>
					<div class="row">
						<div class="col-lg-12">
							<div class="digging__table" id="list-content">
								<c:forEach var="diggingDTO" items="${diggingList }">
									<input type="hidden" id="diggingId"
										value="${diggingDTO.userList}" />
									<table style="width: 100%"
										onMouseover="this.style.background='aliceblue';"
										onMouseout="this.style.background='white';">
										<thead height="50">
											<tr style="background: aliceblue">
												<th align="left" colspan="4" style="width: 70%"><c:choose>
														<c:when test="${diggingDTO.profile eq null}">
															<a
																href="${contextPath }/ranking/otherUserInfo?userId=${diggingDTO.userId}"><img
																src="${contextPath}/resources/bootstrap/img/icon/profile.jpg"
																width="40" height="40">&emsp;${diggingDTO.userId }&emsp;${diggingDTO.likePoint }</a>
														</c:when>
														<c:otherwise>
															<img
																src="${contextPath }/digging/thumbnails?file=${diggingDTO.profile}"
																width="40" height="40">
															&emsp;
															<a
																href="${contextPath }/ranking/otherUserInfo?userId=${diggingDTO.userId }">
																${diggingDTO.userId }&emsp;${diggingDTO.likePoint } </a>
														</c:otherwise>
													</c:choose> 
													<input type="hidden" id="writer" value="${diggingDTO.userId }" /></th>
												<th align="right">
												<fmt:formatDate value="${diggingDTO.enrollDT }" pattern="yyyy-MM-dd" /></th>
											</tr>
										</thead>
										<tbody style="height: 40">
											<tr>
												<th align="left"><c:set var="startDiggingIdx"
														value="${startDiggingIdx = startDiggingIdx + 1 }" /> <span>${startDiggingIdx }.
												</span></th>
												<th colspan="3"><a
													href="${contextPath }/digging/diggingDetail?diggingId=${diggingDTO.diggingId}">
														<h5>${diggingDTO.subject }</h5>
												</a></th>
												<c:choose>
													<c:when test="${diggingDTO.file eq ''}">
													</c:when>
													<c:otherwise>
														<td class="shoping__cart__item"><img
															src="${contextPath }/digging/thumbnails?file=${diggingDTO.file}"
															width="200" height="150" alt="ㅇㅇㅇㅇ"></td>
													</c:otherwise>
												</c:choose>
											</tr>
										</tbody>
										<tfoot>
											<tr>
												<td colspan="4" align="left">&emsp;<a
													href="javascript:updateThumb(${diggingDTO.diggingId })"
													class="card-link"> 
													<img alt="추천"
														src="${contextPath }/resources/bootstrap/img/thumbs.PNG"
														width="40" height="40" id="thumbsUp" /> 
													<span
														id="updateThumbs${diggingDTO.diggingId }">${diggingDTO.thumbsUp }</span></a>
													&emsp;&emsp;
													<img alt=""
														src="${contextPath }/resources/bootstrap/img/comment.png" />
													${diggingDTO.replyCnt} &emsp;&emsp;
													<img alt="" src="${contextPath }/resources/bootstrap/img/show.png" />
													${diggingDTO.readCnt } 
													<input type="hidden" value="${diggingDTO.diggingId }" /> 
													<input type="hidden" name="sort" />
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
					<div class="banner">
						<div class="container">
							<div class="row">
								<div class="col-lg-6 col-md-6 col-sm-6">
									<div class="banner__pic">
										<img alt=""
											src="${contextPath }/resources/bootstrap/img/banner/weekendOffer.jpg">
									</div>
								</div>
								<div class="col-lg-6 col-md-6 col-sm-6">
									<div class="banner__pic">
										<img alt=""
											src="${contextPath }/resources/bootstrap/img/banner/weekendOffer.jpg">
									</div>
								</div>
							</div>
						</div>
						<section class="featured spad">
							<div class="container">
								<div class="row">
									<div class="col-lg-12">
										<div class="section-title">
											<h2>BEST 상품</h2>
										</div>
										<div class="featured__controls">
											<ul>
												<li data-filter="*">ALL</li>
												<li data-filter=".ModuDigging">디깅마켓</li>
												<li data-filter=".sale">유저마켓</li>
												<li data-filter=".exchange">교환마켓</li>
											</ul>
										</div>
									</div>
								</div>
								<div class="row featured__filter" id="MixItUpACFF9F" >
									<c:forEach var="shopDto" items="${populerShopList}">
										<div class="col-lg-3 col-md-4 col-sm-6 mix ${shopDto.sort}"
											style="display: block;">
											<div class="featured__item">
												<div class="featured__item__pic set-bg"
													data-setbg="${contextPath }/thumbnails?file=${shopDto.productFile}"
													style="background-image: url('${shopDto.productFile}');">
												</div>
												<div class="featured__item__text">
													<h6>
														<a href="${contextPath }/shop/shopDetail?productCd=${shopDto.productCd }">${shopDto.productNm}</a>
													</h6>
													<h5><span style="text-decoration: line-through; color: red">${shopDto.price }</span>
                                                 <span><fmt:formatNumber value="${shopDto.price - shopDto.price * shopDto.discountRate / 100}"/>원</span></h5>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
					</div>
				</div>
			</div>
	</section>
</body>
</html>