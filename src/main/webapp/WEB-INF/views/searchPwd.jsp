<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>비밀번호 찾기</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/login.css"  />
</head>
<body>
	<div id="wrap">
		<div id="logo">
			<a href="main"> 로고입니다. </a>
		</div>
		<div id="smallWrap">
			<h1>비밀번호 찾기</h1>
			<h5>이메일을 입력해주세요. 가입하신 이메일로 비밀번호를 보내드리겟습니다.</h5>
			<div id="loginHeader"></div>
			<div id="wrapForm">
				<form action="searchPwdAction" method="POST">
					<div id="loginForm">
						<label><input type="text" id="uid" name="email" placeholder="email" required="required"
							></label> 
					</div>

					<div id="loginButton" style="display: block;">
						<input type="submit" id="btn" value="찾기">
					</div>

					<div class="clear"></div>
					<div id=aTag>						
						<a href="signup">회원가입 </a>
					</div>

					<div id="loginFooter"></div>
				</form>
			</div>
		</div>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
		var message="${message}";
		console.log( "<%= request.getAttribute("message") %>" )
		if( message != ""){
			alert( "${message}" )
		}
	})
</script>
</html>
