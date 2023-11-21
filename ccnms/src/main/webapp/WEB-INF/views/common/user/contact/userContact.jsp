<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<c:set var="sessionId" value="${sessionScope.userId }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$().ready(function(){
		
		$("form").submit(function(){
			if (${sessionId == null}) {
				Swal.fire({
					  icon: 'info',
					  title: '로그인 후에 이용가능합니다.',
					  footer: '<a href="${contextPath }/user/loginUser">로그인 페이지로 이동하기</a>'
				})
				return false;
			}
		});
		
	});

</script>
</head>
<body>
	<section class="contact spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                    <div class="contact__widget">
                        <span class="icon_phone"></span>
                        <h4>전화</h4>
                        <p>+01-3-8888-6868</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                    <div class="contact__widget">
                        <span class="icon_pin_alt"></span>
                        <h4>주소</h4>
                        <p>60-49 Road 11378 New York</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                    <div class="contact__widget">
                        <span class="icon_clock_alt"></span>
                        <h4>고객센터 운영시간</h4>
                        <p>9:00 am to 18:00 pm</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                    <div class="contact__widget">
                        <span class="icon_mail_alt"></span>
                        <h4>이메일</h4>
                        <p>modudig@gmail.com</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Contact Section End -->

    <!-- Map Begin -->
    <div class="map">
        <iframe
            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d49116.39176087041!2d-86.41867791216099!3d39.69977417971648!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x886ca48c841038a1%3A0x70cfba96bf847f0!2sPlainfield%2C%20IN%2C%20USA!5e0!3m2!1sen!2sbd!4v1586106673811!5m2!1sen!2sbd"
            height="500" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
        <div class="map-inside">
            <i class="icon_pin"></i>
            <div class="inside-widget">
                <h4>서울</h4>
                <ul>
                    <li>Phone: +12-345-6789</li>
                    <li>Add: 16 Creek Ave. Farmingdale, NY</li>
                </ul>
            </div>
        </div>
    </div>
    <!-- Map End -->

    <!-- Contact Form Begin -->
    <section>
	    <div class="contact-form spad">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-12">
	                    <div class="contact__form__title">
	                        <h2>1:1문의</h2>
	                    </div>
	                </div>
	            </div>
	            <form action="${contextPath }/contact/addContact" method="post">
	                <div class="row">
	                    <div class="col-lg-6 col-md-6">
	                        <input type="text" name="userId" placeholder="유저 아이디" value="${sessionId }" readonly>
	                    </div>
	                    <div class="col-lg-6 col-md-6">
	                        <span>
	                        	<select name="category">
	                        		<option value="qna">고객문의</option>
	                        		<option value="topic">토픽신청</option>
	                        		<option value="publish">홍보요청</option>
	                        	</select>
	                        </span>
	                    </div>
	                    <div class="col-lg-12">
	                        <input type="text" name="subject" placeholder="제목">
	                    </div>
	                    <div class="col-lg-12 text-center">
	                        <textarea placeholder="내용" name="content"></textarea>
	                        <button type="submit" class="site-btn">메시지 보내기</button>
	                    </div>
	                </div>
	            </form>
	        </div>
	    </div>
    </section>
	
</body>
</html>