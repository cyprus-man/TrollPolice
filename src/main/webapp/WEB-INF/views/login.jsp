<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>로그인</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/login.css"  />
</head>
<body>
	<c:if test="${!empty message}">
		<script>
			alert("${message}");
		</script> 
	</c:if>
	<%@ include file="/WEB-INF/views/header.jsp" %>
	<div id="wrap">
		
		<div id="smallWrap">
			<h1>Login</h1>
			<h5>로그인을 하시면 더욱 다양한 서비스를 이용하실수 있습니다.</h5>
			<div id="loginHeader"></div>
			<div id="wrapForm">
				<form action="loginAccess" method="POST">
					<div id="loginForm">

						<label><input type="text" id="email" name="email" placeholder="이메일"
							required></label> <label><input type="password" name="pwd" id="pwd"
							placeholder="비밀번호"></label>
					</div>

					<div id="loginButton" style="display: block;">
						<input type="submit" id="btn" value="로그인" >
					</div>

					<div class="clear"></div>
					<div id=aTag> <a href="#" id="src_pwd"> 비밀번호 찾기 </a> <a href="signup">
							회원가입 </a>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
var regEmail = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,3}$/;

$(document).ready(function(){
	var nickname = "${loginUser.email}";
	if(nickname!=""){
		alert("이미 로그인된 상태입니다.");
		location.href="main";
	}
})

$("#src_pwd").on("click",function(){
	var email = prompt("이메일을 입력해주세요.");
	console.log(email);
	
	//소환사 명으로 검증
	if(regEmail.test(email)){
		var nickname = prompt("가입시 등록한 소환사 명을 입력해주세요.");
		
		$.post("sendNewPassword",{"email":email,"nickname":nickname},function(text){
			if(text=="success"){
				alert("가입하신 메일로 새 암호를 보내드렸습니다.");
			}else{
				alert("정보를 잘못 입력했습니다.");
			}
		},"text");
	}else{
		alert("이메일을 입력해주세요.");
	}
});
</script>
</html>