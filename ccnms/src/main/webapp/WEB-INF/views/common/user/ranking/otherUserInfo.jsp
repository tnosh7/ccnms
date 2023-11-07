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
  <div class="content-wrapper" style="padding-top: 50px">
	       <div class="container">
	           <div class="row">
	               <div class="col-lg-12">
	                   <div class="breadcrumb__links">
	                       <a href="${contextPath }/"><i class="fa fa-home"></i> Home  </a>
	                       <span> > 유저 게시글</span>
	                   </div>
	               </div>
	           </div>
	       </div>
	   </div>	
 <section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                            <div class="col-md mb-4 mb-md-0">
                            	<div class="tab-pane" id="tabs-2" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <div align="center">
	                                    <h4>${otherUserId}님 게시글</h4>
                                    </div>
                                    <br>
                                    <c:forEach var="diggingDTO" items="${diggingList}" varStatus="i">
	                                    <a href="${contextPath }/digging/diggingDetail?diggingId=${diggingDTO.diggingId}" class="list-group-item list-group-item-action flex-column align-items-start">
				                            <div class="d-flex justify-content-between w-100">
				                              <h6>${i.count}. &emsp;${diggingDTO.subject }</h6>
				                              <small class="text-muted">${diggingDTO.enrollDT }</small>
				                            </div>
			                          	</a>
                                    </c:forEach>
                                </div>
                            </div>
                			</div>
                			<br>
                			<br>
			              <div class="col-lg-12" align="center">
			                 <div class="product__pagination blog__pagination">
			                     <a href="#">1</a>
			                     <a href="#">2</a>
			                     <a href="#">3</a>
			                     <a href="#"><i class="fa fa-long-arrow-right"></i></a>
			                 </div>
				         </div>
				        </div>
				       </div>
				      </div>
			    	</div>
			    </section>

</body>
</html>