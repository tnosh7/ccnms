$(document).ready(function(){
	$("#modifyBtn").click(function(){
		$("#modify").show();
	});
	
	$("#addBtn").click(function(){
		if ("${sessionId}" === "" && "${adminId}" === "") {
			Swal.fire({
				icon: 'info',
				title: '로그인 후에 이용가능합니다.',
				footer: '<a href="${contextPath}/user/loginUser">로그인 페이지로 이동하기</a>'
			});
		} 
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