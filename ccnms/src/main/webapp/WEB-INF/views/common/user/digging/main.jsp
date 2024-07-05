<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now" class="java.util.Date" />
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="sessionId" value="${sessionScope.userId }" />
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

ul {
	list-style: none;
}

.head-wrap {
	position: relative;
	width: 100%;
	height: 150px;
	background-size: cover;
	background-position: center;
	background-image: url('${contextPath}/resources/bootstrap/img/header/${diggingTopic}.jpg');
}

.head-text {
	padding: 5px 10px;
	text-align: center;
	position: absolute;
	color: white;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown-content a:hover {
	background-color: #f1f1f1
}

.dropdown:hover .dropdown-content {
	display: block;
}
</style>
<script>
	$(document).ready(function() {
		$('.dropbtn').on('click', function(event) {
			event.stopPropagation();
			var dropdownContent = $(this).next('.dropdown-content');
			$('.dropdown-content').not(dropdownContent).hide(); // 다른 드롭다운 닫기
			dropdownContent.toggle(); // 현재 드롭다운 토글
		});

		$(document).on('click', function() {
			$('.dropdown-content').hide(); // 외부 클릭 시 모든 드롭다운 닫기
		});
	});

	function changeSort(sort) {
		var diggingTopic = $("#diggingTopic").val();
		var url = "${contextPath}/digging/main?sort=" + sort + "&diggingTopic="
				+ diggingTopic;
		location.href = url;
	}
	var diggingTopic = "";
	$().ready(function() {
		diggingTopic = $
		{
			diggingTopic
		}
		;
		$("#onePageViewCnt").val("${onePageViewCnt}");
		$("#diggingTopic").val("${diggingTopic}");
	});

	function getDiggingList() {
		var sort = $("[name='sort']").val();
		var url = "${contextPath }/digging/main"
		url += "?onePageViewCnt=" + $("#onePageViewCnt").val();
		url += "&diggingTopic=" + $("#diggingTopic").val();
		if (sort != "")
			url += "&sort=" + sort;
		location.href = url;
	}

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
			});
		}
	}
	function changeSort() {
		var sort = $("#sort").val();
		if (sort == '') {
			return false;
		}
		var diggingTopic = $("#diggingTopic").val();
		var url = "${contextPath}/digging/main"
		url += "?sort=" + sort;
		url += "&diggingTopic=" + diggingTopic
		location.href = url;
	}
</script>
</head>
<body>
	<section align="center">
		<div class="head-wrap">
		</div>
	</section>
	<div class="container">
		<div class="row">
			<div class="col-lg-4 col-md-5">
				<div class="blog__sidebar">
					<div class="blog__sidebar__search"></div>
					<div class="blog__sidebar__item">
						<div class="blog__sidebar__item">
							<h4>
								<img alt=""
									src="${contextPath}/resources/bootstrap/img/icon/user.PNG"
									height="40" width="40"> ${diggingTopic }
							</h4> 
							<ul>
								<li><a
									href="${contextPath }/digging/main?diggingTopic=${diggingTopic }">전체</a></li>
								<c:forEach var="digDTO" items="${digList }">
									<c:choose>
										<c:when test="${empty digDTO.dig}">
	                            				********
	                            			</c:when>
										<c:otherwise>
											<li><a
												href="${contextPath }/digging/main?diggingTopic=${digDTO.diggingTopic }&dig=${digDTO.dig}">
													| ${digDTO.dig } </a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</ul>
						</div>
						<h4>
							<img alt="" src="${contextPath}/resources/bootstrap/img/hot.png">
							인기 게시물
						</h4>
						<br>
						<div class="blog__sidebar__recent">
							<c:forEach var="diggingDTO" items="${populerList }">
								<div class="digging__sidebar__populer__List__file">
									<c:choose>
										<c:when test="${diggingDTO.file != ''}">
											<img src="${contextPath}/thumbnails?file=${diggingDTO.file}"
												alt="" width="50" height="50">
										</c:when>
									</c:choose>
								</div>
								<div class="digging__sidebar__populer__text">
									<i class="fa fa-calendar-o"></i>
									<fmt:formatDate value="${diggingDTO.enrollDT }" pattern="MM-dd" />
									<span>&emsp;&emsp;${diggingDTO.writer}</span> <a
										href="${contextPath }/digging/diggingDetail?diggingId=${diggingDTO.diggingId}">
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
						<div class="card border-light mb-3">
							<div class="card-header" style="background: white">
								<ul style="list-style: none;">
									<li style="float: left;"><select id="sort"
										onchange="changeSort()">
											<option value="readCnt">정 렬</option>
											<option value="readCnt">인기많은순</option>
											<option value="thumbsUp">추천순</option>
											<option value="recent">최신순</option>
									</select></li>
								</ul>
								<div align="right">
									<ul>
										<li style="float: left;"><select id="onePageViewCnt"
											onchange="getDiggingList()">
												<option>10</option>
												<option>5</option>
										</select></li>
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
							<c:set var="startDiggingIdx"
								value="${startDiggingIdx = startDiggingIdx + 1}" />
							<div class="card mb-3" style="background: whitesmoke">
								<div class="card-body">
									<span>${startDiggingIdx }. </span>
									<h5 align="center">
										<a
											href="${contextPath }/digging/diggingDetail?diggingId=${diggingDTO.diggingId}"><strong>${diggingDTO.subject }</strong></a>
									</h5>
									<hr>
									<c:choose>
										<c:when test="${diggingDTO.profile eq null }">
											<span><img
												src="${contextPath}/resources/bootstrap/img/icon/profile.jpg"
												width="40" height="40"> ${diggingDTO.writer } </span>
											<span>&emsp;<i class="fa fa-calendar-o"></i> <fmt:formatDate
													value="${diggingDTO.enrollDT }" pattern="yyyy-MM-dd" /></span>
										</c:when>
										<c:otherwise>
											<span><img
												src="${contextPath }/thumbnails?file=${diggingDTO.profile }"
												alt="프로필이미지" width="40" height="40">${diggingDTO.writer }
											</span>
											<span>&emsp;<i class="fa fa-calendar-o"></i> <fmt:formatDate
													value="${diggingDTO.enrollDT }" pattern="yyyy-MM-dd" /></span>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="card-body">
									<p class="card-text">
										<a
											href="${contextPath }/digging/diggingDetail?diggingId=${diggingDTO.diggingId}">
											${diggingDTO.content } <span style="color: blue">더보기</span>
										</a>
									</p>
								</div>
								<div class="card-footer" style="background: white">
									&emsp;<a
										href="javascript:updateThumb(${diggingDTO.diggingId })"
										class="card-link"><img alt=""
										src="${contextPath }/resources/bootstrap/img/thumbs.PNG"
										width="40" height="40" id="thumbsUp" /> <span
										id="updateThumbs${diggingDTO.diggingId }">${diggingDTO.thumbsUp }</span></a>
									&emsp;&emsp;<a href="#" class="card-link"><img alt=""
										src="${contextPath }/resources/bootstrap/img/comment.png" />
										${diggingDTO.replyCnt }</a> &emsp;&emsp;<a href="#"
										class="card-link"><img alt=""
										src="${contextPath }/resources/bootstrap/img/show.png" />
										${diggingDTO.readCnt }</a> <input type="hidden"
										value="${diggingDTO.diggingId }" /> <input type="hidden"
										id="diggingTopic" value="${diggingTopic}" />
								</div>
							</div>
						</c:forEach>
						<input type="hidden" name="sort" value="${sort }" />
					</div>
				</div>
				<div class="product__pagination blog__pagination" align="center">
					<c:choose>
						<c:when test="${sort == null }">
							<c:if test="${startPage > 10 }">
								<a
									href="${contextPath }/digging/main?currentPageNumber=${startPage - 10}&onePageViewCnt=${onePageViewCnt}&diggingTopic=${diggingTopic}">이전</a>
							</c:if>
							<c:forEach var="i" begin="${startPage }" end="${endPage }">
								<a
									href="${contextPath }/digging/main?currentPageNumber=${i}&onePageViewCnt=${onePageViewCnt}&diggingTopic=${diggingTopic}">${i }</a>
							</c:forEach>
							<c:if test="${endPage != allPageCnt && endPage >= 10 }">
								<a
									href="${contextPath }/digging/main?currentPageNumber=${startPage + 10}&onePageViewCnt=${onePageViewCnt}&diggingTopic=${diggingTopic}">다음</a>
							</c:if>
						</c:when>
						<c:otherwise>
							<c:if test="${startPage > 10 }">
								<a
									href="${contextPath }/digging/main?currentPageNumber=${startPage - 10}&onePageViewCnt=${onePageViewCnt}&diggingTopic=${diggingTopic}&sort=${sort}">이전</a>
							</c:if>
							<c:forEach var="i" begin="${startPage }" end="${endPage }">
								<a
									href="${contextPath }/digging/main?currentPageNumber=${i}&onePageViewCnt=${onePageViewCnt}&diggingTopic=${diggingTopic}&sort=${sort}">${i }</a>
							</c:forEach>
							<c:if test="${endPage != allPageCnt && endPage >= 10 }">
								<a
									href="${contextPath }/digging/main?currentPageNumber=${startPage + 10}&onePageViewCnt=${onePageViewCnt}&diggingTopic=${diggingTopic}&sort=${sort}">다음</a>
							</c:if>
						</c:otherwise>
					</c:choose>
				</div>
				<br> <br>
			</div>
		</div>
	</div>

</body>
</html>