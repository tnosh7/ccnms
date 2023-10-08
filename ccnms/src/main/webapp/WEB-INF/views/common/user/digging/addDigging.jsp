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
  CKEDITOR.ClassicEditor.create(document.getElementById("editor"), {
    toolbar: {
      items: [
        //'exportPDF', 'exportWord', '|',
        'findAndReplace', 'selectAll', '|',
        'heading', '|',
        'bold', 'italic', 'strikethrough', 'underline', 'code', 'subscript', 'superscript', 'removeFormat', '|',
        'bulletedList', 'numberedList', 'todoList', '|',
        'outdent', 'indent', '|',
        'undo', 'redo', '|',
        'fontSize', 'fontFamily', 'fontColor', 'fontBackgroundColor', 'highlight', '|',
        'alignment', '|',
        'link', 'insertImage', 'blockQuote', 'insertTable', 'mediaEmbed', 'codeBlock', 'htmlEmbed', '|',
        'specialCharacters', 'horizontalLine', 'pageBreak', '|',
        'textPartLanguage', '|',
        'sourceEditing'
      ],
      shouldNotGroupWhenFull: true
    },
    list: {
      properties: {
        styles: true,
        startIndex: true,
        reversed: true
      }
    },
    heading: {
      options: [
        { model: 'paragraph', title: 'Paragraph', class: 'ck-heading_paragraph' },
        { model: 'heading1', view: 'h1', title: 'Heading 1', class: 'ck-heading_heading1' },
        { model: 'heading2', view: 'h2', title: 'Heading 2', class: 'ck-heading_heading2' },
        { model: 'heading3', view: 'h3', title: 'Heading 3', class: 'ck-heading_heading3' },
        { model: 'heading4', view: 'h4', title: 'Heading 4', class: 'ck-heading_heading4' },
        { model: 'heading5', view: 'h5', title: 'Heading 5', class: 'ck-heading_heading5' },
        { model: 'heading6', view: 'h6', title: 'Heading 6', class: 'ck-heading_heading6' }
      ]
    },
    placeholder: 'Welcome to CKEditor 5!',
    fontFamily: {
      options: [
        'default',
        'Arial, Helvetica, sans-serif',
        'Courier New, Courier, monospace',
        'Georgia, serif',
        'Lucida Sans Unicode, Lucida Grande, sans-serif',
        'Tahoma, Geneva, sans-serif',
        'Times New Roman, Times, serif',
        'Trebuchet MS, Helvetica, sans-serif',
        'Verdana, Geneva, sans-serif'
      ],
      supportAllValues: true
    },
    fontSize: {
      options: [10, 12, 14, 'default', 18, 20, 22],
      supportAllValues: true
    },
    htmlSupport: {
      allow: [
        {
          name: /.*/,
          attributes: true,
          classes: true,
          styles: true
        }
      ]
    },
    htmlEmbed: {
      showPreviews: true
    },
    link: {
      decorators: {
        addTargetToExternalLinks: true,
        defaultProtocol: 'https://',
        toggleDownloadable: {
          mode: 'manual',
          label: 'Downloadable',
          attributes: {
            download: 'file'
          }
        }
      }
    },
    mention: {
      feeds: [
        {
          marker: '@',
          feed: [
            '@apple', '@bears', '@brownie', '@cake', '@cake', '@candy', '@canes', '@chocolate', '@cookie', '@cotton', '@cream',
            '@cupcake', '@danish', '@donut', '@dragée', '@fruitcake', '@gingerbread', '@gummi', '@ice', '@jelly-o',
            '@liquorice', '@macaroon', '@marzipan', '@oat', '@pie', '@plum', '@pudding', '@sesame', '@snaps', '@soufflé',
            '@sugar', '@sweet', '@topping', '@wafer'
          ],
          minimumCharacters: 1
        }
      ]
    },
    removePlugins: [
      'ExportPdf',
      'ExportWord',
      'CKBox',
      'CKFinder',
      'EasyImage',
      'RealTimeCollaborativeComments',
      'RealTimeCollaborativeTrackChanges',
      'RealTimeCollaborativeRevisionHistory',
      'PresenceList',
      'Comments',
      'TrackChanges',
      'TrackChangesData',
      'RevisionHistory',
      'Pagination',
      'WProofreader',
      'MathType'
    ]
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
							  <input class="form-control form-control-lg" type="text" id="subject" name="subject" maxlength="30" placeholder="제목" >
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
            	<script src="https://apis.google.com/js/api.js"></script>
<script>
  /**
   * Sample JavaScript code for youtube.videos.list
   * See instructions for running APIs Explorer code samples locally:
   * https://developers.google.com/explorer-help/code-samples#javascript
   */

  function authenticate() {
    return gapi.auth2.getAuthInstance()
        .signIn({scope: "https://www.googleapis.com/auth/youtube.readonly"})
        .then(function() { console.log("Sign-in successful"); },
              function(err) { console.error("Error signing in", err); });
  }
  function loadClient() {
    gapi.client.setApiKey("YOUR_API_KEY");
    return gapi.client.load("https://www.googleapis.com/discovery/v1/apis/youtube/v3/rest")
        .then(function() { console.log("GAPI client loaded for API"); },
              function(err) { console.error("Error loading GAPI client for API", err); });
  }
  // Make sure the client is loaded and sign-in is complete before calling this method.
  function execute() {
    return gapi.client.youtube.videos.list({
      "part": [
        "snippet,contentDetails,statistics"
      ],
      "id": [
        "Ks-_Mh1QhMc"
      ]
    })
        .then(function(response) {
                // Handle the results here (response.result has the parsed body).
                console.log("Response", response);
              },
              function(err) { console.error("Execute error", err); });
  }
  gapi.load("client:auth2", function() {
    gapi.auth2.init({client_id: "YOUR_CLIENT_ID"});
  });
</script>
<button onclick="authenticate().then(loadClient)">authorize and load</button>
<button onclick="execute()">execute</button>
            	
       	<div class="card-body">
    </div>
   </div>
   </div>
   </div>
  </form>
</body>
</html>

	