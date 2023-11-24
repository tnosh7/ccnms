<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
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
		
			var diggingTopic= $("[name='diggingTopic']").val();
			if (diggingTopic == "null") {
				return false;
			}
		})
	});

</script>
</head>
<body>
<form action="${contextPath }/digging/addDigging" method="post" enctype="multipart/form-data"> 
  <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-5">
                    <div class="sidebar">
                        <div class="sidebar__item">
                        <br>
                            <h4><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAAY5JREFUSEvN1D1I1lEUx/GPRS5BRdDg4JDQJESQkLQGBk2VBBa4RARFDkFzCs46JNoQLkFJiFSDoEtrg5a4tDTUoktvVLQkqBy4z6A893//PfBAZ7pv535/59xzboc2W0eb71cHcAIPcBZnkqA1rGASX6tElgDDmMLRzCXfcROvc5AqwAgeJccFzOBNml/APVxO8xuYawbJAXrwEQdSeiYyCkcxhj84iS/7z+UAofYOXmCoUAhLuIiHGK8L2ERXetT1AmAAy3iHvrqAvziEg9guAI7jG341K4Zcin7iSHIIxyo7hh8InxjvsRwgajzCvYJXBcB1PMdbnK8LuJ+aaBXnKtIUij+k97qLx3UBnXiPXjzB7UwUzxA9EBH3NxNS1WinEF/CYTRTF2vT+I3T+PwvjdY4O4h5bCGabyNtdONTGl/Dy1a+iobPU8SfdAuzabGhPuaxnrXSZxeOjSqJaoqqClvEJVytUh8H6wB2CmVaecd/ASgEUL1dJ4K4IZemon/xQNLXdkDLaaobQcuAXVL1RRnaCiDMAAAAAElFTkSuQmCC"/>
                            &ensp;디깅 포스팅 안내</h4>
                            <ul>
                                <li><strong>1. 모두디깅은 모든 디깅을 위한 공간입니다. 다른 유저들을 존중해주세요.</strong></li>
                               	<hr>
                                <li><strong>2. 공지에 있는 디깅 룰을 읽어주세요.</strong></li>
                               	<hr>
                                <li><strong>3. 유튜브에서 동영상을 퍼올 때에는 유튜브 정책 상 동영상 아래에 있는 공유->퍼가기에 적힌 url을 입력하셔야 합니다.</strong></li>
                               	<hr>
                                <li><strong>4. 디깅 룰을 벗어난 글을 게시할 경우 관리자 관리하에 자동 삭제됩니다.</strong></li>
                               	<hr>
                            </ul>
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
			  						<option value="null">[필수] 디깅 토픽 선택</option>
			  						<option value="game">게임</option>
			  						<option value="kPop">K-POP</option>
			  						<option value="ott">OTT</option>
			  						<option value="animal">동물 & 애완동물</option>
			  						<option value="business">비즈니스</option>
			  						<option value="sport">스포츠</option>
			  						<option value="celeb">연예인</option>
			  						<option value="travel">여행</option>
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
							  <input class="form-control form-control-lg" type="text" id="subject" name="subject" maxlength="35" placeholder="제목" >
							</div>
	                   		</li>
	                   		<li class="nav-item"><textarea name="content" id="editor" maxlength="2900"></textarea>
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
								 <input class="form-control form-control-lg" type="text" id="tag" name="tag" maxlength="9" placeholder="태그 입력" >
							</li>
							<li>
								<div class="input-group">
    			                    <input type="file" class="form-control" id="uploadfile" name="uploadfile">
                			        <label class="input-group-text" for="inputGroupFile02" id="uploadFileBtn" name="uploadFile">업로드</label>
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

	