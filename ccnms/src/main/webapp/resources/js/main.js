	$().ready(function() {
		$("#sort").val("${sort}");
	});

	function getDiggingList() {
		var url = "${contextPath }/"
		url += "?onePageViewCnt=" + $("#onePageViewCnt").val();
		location.href = url;
	}

	function updateThumb(diggingId) {
		if ("${sessionId == null}" == "true") {
			Swal
					.fire({
						icon : 'info',
						title : '로그인 후에 이용가능합니다.',
						footer : '<a href="${contextPath }/user/loginUser">로그인 페이지로 이동하기</a>'
					})
		} else {

			$.ajax({
				url : "${contextPath}/updateThumbsUp",
				type : "get",
				data : {
					"diggingId" : diggingId
				},
				success : function(data) {
					$("#updateThumbs" + diggingId).html(data);
				}
			})
		}
	}
	function show() {
		$("[name='dropdown-menu']").show();
	}
	function hide() {
		$("[name='dropdown-menu']").hide();
	}