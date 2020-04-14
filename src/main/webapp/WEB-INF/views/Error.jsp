<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error</title>
<style>
* {
	margin: 0 auto;
	padding: 0;
}

#wrap{
	width: 100%;
	margin-top:150px;
}

#erImg {
	width: 375px;
}

h1{
	text-align: center;
	font-size: 100px;
}
</style>
</head>
<body>
	<div id=wrap>
		<h1>ERROR PAGE</h1>
		
		<div id="erImg">
			<img src="${pageContext.request.contextPath}/resources/img/error.jpg">
		</div>
	</div>
</body>
</html>