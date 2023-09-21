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
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="${contextPath }/"><i class="fa fa-home"></i> Home > </a>
                        <span>Login</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
     <section class="checkout spad">
        <div class="container">
        	<form action="${contextPath }/admin/loginAdmin" method="post" class="checkout__form">
               <div class="col-lg-8">
                   <h4>로그인</h4>
                   <div class="row">
                       <div class="col-lg-12">
                           <div class="checkout__form__input">
                                 <label for="exampleInputEmail1" class="form-label mt-5">ID</label>
	    						 <input type="text" class="form-control" id="adminId" name="adminId" aria-describedby="emailHelp" placeholder="Enter ID" >
	     						 <small id="emailHelp" class="form-text text-muted"></small>
                           </div>
                           <div class="checkout__form__input">
                              <label for="exampleInputPassword1" class="form-label mt-4">Password</label>
	     					  <input type="password" class="form-control" id="passwd" name="passwd" placeholder="Password" autocomplete="off" >
                           </div>
                           <br>
                           <div align="right">
	                           <button type="submit" class="site-btn">로그인</button>
                           </div>
                           <div class="row">
			                <div class="col-lg-12">
			                </div>
			            </div>
                       </div>
                   </div>
               </div>
            </form>
        </div>
    </section>

</body>
</html>