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
        <a href="https://demos.themeselection.com/sneat-bootstrap-html-admin-template/html/vertical-menu-template/" target="_blank" class="footer-text fw-bold">Sneat</a> ©
      </div>
      <div>
        <div class="form-check form-control-sm footer-link me-3">
          <input class="form-check-input" type="checkbox" value="" id="customCheck2" checked="">
          <label class="form-check-label" for="customCheck2">
            Show
          </label>
        </div>
        <div class="dropdown dropup footer-link me-3">
          <button type="button" class="btn btn-sm btn-outline-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Currency
          </button>
          <div class="dropdown-menu dropdown-menu-end">
            <a class="dropdown-item" href="javascript:void(0);"><i class="bx bx-dollar"></i> USD</a>
            <a class="dropdown-item" href="javascript:void(0);"><i class="bx bx-euro"></i> Euro</a>
            <a class="dropdown-item" href="javascript:void(0);"><i class="bx bx-pound"></i> Pound</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="javascript:void(0);"><i class="bx bx-bitcoin"></i> Bitcoin</a>
          </div>
        </div>
        <a href="javascript:void(0)" class="btn btn-sm btn-outline-danger"><i class="bx bx-log-out-circle me-1"></i>Logout</a>
      </div>
    </div>

</body>
</html>