<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.ckeditor.com/4.14.0/standard/ckeditor.js"></script> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 



<style>
#wrap{
	width: 1000px;
    margin: 0 auto;
  
    height: 600px;
}
#cke_1_contents{
	min-height:600px;
}
div button{
	background:#a3a3a3;
  color:#fff;
  border:none;
  position:relative;
  height:30px;
  font-size:16px;
  padding:0 2em;
  cursor:pointer;
  outline:none;
  border-radius: 12px;
}
#listdo{
	background:#a3a3a3;
  color:#fff;
  border:none;
  height:40px;
  font-size:16px;
  padding:0 2em;
  cursor:pointer;
  outline:none;
  border-radius: 12px;
}
</style>
</head>
<body>
<div id=wrap>
	<h2>게시글 수정</h2>
	<form name="form1" method="post">
	<input type="hidden" name="bno" value="${dto.bno}" />
		<div>
			제목
			<input name="title" id="title" size="50" value="${dto.title}"/><br>
		</div>
		<div class="form-group">
			
			<textarea class="form-control" name="content" id="editor1" rows="20" cols="80">${dto.content}</textarea>
		</div>
		<div style="width:650px; text-align:center;">
			<button type="button" id="btnUpdate" >확인</button>
			<button type="reset">취소</button>
			<a href="/trollPolice1/freeBoardList" id="listdo">목록보기</a>
		</div>
	</form>
</div>
</body>



<script>
$(document).ready(function(){
	$("#btnUpdate").click(function(){
		var title=$("title").val();
		var content=$("#content").val();
		if(title==" "){
			alert("제목을 입력하세요");
			document.form1.title.focus();
			return;
		}
		if(content==""){
			alert("내용을 입력하세요");
			document.form1.content.focus();
			return;
		}
		document.form1.action="${path}/trollPolice1/freeBoardUpdate";
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