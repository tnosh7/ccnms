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
</style>
</head>
<body>
<section class="breadcrumb-section set-bg" data-setbg="${contextPath}/resources/bootstrap/img/banner/promopic.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>랭킹</h2>
                        <div class="breadcrumb__option">
                            <a href="${contextPath }/digging/main?diggingTopic=kPop">BTS 10주년을 KPOP디깅에서 함께 축하해주세요!</a>
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
                                    <th class="shoping__product" colspan="2">
                                    	<h3>유저랭킹</h3>
                                    </th>
                                    <th width="25" align="left">
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach var="rankingDTO" items="${rankingList }" varStatus="i">
                                <tr>
                                    <td class="shoping__cart__item">
	                                        <h5>&emsp;${i.count }.</h5>&emsp;&emsp;
	                                      <c:choose>
	                       					<c:when test="${rankingDTO.profile eq null}">
	                       						<img src="${contextPath}/resources/admin/assets/img/avatars/2.png" width="40" height="40">
	                       					</c:when>
	                       					<c:otherwise>
			                       				<img src="${contextPath }/thumbnails?file=${rankingDTO.profile}"  width="40" height="40">
	                       					</c:otherwise>
	                       				  </c:choose>
                                        <h5><a href="${contextPath }/ranking/otherUserInfo?userId=${rankingDTO.userId }">${rankingDTO.userId }</a></h5>
                                        <h5>LIKE : ${rankingDTO.likePoint }</h5>
                                    </td>
                                </tr>
                            	</c:forEach>
                            </tbody>
                        </table>
                        <br>
                            <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product" colspan="2">
                                    	<h3>디깅랭킹</h3>
                                    </th>
                                    <th width="25" align="left">
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach var="diggingRank" items="${diggingRankList }" varStatus="i">
                                <tr>
                                    <td class="shoping__cart__item">
                                        <h5>&emsp;${i.count }.</h5>&emsp;&emsp;
                                        <h5><a href="${contextPath }/digging/main?diggingTopic=${diggingRank.diggingTopic}">${diggingRank.diggingTopic}</a></h5>
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