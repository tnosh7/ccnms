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
      <div class="container-fluid d-flex flex-md-row flex-column justify-content-between align-items-md-center gap-1 container-p-x py-3">
      <div>
        <a href="https://demos.themeselection.com/ModuDigging-bootstrap-html-admin-template/html/vertical-menu-template/" target="_blank" class="footer-text fw-bold">ModuDigging</a> ©
      </div>
      <div>
        <a href="${contextPath }/admin/logout" class="btn btn-sm btn-outline-danger"><i class="bx bx-log-out-circle me-1"></i>로그아웃</a>
      </div>
    </div>

</body>
</html>