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

</style>
<body>
<form>
  <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-5">
                    <div class="sidebar">
                        <div class="sidebar__item">
                            <h4><img src="${contextPath }/resources/bootstrap/img/dig.PNG">디깅 포스팅 안내</h4>
                            <ul>
                                <li><a href="#">Fresh Meat</a></li>
                                <li><a href="#">Vegetables</a></li>
                                <li><a href="#">Fruit & Nut Gifts</a></li>
                                <li><a href="#">Fresh Berries</a></li>
                                <li><a href="#">Ocean Foods</a></li>
                                <li><a href="#">Butter & Eggs</a></li>
                                <li><a href="#">Fastfood</a></li>
                                <li><a href="#">Fresh Onion</a></li>
                                <li><a href="#">Papayaya & Crisps</a></li>
                                <li><a href="#">Oatmeal</a></li>
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
                          data-bs-target="#navs-top-home"
                          aria-controls="navs-top-home"
                          aria-selected="true"
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
                          data-bs-target="#navs-top-profile"
                          aria-controls="navs-top-profile"
                          aria-selected="false"
                        >
                          동영상 & 이미지
                        </button>
                      </li>
                      <li class="nav-item">
                        <button
                          type="button"
                          class="nav-link"
                          role="tab"
                          data-bs-toggle="tab"
                          data-bs-target="#navs-top-messages"
                          aria-controls="navs-top-messages"
                          aria-selected="false"
                        >
                          지도
                        </button>
                      </li>
                    </ul>
                    <div class="tab-content">
                      <div class="tab-pane fade show active" id="navs-top-home" role="tabpanel">
                      <div class="card-body">
                  	 	<ul >
	                  	 	<li>
	                  	 	<div >
	                  	 		<select name="diggingTopic" >
			  						<option>디깅 토픽 선택</option>
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
	                   		<li class="nav-item"><textarea rows="10" cols="50" name="content" required></textarea>
								<script>CKEDITOR.replace("content");</script></li>
							<li>
							
							</li>
							<li>
								<div class="input-group">
    			                    <input type="file" class="form-control" id="inputGroupFile02">
                			        <label class="input-group-text" for="inputGroupFile02">업로드</label>
                			        <label class="input-group-text" for="inputGroupFile02">삭제</label>
                 				</div>
							</li>
	                   		<li class="nav-item">	
	                   		<br>
	                   		<div class="demo-inline-spacing">
                        		<button type="submit" class="btn btn-primary active">작성</button>
                        		<button type="reset" class="btn btn-primary" onclick="window.location.reload()">새로고침</button>
                      		</div>
							</li>
                   		</ul>
                   	</div>
              	 	</div>
                  </div>
                </div>
              </div>
            </div>
       <div class="card-body">
    </div>
   </div>
  </form>
</body>
</html>

	