<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	a:visited { color:black; }
	a:hover { color:purple; }   
	tbody tr {
        transition: background-color 0.3s ease;
        cursor: pointer;
    }

    tbody tr:hover {
        background-color: #EBFBFF; 
    }
</style>
</head>
<body>
<section class="breadcrumb-section set-bg" data-setbg="${contextPath}/resources/bootstrap/img/banner/rank.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h1>랭킹</h1>
                        <div class="breadcrumb__option">
                            <span></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
 <section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="userRanking" >
                                    	유저랭킹
                                    </th>
                                    <th>조회수</th>
                                    <th>댓글수</th>
                                    <th>LIKE</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach var="rankingMap" items="${rankingMap }" varStatus="i">
                                <tr onclick="window.location.href='${contextPath}/ranking/otherUserInfo?userId=${rankingMap.userId}'">
                                    <td class="shoping__cart__item">
	                                        <h5>&emsp;${i.count }.</h5>&emsp;&emsp;
	                                      <c:choose>
	                       					<c:when test="${rankingMap.profile eq null}">
	                       						<img src="${contextPath}/resources/bootstrap/img/icon/profile.jpg" width="40" height="40">
	                       					</c:when>
	                       					<c:otherwise>
			                       				<img src="${contextPath }/thumbnails?file=${rankingMap.profile}"  width="40" height="40">
	                       					</c:otherwise>
	                       				  </c:choose>
                                        <h5><a href="${contextPath }/ranking/otherUserInfo?userId=${rankingMap.userId }">${rankingMap.userId }</a></h5>
                                    </td>
                                    <td>
                                    	${rankingMap.totalReadCnt }
                                    </td>
                                    <td>
                                    	${rankingMap.totalReplyCnt }
                                    </td>
                                    <td>    
                                        <h5> ${rankingMap.likePoint }</h5>
                                    </td>
                                </tr>
                            	</c:forEach>
                            </tbody>
                        </table>
                        <br> <br>
                            <table>
                            <thead style="font-color: grey;">
                                <tr>
                                    <th class="diggingRanking" align="left">
                                    	디깅랭킹
                                    </th>
                                    <th>조회수</th>
                                    <th>댓글수</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach var="diggingRankMap" items="${diggingRankMap }" varStatus="i">
                                <tr onclick="window.location.href='${contextPath }/digging/main?mainTitle=${diggingRankMap.mainTitleId}'">
                                    <td class="shoping__cart__item">
                                        <h5>&emsp;${i.count }.</h5>&emsp;&emsp;
                                        <h5><a href="${contextPath }/digging/main?mainTitle=${diggingRankMap.mainTitleId}">${diggingRankMap.mainTitle}</a></h5>
                                    </td>
                                    <td>
                                    	${diggingRankMap.totalReadCnt }
                                    </td>
                                    <td>
                                    	${diggingRankMap.totalReplyCnt }
                                    </td>
                                </tr>
                            	</c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
    	 </div>
    </section>

</body>
</html>