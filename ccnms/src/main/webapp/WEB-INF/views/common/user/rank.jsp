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
  <section class="breadcrumb-section set-bg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                    	<h3>랭킹</h3>
                        <div class="breadcrumb__option">
                            <span>넣기</span>
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
                                    <th class="shoping__product">
                                    	<select name="sort">
                                    		<option>정렬</option>
                                    		<option>정렬</option>
                                    		<option>정렬</option>
                                    		<option>정렬</option>
                                    	</select>
                                    </th>
                                    <th width="25">
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach var="i" begin="1" end="10" >
                                <tr>
                                    <td class="shoping__cart__item">
                                        <h5>${i*2-1}</h5>&emsp;&emsp;
                                        <img src="${contextPath }/resources/bootstrap/img/cart/cart-1.jpg" alt="">
                                        <h5>Vegetable’s Package</h5>
                                    </td>
                                    <td class="shoping__cart__item" colspan="5">
                                        <h5>${i*2 }</h5>&emsp;&emsp;
                                        <img src="${contextPath }/resources/bootstrap/img/cart/cart-1.jpg" alt="">
                                        <h5>Vegetable’s Package</h5>
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