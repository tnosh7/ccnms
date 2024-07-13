<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<c:set var="admin" value="${sessionScope.adminId }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.table{
       table-layout:fixed;
       width: 100%;
     }
header {
  display: flex;
}

nav {
  margin-left: auto;
}
</style>
<script>
	$().ready(function(){
		
		$("#allCheck").change(function(){
			if($("#allCheck").prop("checked")) {
				$("[name='adminCheck']").prop("checked", true);			
			}
			else if($("#allCheck").prop("checked", false)) {
				$("[name='adminCheck']").prop("checked", false);	
			}
		});
		
			$("[name='searchKeyword']").keyup(function(){
					var param = {
							"searchKeyword" : $("[name='searchKeyword']").val(),
							"searchKey" : $("[name='searchKey']").val()
					}
					$.ajax ({
						type : "get",
						url  : "${contextPath}/admin/management/searchAdmin",
						data : param,
						success : function(data) {
							
							var adminList = "";
							if(data.length == 0) {
								adminList +="<tr colspan='5'>"
								adminList +="<td>검색결과가 없습니다.</td>"
								adminList +="</tr>"
						}
							else {
								$(data).each(function(){
									adminList +="<tr>"
									adminList +="<td><input type='checkbox' id='adminCheck' name='adminCheck'></td>"
									adminList +="<td>" + this.adminId+ "</td>"
									adminList +="<td>" + this.adminNm+ "</td>"
									adminList +="<td>" + this.adminRank+ "</td>"
									   var joinDt = new Date(this.joinDt);
						    		   var year = joinDt.getFullYear();
						    		   var month = joinDt.getMonth() + 1;
						    		   if (month < 10) month = "0" + month;
						    		   var date = joinDt.getDate();
						    		   if (date < 10) date = "0" + date;
						    		   adminList   += "<td>"+ year + "-" + month + "-" + date + "</td>";
									   adminList +="</tr>"
								});
							}
						$("#adminList").html(adminList);
						}
					})
			});		
		});
</script>
</head>
<body>
<fieldset>
<section>
  <div class="row">
     <div class="col-xl">
       <div class="card mb-4">
         <div class="card-header d-flex justify-content-between align-items-center">
         </div>
         <div class="card-body">
		<nav
         class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
         id="layout-navbar"
       	>
        <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0   d-xl-none ">
       <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
         <i class="bx bx-menu bx-sm"></i>
       </a>
     	</div>
         <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
           <!-- Search -->
           <div class="navbar-nav align-items-center">
             <div class="nav-item d-flex align-items-center">
               <input
                 type="text"
                 class="form-control border-0 shadow-none"
                 placeholder="관리자 페이지 입니다."
                 aria-label="Search..."
               />
             </div>
           </div>
        </div>
     </nav>
         <form>
         <hr>
           <div class="mb-3">
           <header>
              <h5 class="card-header">
              <img alt="아이디카드" src="${contextPath }/resources/bootstrap/img/id.png"/><strong> 고객문의 조회</strong></h5>
           </header>
           </div>
           <hr>
              </form>
              <form action="${contextPath }/admin/contact/addReply" method="post">
                <table class="table">
                    <tr align="center">
                      <th width="15%">아이디</th>
                      <td>
                      	${contactDTO.userId }
                      	<input type="hidden" name="contactCd" value="${contactDTO.contactCd}">
                      </td>
                    </tr>
                    <tr align="center">
                      <th>등록날짜</th>
                      <td><fmt:formatDate value="${contactDTO.regDt }" pattern="yyyy-MM-dd"/> </td>
                    </tr>
                    <tr align="center">
                      <th>제목</th>
                      <td><i class="fab fa-angular fa-lg text-danger me-3"></i>${contactDTO.subject }</td>
                    </tr>
                    <tr align="center">
                      <th>내용</th>
                      <td><i class="fab fa-angular fa-lg text-danger me-3"></i>${contactDTO.content }</td>
                    </tr>
                    	<c:choose>
							<c:when test="${contactDTO.reply eq null}">
			                    <tr height="50"  align="center">
            			        	<th>답글</th>
		                	    	<td><textarea name="reply"  rows="5" cols="50"></textarea></td>
			                    </tr>
			                    <tr align="center">
			                    	<th></th>
			                    	<td><button type="submit" class="btn btn-outline-dark">등록</button></td>
			                    </tr>
							</c:when>                    	
							<c:otherwise>
			                    <tr height="50"  align="center">
            			        	<th>답글</th>
									<td>${contactDTO.reply }</td>
								</tr>
							</c:otherwise>
                    	</c:choose>
                </table>
              </form>
                <br>
             </div>
           </div>
         </div>
      </div>
   </section> 
</fieldset>
</html>