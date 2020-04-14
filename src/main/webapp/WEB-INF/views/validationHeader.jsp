<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<link href="${pageContext.request.contextPath}/resources/img/siren.png"
	rel="shortcut icon" type="image/x-icon">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>트롤 경찰청 -- 이용하시기에 앞서 인증 부탁드립니다.</title>
<style>
* {
	margin: 0;
	padding: 0;
}
#wrap{
	min-height:750px;	
}
#menu {
	height: 70px;
	border-bottom: 1px solid rgba(206, 206, 206, 0.959);
	position: relative;
}

input:focus {
	outline: none;
}

#Logo {
	width: 150px;
	height: 50px;
	float: left;
	margin-top: 15px;
	margin-left: 350px;
}

.leftMenu {
	list-style: none;
}

.leftMenu li {
	padding: 0;
	float: left;
	margin-right: 50px;
	margin-top: 5px;
	line-height: 60px;
}
#Logo  img{
	width:50px;
	height:50px;
	margin: 0 auto;
    display: block;
}
.rightMenu {
	position: absolute;
	line-height: 70px;
	right: 15%;
}

.rightMenu a {
	margin-right: 20px;
	color: #4a4a4a;
	text-decoration: none;
	font-size: 14px;
	font-weight: bold;
}

.leftMenu a {
	color: #4a4a4a;
	text-decoration: none;
	font-size: 16px;
	font-weight: bold;
}

.leftMenu li a:hover, .rightMenu a:hover {
	color: #2fc97a;
}

.notice {
	float: right;
	margin-top: 10px;
	margin-right: 30px;
	position: relative;
}

.notice div {
	position: absolute;
	top: -5px;
	right: -5px;
	color: white;
	width: 20px;
	height: 20px;
	line-height: 20px;
	font-weight: 800;
	text-align: center;
	background-color: red;
	border-radius: 10px;
	font-weight: 800;
}

#noticeBox {
	border: 4px solid black;
	border-radius: 20px;
	width: 400px;
	max-height: 300px;
	padding: 20px;
	display: none;
	position: absolute;
	left: 0px;
	top: 0px;
	background-color: white;
	text-align: center;
	display: none;
}
.notice > img{
	vertical-align: baseline;
}
#noticeBox a:hover {
	border-bottom: 4px solid black;
}

#notice_close {
	position: relative;
	float: right;
}

h5, h6 {
	font-size: 18px;
	text-align: center;
	margin-bottom: 10px;
}

#count {
	border: 1px solid red;
}

hr {
	margin-top: 10px;
}
</style>

</head>

<body>
	<header>

		<div id="menu">

			<div id="Logo">

				<a href="main"><img
					src="${pageContext.request.contextPath}/resources/img/logo.png"></a>

			</div>

			<ul class="leftMenu">

				<li><a href="discussionBoard">토론</a></li>

				<li><a href="ranking">랭킹</a></li>

				<c:if test="${!empty loginUser }">

					<li><a href="report">신고하기</a></li>

					<li><a href="matchingBoard">듀오</a></li>
					<li><a href="liveChat">LIVE DUO</a></li>
					<li><a href="reportList">신고목록</a></li>

				</c:if>

				<li><a href="serviceCenter">고객센터</a></li>

			</ul>

			<div class="rightMenu">

				<c:if test="${!empty loginUser}">

					<c:if test="${not empty noticeList}">
					
						<div class="notice">

							<img
								src="${pageContext.request.contextPath}/resources/img/black.png">

							<div id=count>${noticeList.size()}</div>

						</div>

					</c:if>

					<c:if test="${empty noticeList }">

						<div class="notice">

							<img
								src="${pageContext.request.contextPath}/resources/img/white.png">

						</div>

					</c:if>
				</c:if>
				<c:choose>
					<c:when test="${empty loginUser}">

						<a href="login">로그인</a>

						<a href="signup">회원가입</a>

					</c:when>

					<c:otherwise>
						<span>${loginUser.nickname } 님</span>
						<a href="information">나의 정보</a>

						<a href="logout">로그아웃</a>

					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</header>
	<c:if test="${not empty noticeList }">
		<div id="noticeBox">
			<div id="notice_close">
				<img class="notice_close"
					src="${pageContext.request.contextPath}/resources/img/x.png">
			</div>
			<tr>
				<td><span
					style="font-size: 20px; color: #2fc97a; font-weight: bolder;">${loginUser.nickname}</span>님의
					쪽지함<br> <br></td>
			</tr>
			<h5>트롤로 신고당했습니다 !!</h5>
			<c:forEach items="${noticeList}" var="notice" begin="0" end="4">
				<table>
					<tr>
						<td><a style="color: black;"
							href="discDetail?discBoardId=${notice.discBoardId }"> <span
								style="font-size: 20px; color: red; font-weight: bold;">${notice.reporter }</span>님이
								당신을 신고하셨습니다.
						</a></td>
					</tr>
				</table>
			</c:forEach>
			<hr>
			<c:if test="${noticeList.size() > 5 }">
			</c:if>
			<a href="#">more...</a>
		</div>
	</c:if>
</body>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(".notice").mouseover(function(e) {

		var x = e.pageX;

		var y = e.pageY;

		if (!$("#noticeBox").hasClass("hover")) {

			$('#noticeBox').css({

				top : e.pageY + 40,

				left : e.pageX - 200,

				display : "block"

			});

		}

		$("#noticeBox").addClass("hover");

	});

	$(".notice_close").on("click", function() {

		$("#noticeBox").css("display", "none");

		$("#noticeBox").removeClass("hover");

	})
</script>

</html>