<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section class="breadcrumb-section set-bg" data-setbg="${contextPath}/resources/bootstrap/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>랭킹</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html"></a>
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
                                    	<select name="sort">
                                    		<option>정렬</option>
                                    		<option>정렬</option>
                                    		<option>정렬</option>
                                    		<option>정렬</option>
                                    	</select>
                                    </th>
                                    <th width="25" align="left">
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach var="rankingDTO" items="${rankingList }" >
                                <tr>
                                    <td class="shoping__cart__item">
                                        <h5></h5>&emsp;&emsp;
                                        <a href="#"><img src="${contextPath }/ranking/thumbnails?file=${rankingDTO.profile}" alt=""width="100" height="100"></a>
                                        <h5><a href="#">${rankingDTO.userId }</a></h5>
                                        <h5><a href="#">LIKE : ${rankingDTO.likePoint }</a></h5>
                                    </td>
                                </tr>
                            	</c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
              <div class="col-lg-12" align="center">
                 <div class="product__pagination blog__pagination">
                     <a href="#">1</a>
                     <a href="#">2</a>
                     <a href="#">3</a>
                     <a href="#"><i class="fa fa-long-arrow-right"></i></a>
                 </div>
	         </div>
    	 </div>
    </section>

</body>
</html>