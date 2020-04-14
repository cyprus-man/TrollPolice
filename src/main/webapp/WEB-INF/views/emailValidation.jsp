<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/validationHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<style>
#catImg {
	width: 584px;
	height: 467px;
	margin: 0 auto;
	margin-top: 40px;
}

#textDiv {
	margin-top: 20px;
	text-align: center;
}

h1 {
	color: #333;
	font-size: 2rem;
}

h3 {
	font-size: 14px;
	margin-top: 3px;
}

h4 {
	font-size: 14px;
	margin-top: 3px;
	color: red;
}

#validWrap {
	width: 622px;
	height: 58px;
	background-color: rgba(29, 192, 120, .12);
	border: 1px solid rgba(29, 192, 120, .24);
	box-shadow: 0 2px 4px 0 rgba(0, 0, 0, .1);
	padding: 14px 20px;
	border-radius: 28px;
	height: auto;
	margin:0 auto;
	margin-top: 20px;
	margin-bottom: 40px;
	
}

#validKey {
	width: 530px;
	height: 24px;
	background: transparent;
	font-size: 16px;
	float: left;
	border:none;
	margin-top: 4px;
}

#validSubmit {
	margin-left: 10px;
	margin-top: 3px;
}

#frameLine {
	border: 1px solid rgba(206, 206, 206, 0.959);
	margin: 0 auto;
	width: 800px;
	margin-top: 40px;
	margin-bottom: 60px;
}

button{
	margin-top:5px;
}
</style>
</head>
<body>
	<div id="frameLine">
		<div id="catImg">
			<img src="${pageContext.request.contextPath}/resources/img/cat.gif"
				style="width: 100%; height: 100%;">
		</div>
		<div id="textDiv">
			<h1>이메일 인증</h1>
			<br />
			<h3>
				※회원가입시 등록하신 이메일로 인증 코드를 전송하였습니다. <br /> <br />
			</h3>
			<h4>이메일 주소 : ${loginUser.email}</h4>
			<button class="btn btn btn-info" onclick="resend()">재전송</button>
		</div>

		<div id="validWrap">
			<form method="post" action="validKey">
				<input type="text" id="validKey" name="validKey"
					placeholder="이메일 인증키를 입력해주세요."> <input type="image"
					src="${pageContext.request.contextPath}/resources/img/btn1.png"
					value="Submit" id="validSubmit">
			</form>
		</div>
	</div>
</body>
<script type="text/javascript">

$(document).ready(function(){
	var email = "${loginUser.email}";
	
	if(email==""){
		location.href="main";
	}
});
function resend(){
	location.href="resend";
}
</script>
</html>