<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>404</title>
</head>
<body>
	<div align="center"> 
		<br>
		<br>
		<br>
		<img src="${contextPath }/resources/bootstrap/img/logo.png" width="300">
		<h3>Page Not Found</h3>
		<img src="${contextPath }/resources/admin/assets/img/illustrations/page-misc-error-light.png" width="600" height="400">
		<h4>페이지를 찾을 수 없습니다.</h4>
		<a href="${contextPath }/"> 메인 페이지로 이동 </a>
	</div>
	
</body>
</html>