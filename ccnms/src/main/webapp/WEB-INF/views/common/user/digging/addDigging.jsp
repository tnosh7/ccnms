<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	 li{
		 list-style-type: none;
	 }

	[type="radio"] {
	  vertical-align: middle;
	  appearance: none;
	}
</style>
<body>
	<div align="center" style="padding-top: 50px">
		<form action="#" method="post">
	    <div class="content-wrapper">
	       <div class="container" align="center">
	           <!-- Content -->
	             <div class="row">
	               <div class="col-md-12">
	                 <ul class="nav nav-pills flex-column flex-md-row mb-3">
	                   <li class="nav-item">
	                     <a class="nav-link active" href="javascript:void(0);"><i class="bx bx-user me-1"></i>글쓰기</a>
	                   </li>
	                   <li class="nav-item">
	                     <a class="nav-link" href="pages-account-settings-notifications.html"
	                       ><i class="bx bx-bell me-1"></i>동영상&이미지</a
	                     >
	                   </li>
	                   <li class="nav-item">
	                     <a class="nav-link" href="pages-account-settings-connections.html"
	                       ><i class="bx bx-link-alt me-1">지도</i> </a
	                     >
	                   </li>
	                 </ul>
	                 <div class="card mb-4">
	  				</div>
                   <div class="card-body">
                  	 	<ul >
	                  	 	<li>
	                  	 	<div >
	                  	 		<select name="diggingTopic" >
			  						<option>디깅 토픽 선택</option>
			  						<option>1</option>
			  						<option>2</option>
			  						<option>3</option>
			  						<option>3</option>
			  						<option>3</option>
			  						<option>3</option>
			  						<option>4</option>
		  						</select>
	                  	 	</div>
	                  	 	</li>
	                   		<li class="nav-item">
	                  	 	 <div class="form-group">
							  <input class="form-control form-control-lg" type="text" id="subject" name="subject"  placeholder="제목" id="inputLarge">
							</div>
	                   		</li>
	                   		<li class="nav-item"><textarea rows="10" cols="50" name="content" required></textarea>
								<script>CKEDITOR.replace("content");</script></li>
							<li>
							
							</li>
							<li>
								<div class="input-group">
    			                    <input type="file" class="form-control" id="inputGroupFile02">
                			        <label class="input-group-text" for="inputGroupFile02">Upload</label>
                 				</div>
							</li>
	                   		<li class="nav-item">	
	                   		<div class="demo-inline-spacing">
                        		<button type="button" class="btn btn-primary active">작성</button>
                        		<button type="button" class="btn btn-primary" onclick="">새로고침</button>
                      		</div>
							</li>
                   		</ul>
                   	</div>
                   	</div>
               	</div>
         	</div>
    	</div>
  	</form>
</div>

</body>
</html>