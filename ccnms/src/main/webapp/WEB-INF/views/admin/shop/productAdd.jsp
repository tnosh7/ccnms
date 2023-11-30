<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<c:set var="adminId" value="${sessionScope.adminId }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	 li{
		 list-style-type: none;
	 }
  .ck-editor__editable[role="textbox"] {
    min-height: 300px;
  }

  .ck-content .image {
    max-width: 80%;
    margin: 20px auto;
  }

</style>
<script>

	$().ready(function(){
		$("form").submit(function(){
			var content= $("[name='content']").val();
			if (content.length == 0) {
				$("#contentWarn").html("[주의] 상품 소개는 필수 항목입니다. 상품 내용을 입력하세요.");
				return false;
			}
			if (content.length > 3000){
				$("#contentWarn").html("[주의] 내용은 3000자까지 입력 가능합니다.");
				return false;
			}
		})
	});
</script>
</head>
<body>
	<c:if test="${adminId eq null}">
		<script>
			location.href = "${contextPath }/admin/loginAdmin";
		</script>
	</c:if>		
	<form action="${contextPath }/admin/shop/productAdd" method="post" enctype="multipart/form-data"> 
	  <div class="container">
	            <div class="row">
	                <div class="col-lg-12 col-md-7">
	                  <div class="nav-align-top mb-4">
	                    <ul class="nav nav-tabs" role="tablist">
	                      <li class="nav-item">
	                        <button
	                          type="button"
	                          class="nav-link active"
	                          role="tab"
	                          data-bs-toggle="tab"
	                          data-bs-target="#navs-top-write"
	                          aria-controls="navs-top-write"
	                          aria-selected="true"
	                          value="write"
	                          id="writeBnt"
	                          name="writeBnt"
	                        >
	                     	  상품 판매 등록
	                        </button>
	                      </li>
	                    </ul>
	                    <div class="tab-content">
	                      <div class="tab-pane fade show active" id="navs-top-write" role="tabpanel">
		                      <div class="content-wrapper">
						       <div class="container">
						           <div class="row">
						               <div class="col-lg-12">
						                   <div class="breadcrumb__links">
						                   	<br>
						                       <a href="${contextPath }/admin/main"><i class="fa fa-home"></i> Home </a> >
						                       <span><a href="${contextPath }/admin/shop/shopList">상품 조회</a></span>
						                       <span> > 상품 등록</span>
						                   </div>
						               </div>
						           </div>
						       </div>
						   </div>
	                      <div class="card-body">
		                  	 	 <div class="form-group">
		                  	 	 	<table>
		                  	 	 		<tr>
		                  	 	 			<th width="35%">상품 이름</th>
		                  	 	 			<th> <input class="form-control form-control-lg" type="text" id="productNm" name="productNm" maxlength="35" placeholder="상품 이름을 입력하세요." ></th>
		                  	 	 		</tr>
		                  	 	 		<tr>
		                  	 	 			<th>분류</th>
			                  	 	 			<th><select name="sort" >
								  						<option value="ModuDigging">모두디깅</option>
							  						</select>
							  					</th>
		                  	 	 		</tr>
		                  	 	 		<tr>
		                  	 	 			<th>판매자</th>
		                  	 	 			<th><select name="writer" >
					                  	 			<option value="ModuDigging">모두디깅</option>
						  						</select></th>
		                  	 	 		</tr>
		                  	 	 		<tr>
		                  	 	 			<th>가격</th>
		                  	 	 			<th><input class="form-control form-control-lg" type="text" id="price" name="price" maxlength="20" placeholder="가격을 입력하세요(숫자만 입력)." ></th>
		                  	 	 		</tr>
		                  	 	 		<tr>
		                  	 	 			<th>할인율</th>
		                  	 	 			<th><input class="form-control form-control-lg" type="text" id="discountRate" name="discountRate" maxlength="35" placeholder="할인율을 입력하세요." ></th>
		                  	 	 		</tr>
		                  	 	 		<tr>
		                  	 	 			<th>재고</th>
		                  	 	 			<th><input class="form-control form-control-lg" type="number" id="stock" name="stock" maxlength="35" placeholder="재고를 입력하세요." ></th>
		                  	 	 		</tr>
		                  	 	 		<tr>
		                  	 	 			<th>배송 방법</th>
		                  	 	 			<th><select name="deliveryMethod">
			                  	 	 				<option>일반배송</option>
			                  	 	 				<option>편의점택배</option>
			                  	 	 				<option>반등기우편</option>
		                  	 	 				</select>
		                  	 	 			</th>
		                  	 	 		</tr>
		                  	 	 		<tr>
		                  	 	 			<th>배송 가격</th>
		                  	 	 			<th><input class="form-control form-control-lg" type="text" id="deliveryPrice" name="deliveryPrice" maxlength="35" placeholder="배송 가격을 입력하세요(숫자만 입력)."></th>
		                  	 	 		</tr>
		                  	 	 		<tr>
		                  	 	 			<th>상품 소개</th>
		                  	 	 			<th><textarea name="content" id="editor"></textarea>
													<script>
														  ClassicEditor
														  .create(document.querySelector('#editor'), {
																ckfinder: {
																	uploadUrl : '/image/upload'
																}
															})
															.then(editor => {
																console.log('Editor was initialized');
															})
													</script>
		                  	 	 			</th>
		                  	 	 		</tr>
		                  	 	 		<tr>
		                  	 	 			<th>파일 업로드</th>
		                  	 	 			<th> <input type="file" class="form-control" id="uploadfile" name="uploadfile">
		                  	 	 			</th>
		                  	 	 		</tr>
		                  	 	 		<tr align="center">
		                  	 	 			<th colspan="2">
		                  	 	 			 	<span id="contentWarn" style="color:red"></span>
		                  	 	 			</th>
	                  	 	 			</tr>
		                  	 	 	</table>
								</div>
		                   		<br>
		                   		<div class="demo-inline-spacing" align="center">
	                        		<button type="submit" class="btn btn-primary active">작성</button>
	                        		<button type="reset" class="btn btn-primary" onclick="window.location.reload()">새로고침</button>
	                      		</div>
		                   	</div>
	              	 	</div>
	                  </div>
                	 </div>
              		</div>
            	</div>
		    </div>
	  </form>
</body>
</html>