<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$().ready(function(){
		var diggingTopic = $("[name='diggingTopic']").val();
		$("[name='diggingTopic']").change(function(){
			if (diggingTopic == "1") {
				$("#topicWarn").html("디깅 토픽을 선택해주세요.");
				return;
			}
			else {
				$("#topicWarn").html("");
				return;
			}
		});
	});
	

</script>
</head>
<style>
	 li{
		 list-style-type: none;
	 }
.ck.ck-editor {
	width: 100%;
	max-width: 1000px;
	margin: 0 auto;
}

.ck-editor__editable {
	height:40vh;
}

</style>
<body>
<form action="${contextPath }/digging/addDigging" method="post" enctype="multipart/form-data"> 
  <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-5">
                    <div class="sidebar">
                        <div class="sidebar__item">
                            <h4><img src="${contextPath }/resources/bootstrap/img/dig.PNG" width="30" height="30">디깅 포스팅 안내</h4>
                            <ul>
                                <li>1. 포스팅 주의사항 어쩌구</li>
                                <li>2. 포스팅 주의사항 어쩌구</li>
                                <li>3. 포스팅 주의사항 어쩌구</li>
                                <li>4. 포스팅 주의사항 어쩌구</li>
                                <li>5. 포스팅 주의사항 어쩌구</li>
                            </ul>
                        </div>
                        <div class="sidebar__item">
                            <div class="latest-product__text">
                                <h4>Latest Products</h4>
                                <div class="latest-product__slider owl-carousel">
                                    <div class="latest-prdouct__slider__item">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 col-md-7">
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
                     	  글쓰기
                        </button>
                      </li>
                      <li class="nav-item">
                        <button
                          type="button"
                          class="nav-link"
                          role="tab"
                          data-bs-toggle="tab"
                          data-bs-target="#navs-top-img"
                          aria-controls="navs-top-img"
                          aria-selected="false"
                          id="imgBnt"
                          name="imgBnt"
                        >
                          지도
                        </button>
                      </li>
                    </ul>
                    <div class="tab-content">
                      <div class="tab-pane fade show active" id="navs-top-write" role="tabpanel">
                      <div class="card-body">
                  	 	<ul >
	                  	 	<li>
	                  	 	<div >
	                  	 		<select name="diggingTopic" >
			  						<option value="1">[필수] 디깅 토픽 선택</option>
			  						<option value="game">게임</option>
			  						<option value="kPop">K-POP</option>
			  						<option value="ott">OTT</option>
			  						<option value="animal">동물 & 애완동물</option>
			  						<option value="business">비즈니스</option>
			  						<option value="sport">스포츠</option>
			  						<option value="celeb">연예인</option>
			  						<option value="trevel">여행</option>
			  						<option value="fashion">패션</option>
		  						</select>
	                  	 	</div>
	                  	 	&emsp;<span id="topicWarn" style="color:red"></span>
	                  	 	</li>
	                  	 	<li>
	                  	 	<div >
	                  	 		<select name="writer" >
	                  	 			<option>choose</option>
			  						<option>${sessionScope.userId }</option>
		  						</select>
	                  	 	</div>
	                  	 	</li>
	                   		<li class="nav-item">
	                  	 	 <div class="form-group">
							  <input class="form-control form-control-lg" type="text" id="subject" name="subject"  placeholder="제목" id="inputLarge">
							</div>
	                   		</li>
	                   		<li class="nav-item"><textarea name="content" id="editor"></textarea>
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
								</li>
							<li>
							
							</li>
							<li>
								<div class="input-group">
    			                    <input type="file" class="form-control" id="uploadfile" name="uploadfile">
                			        <label class="input-group-text" for="inputGroupFile02" id="uploadFileBtn" name="uploadFile"">업로드</label>
                			        <label class="input-group-text" for="inputGroupFile02" id="deleteFile" name="deleteFile">삭제</label>
                 				</div>
							</li>
	                   		<li class="nav-item">	
	                   		<br>
	                   		<div class="demo-inline-spacing" align="center">
                        		<button type="submit" class="btn btn-primary active">작성</button>
                        		<button type="reset" class="btn btn-primary" onclick="window.location.reload()">새로고침</button>
                      		</div>
							</li>
                   		</ul>
                   	</div>
              	 	</div>
                  </div>
                     <div class="tab-pane fade" id="navs-top-img" role="tabpanel">
                      <div class="card-body">
                      	<ul>
                      		<li>
                      			<input type="text">sdsdsddsdsd
                      		</li>
                      	</ul>
                	 </div>
              		</div>
            	</div>
       	<div class="card-body">
    </div>
   </div>
   </div>
   </div>
  </form>
</body>
</html>

	