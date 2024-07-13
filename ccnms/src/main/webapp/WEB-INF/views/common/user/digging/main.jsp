<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
.no-posts {
    height: 500px; /* 최소 높이를 설정하여 틀이 무너지지 않도록 함 */
    display: flex;
    justify-content: center;
    align-items: center;
    background: whitesmoke;
}
.inline-list {
    display: inline;
}
.inline-list li {
    display: inline;
    margin-right: 10px; /* 항목 간의 간격을 조절합니다 */
}

    
.diggingMain-center {
	 display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
}
.row-subTitle {
	 font-size: 30px;
	 text-align: center;
	 margin: 20px;
}
.row-populerList{
 text-align: center;

}
.digging__sidebar__populer__item {
    display: flex;
    align-items: center;
    margin-bottom: 10px;
        margin-left: 32%;  /* 왼쪽 마진 20% */
    margin-right: 32%; 
    font-size:20px;/* 오른쪽 마진 20% */
}

.digging__sidebar__populer__file {
    flex-shrink: 0;
    margin-right: 10px;
}

.digging__sidebar__populer__text {
    display: flex;
    flex-grow: 1;
    align-items: center;
    padding-left: 10px;
}

.digging__sidebar__populer__index {
    flex-shrink: 0;
    width: 30px; /* 인덱스 칸의 고정 크기 */
}

.digging__sidebar__populer__details {
    display: flex;
    justify-content: space-between;
    width: 100%;
}

.digging__sidebar__populer__title {
    flex-grow: 1;
    text-align: left;
    margin-right: 20px;
    margin-left: 50px;
}

.digging__sidebar__populer__date {
    flex-shrink: 0;
    text-align: right;
    width: 80px; /* 날짜 칸의 고정 크기 */
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
		var mainTitle = $("#mainTitle").val();
		var url = "${contextPath}/digging/main?sort=" + sort + "&mainTitle="
				+ mainTitle;
		location.href = url;
	}
	var mainTitle = "";
	$().ready(function() {
		mainTitle = ${mainTitle};
		$("#onePageViewCnt").val("${onePageViewCnt}");
		$("#mainTitle").val("${mainTitle}");
	});

	function getDiggingList() {
		var sort = $("[name='sort']").val();
		var url = "${contextPath }/digging/main"
		url += "?onePageViewCnt=" + $("#onePageViewCnt").val();
		url += "&mainTitle=" + ${mainTitle};
		if (sort != "")
			url += "&sort=" + sort;
			location.href = url;
	}

	function changeSort() {
		var sort = $("#sort").val();
		if (sort == '') {
			return false;
		}
		var mainTitle = ${mainTitle};
		var url = "${contextPath}/digging/main"
		url += "?sort=" + sort;
		url += "&mainTitle=" + mainTitle
		location.href = url;
	}
	function updateThumb(diggingId) {
		if ("${sessionId}" === "" && "${adminId}" === "") {
			Swal.fire({
				icon: 'info',
				title: '로그인 후에 이용가능합니다.',
				footer: '<a href="${contextPath}/user/loginUser">로그인 페이지로 이동하기</a>'
			});
		} else {
			$.ajax({
				url: "${contextPath}/updateThumbsUp",
				type: "get",
				data: { "diggingId": diggingId },
				success: function(data){
					$("#updateThumbs").html(data);
				}
			});
		}
	}

</script>
</head>
<body>
	<div class="container" style="width: 100%; height: 35%; background-image: url('${contextPath}/resources/bootstrap/img/header/${currentMainId}.jpg'); background-size: cover; background-repeat: no-repeat; background-position: center;"></div>
	<div class="row-subTitle">
		<c:set var="previousMainId" value="" />
		<c:forEach var="joinedTitleList" items="${joinedTitleList}">
		    <c:if test="${joinedTitleList.mainId == currentMainId}">
		        <c:if test="${joinedTitleList.mainId != previousMainId}">
		            <c:set var="previousMainId" value="${joinedTitleList.mainId}" /><span onclick="location.href='${contextPath}/digging/main?mainTitle=${joinedTitleList.mainId}'">| 전체 | &ensp;</span>
		        </c:if>
		        <ul class="inline-list">
		            <li>
		                <a href="${contextPath}/digging/main?mainTitle=${joinedTitleList.mainId}&subTitle=${joinedTitleList.subId}"><span class="subTitle-menu">| ${joinedTitleList.subTitle} |</span></a>
		            </li>
		        </ul>
		    </c:if>
		</c:forEach>
		</div>
		<hr>
		<div class="row-populerList">
		<h4 style="color:navy; font-weight: bold;">
			<img alt="" src="${contextPath}/resources/bootstrap/img/hot.png">인기 게시물
		</h4>
		<br>
	<c:forEach var="diggingDTO" varStatus="i" items="${populerList }">
    <div class="digging__sidebar__populer__item">
        <div class="digging__sidebar__populer__text">
            <div class="digging__sidebar__populer__index">
                ${i.index + 1}. &ensp;
            </div>
            <div class="digging__sidebar__populer__details">
                <span onclick="location.href='${contextPath}/digging/diggingDetail?diggingId=${diggingDTO.diggingId}'">${diggingDTO.subject}</span>
                <span class="digging__sidebar__populer__date">
                    <i class="fa fa-calendar-o"></i>
                    <fmt:formatDate value="${diggingDTO.enrollDT}" pattern="MM-dd" />
                </span>
            </div>
        </div>
    </div>
</c:forEach>
		<hr>
	</div>
	
	<section class="diggingMain-center">
			<div class="col-lg-8 col-md-7">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12">
						<div class="card border-light mb-3">
							<div class="card-header" style="background: white">
								    <!-- 정렬 옵션을 선택할 수 있는 드롭다운 메뉴 -->
			                        <ul style="list-style: none;">
			                            <li style="float: left;">
			                                <select id="sort" onchange="changeSort()">
			                                    <option value="readCnt">정 렬</option>
			                                    <option value="readCnt">인기많은순</option>
			                                    <option value="thumbsUp">추천순</option>
			                                    <option value="recent">최신순</option>
			                                </select>
			                            </li>
			                        </ul>
								   <!-- 한 페이지에 표시할 게시글 수를 선택할 수 있는 드롭다운 메뉴 -->
			                        <div align="right">
			                            <ul>
			                                <li style="float: left;">
			                                    <select id="onePageViewCnt" onchange="getDiggingList()">
			                                        <option>10</option>
			                                        <option>5</option>
			                                    </select>
			                                </li>
			                            </ul>
			                        </div>
			                    </div>
			                </div>
						<c:choose>
							<c:when test="${empty diggingList }">
								<div class="no-posts"  align="center">
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
											${diggingDTO.content } <span style="color:navy">더보기</span>
										</a>
									</p>
								</div>
								 <div class="card-footer" style="background: white">
		                            <!-- 추천, 댓글, 조회수 아이콘 및 숫자를 표시 -->
		                            &emsp;
		                            <a href="javascript:updateThumb(${diggingDTO.diggingId})" class="card-link">
		                                <img alt="" src="${contextPath}/resources/bootstrap/img/thumbs.PNG" width="40" height="40" id="thumbsUp" />
		                                <span id="updateThumbs${diggingDTO.diggingId}">${diggingDTO.thumbsUp}</span>
		                            </a>
		                            &emsp;&emsp;
		                            <a href="#" class="card-link">
		                                <img alt="" src="${contextPath}/resources/bootstrap/img/comment.png" />
		                                ${diggingDTO.replyCnt}
		                            </a>
		                            &emsp;&emsp;
		                            <a href="#" class="card-link">
		                                <img alt="" src="${contextPath}/resources/bootstrap/img/show.png" />
		                                ${diggingDTO.readCnt}
		                            </a>
		                             <input type="hidden" id="mainTitle" value="${mainTitle}"/>
		                             <!-- 현재 정렬 방식을 저장하는 히든 필드 -->
		                            <input type="hidden" value="${diggingDTO.diggingId}" />
		                        </div>
							</div>
						</c:forEach>
						<input type="hidden" name="sort" value="${sort }" />
					</div>
				</div>
				<div class="product__pagination blog__pagination" align="center">
			    <!-- 현재 정렬 옵션이 없는 경우와 있는 경우를 구분하여 처리 -->
			    <c:choose>
			        <c:when test="${sort == null }">
			            <c:if test="${startPage > 10 }">
			                <a href="${contextPath}/digging/main?currentPageNumber=${startPage - 10}&onePageViewCnt=${onePageViewCnt}&mainTitle=${mainTitle}">이전</a>
			            </c:if>
			            <c:forEach var="i" begin="${startPage}" end="${endPage}">
			                <a href="${contextPath}/digging/main?currentPageNumber=${i}&onePageViewCnt=${onePageViewCnt}&mainTitle=${mainTitle}">${i}</a>
			            </c:forEach>
			            <c:if test="${endPage != allPageCnt && endPage >= 10 }">
			                <a href="${contextPath}/digging/main?currentPageNumber=${startPage + 10}&onePageViewCnt=${onePageViewCnt}&mainTitle=${mainTitle}">다음</a>
			            </c:if>
			        </c:when>
			        <c:otherwise>
			            <c:if test="${startPage > 10 }">
			                <a href="${contextPath}/digging/main?currentPageNumber=${startPage - 10}&onePageViewCnt=${onePageViewCnt}&mainTitle=${mainTitle}&sort=${sort}">이전</a>
			            </c:if>
			            <c:forEach var="i" begin="${startPage}" end="${endPage}">
			                <a href="${contextPath}/digging/main?currentPageNumber=${i}&onePageViewCnt=${onePageViewCnt}&mainTitle=${mainTitle}&sort=${sort}">${i}</a>
			            </c:forEach>
			            <c:if test="${endPage != allPageCnt && endPage >= 10 }">
			                <a href="${contextPath}/digging/main?currentPageNumber=${startPage + 10}&onePageViewCnt=${onePageViewCnt}&mainTitle=${mainTitle}&sort=${sort}">다음</a>
			            </c:if>
			        </c:otherwise>
			    </c:choose>
			</div>
		</div>
</section>
</body>
</html>