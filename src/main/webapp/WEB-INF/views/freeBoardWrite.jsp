<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>게시글 입력페이지</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>


<style>
* {
	margin: 0;
	padding: 0;
	text-decoration: none;
}

#wrap {
	min-width: 1010px;
	max-width: 1010px;
	margin: 0 auto;
	border: 1px solid black;
}

#cke_1_contents {
	min-height: 600px;
}

div button {
	background: #a3a3a3;
	color: #fff;
	border: none;
	position: relative;
	height: 30px;
	font-size: 16px;
	padding: 0 2em;
	cursor: pointer;
	outline: none;
	border-radius: 12px;
}

#listdo {
	background: #a3a3a3;
	color: #fff;
	border: none;
	height: 30px;
	font-size: 16px;
	padding: 0 2em;
	cursor: pointer;
	outline: none;
	border-radius: 12px;
	text-decoration: none;
}

#footMenu {
	width: 600px;
	margin-left: 250px;
}

p {
	height: 600px;
}
</style>
</head>
<body>
<c:if test="${empty loginUser }">
	<script>
		alert("로그인 후 이용 가능합니다.");
		location.href="freeBoardList";
	</script>
</c:if>
	<div id=wrap>
		<h2>게시글 작성</h2>
		<form name="form1" method="post"
			action="${path}/trollPolice1/freeBoardInsert">
			<div>
				제목 <input name="title" id="title" size="50" placeholder="제목을 입력해주세요"><br>
			</div>
			<div class="form-group">
				<textarea class="form-control" name="content" id="editor1" rows="20"
					cols="80"></textarea>

			</div>
			<div id=footMenu>
				<button type="button" id="btnSave">확인</button>
				<button type="reset">취소</button>
				<a href="freeBoardList" id="listdo">목록보기</a>
			</div>
		</form>
	</div>
</body>
<script type="text/javascript">
	
	$(document).ready(function() {
		$("#btnSave").click(function() {
			var title = $("#title").val();
			var content = $("#content").val();
			if (title == "") {
				alert("제목을 입력하세요");
				return;
			}
			if ("#content_article" == " ") {
				alert("내용을 입력하세요");
				return;
			}
			document.form1.submit();
		});
	});
	
	CKEDITOR.replace("editor1", {
		width : "100%",
		height : "600px",
		uploadUrl : "imageUpload.do/drag",
		filebrowserUploadUrl : "imageUpload.do"
	});
</script>

</html>