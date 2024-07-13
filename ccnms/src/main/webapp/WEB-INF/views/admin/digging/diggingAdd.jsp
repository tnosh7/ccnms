<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="adminId" value="${sessionScope.adminId}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${contextPath}/resources/css/digging.css" rel="stylesheet">
<script src="${contextPath}/resources/js/digging.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
    $("form").submit(function() {
        let content = $("[name='content']").val();
        
        if (diggingTopic == "null") {
            return false;
        }
        if (content.length > 3000) {
            $("#contentWarn").html("[주의] 내용은 3000자까지 입력 가능합니다.");
            return false;
        }
        setMainId();
    });
});

function setMainId() {
    const subIds = document.getElementsByName("subId");
    Array.from(subIds).forEach(function(subIdElement) {
        if (subIdElement.checked) {
            const mainId = subIdElement.id;
            console.log("Selected mainId: " + mainId);

            const mainIdElements = document.getElementsByName("mainId");
            if (mainIdElements.length > 0) {
                mainIdElements[0].value = mainId;
            }
        }
    });
}
</script>
</head>
<body>
    <c:if test="${adminId eq null}">
        <script>
            location.href = "${contextPath}/admin/loginAdmin";
        </script>
    </c:if>
    <form action="${contextPath}/admin/digging/diggingAdd" method="post" enctype="multipart/form-data"> 
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-5">
                    <div class="sidebar">
                        <div class="sidebar__item">
                            <h4>포스팅 안내</h4>
                            <ul>
                                <li><strong>1. 관리자 공지사항을 읽어주세요.</strong></li>
                                <hr>
                                <li><strong>2. 유튜브의 url 등록시 유튜브 정책 상 동영상 아래에 있는 공유 -> 퍼가기에 적힌 url을 입력하셔야 합니다.</strong></li>
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
                                    디깅하기
                                </button>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane fade show active" id="navs-top-write" role="tabpanel">
                                <div class="card-body">
                                    <span id="test"></span>
                                    <table>
                                        <thead>
                                            <tr>
                                                <th colspan="2">
                                                    <c:set var="previousMainId" value="" />
                                                    <div class="main-group">
                                                        <c:forEach var="subTitleDTO" items="${subTitleDTO}">
                                                            <c:if test="${previousMainId != subTitleDTO.mainId}">
                                                                <c:if test="${not empty previousMainId}">
                                                                    </div>
                                                                    <div class="main-group">
                                                                </c:if>
                                                                <c:forEach var="mainTitleDto" items="${mainTitleDTO}">
                                                                    <c:if test="${mainTitleDto.mainId == subTitleDTO.mainId}">
                                                                        <label style="color:blue; font-size:20px; width:90px; display:inline-block;">
                                                                            ${mainTitleDto.mainTitle}
                                                                        </label>
                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:set var="previousMainId" value="${subTitleDTO.mainId}" />
                                                            </c:if>
                                                            <div class="radio-item">
                                                                <input type="radio" name="subId" id="${subTitleDTO.mainId}" value="${subTitleDTO.subId}" onclick="setMainId()" required="required">
                                                                ${subTitleDTO.subTitle}&ensp;
                                                                <input type="hidden" name="mainId" value="">
                                                            </div>
                                                        </c:forEach>
                                                    </div>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th>작성자 :</th>
                                                <th>
                                                    <select name="writer">
                                                        <option>ModuDigging</option>
                                                    </select>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th>제목 :</th>
                                                <th>
                                                    <div class="form-group">
                                                        <input class="form-control form-control-lg" type="text" id="subject" name="subject" maxlength="35" required="required">
                                                    </div>
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td colspan="2">
                                                    <textarea name="content" id="editor" maxlength="2900"></textarea>
                                                    <script>
                                                        ClassicEditor
                                                            .create(document.querySelector('#editor'), {
                                                                ckfinder: {
                                                                    uploadUrl: '/image/upload'
                                                                }
                                                            })
                                                            .then(editor => {
                                                                console.log('Editor was initialized');
                                                            });
                                                    </script>
                                                </td>
                                            </tr>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <td colspan="2">
                                                    <div class="input-group">
                                                        <input type="file" class="form-control" id="uploadfile" name="uploadfile">
                                                        <label class="input-group-text" for="inputGroupFile02" id="uploadFileBtn" name="uploadFile">업로드</label>
                                                        <label class="input-group-text" for="inputGroupFile02" id="deleteFile" name="deleteFile">삭제</label>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr align="center">
                                                <th colspan="2">
                                                    <span id="contentWarn" style="color:red"></span>
                                                </th>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <div class="demo-inline-spacing" align="center">
                                                        <button type="submit" class="btn btn-primary active">작성</button>
                                                        <button type="reset" class="btn btn-primary" onclick="window.location.reload()">새로고침</button>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-body"></div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
