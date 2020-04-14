<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>토론 게시판</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	text-decoration: none;
}

#wrap {
	min-width: 1010px;
	max-width: 1010px;
	margin: 0 auto;
	border: 1px solid white;
}

#topDiv{
	margin-top:50px;
}

h5{
	font-size: 34px;
	font-weight: 800;
	color: #333;
	float: left;
	padding-bottom: 10px;
	border-bottom: 3px solid gray;
	cursor: pointer;
}

h5:hover{
	color: #666;
}

h4{
	font-size: 14px;
	font-weight: 800;
	color: #333;
	float: left;
	padding-bottom: 10px;
	border-bottom: 3px solid gray;
	margin-top:27px;
	margin-left:150px;
}

h3{
	font-size: 14px;
	font-weight: 800;
	color: #333;
	float: left;
	padding-bottom: 10px;
	border-bottom: 3px solid gray;
	margin-top:27px;
}


#boardDiv{
	height: 600px;
	min-width: 100%;
	max-width: 100%;
	margin-top:150px;
	color: rgb(51, 51, 51);
	font-size: 14px;
}

#pageDiv{
	float: left;
    margin-top: 20px;
    text-align: center;
    width: 100%;
    height: 50px;
}

#trollSearch {
	width: 250px;
	float: right;
	margin-top: 50px;
}

#src_troller {
	width: 169px;
	height: 38px;
	line-height: 38px;
	background-color: #fff;
	border: 1px solid #e4e4e4;
	padding: 0 20px 0 20px;
}

#btnSrc{
	margin-bottom: -10px;
}

#src_troller:focus {
	outline: 1px solid #8ba3d1;
}

.oneBoardDiv, #oneBoardDivHead {
	width: 100%;
	margin: 0 auto;
	padding: 5px 0;
	border-bottom: 1px solid #e4e4e4;
	height: 40px;
}

.oneBoardDiv div, #oneBoardDivHead div {
	float: left;
	height: 35px;
	text-align: center;
	line-height: 40px;
}

.oneBoardDiv:hover {
	background-color: #f9f9f9; /*color switch*/
	cursor: pointer;
}

.boardId {
	width: 40px;
}

.expiredText {
	width: 200px;
}

.troller {
	width: 200px;
}

.nickname {
	width: 200px;
}

.writeDate {
	width: 250px;
}

.readcount {
	width: 60px;
}

.upAndDown {
	width: 60px;
}

.clear {
	clear: both;
}

.underCount{
	margin: 0 20px;
	color:#888;
	font-family: "Tahoma";
	font-size: 20px;
}

.underCount:hover{
	color: #1c6ac3;
}

#trollImng{
	float: left;
	margin-right:15px;
	margin-top:5px;
	width: 50px;
	height: 50px;
}

#topDiv h5 a{
	color: #333;
	text-decoration: none;
}

#topDiv h5 a:hover{
	color: #666;
}

</style>
</head>
<body>
	<article>
		<div id="wrap">
		
			<div id="topDiv">
			<img src="${pageContext.request.contextPath}/resources/img/troll.png" id="trollImng">
				<h5><a href="discussionBoard">트롤검색 </a></h5>
				<h4 style="color: red;"> "${troller}"</h4>
				<h3>&nbsp;님이 신고되신 토론입니다.</h3>
				
				<div id="trollSearch">
					<input type="text" id="src_troller" name="src_troller" placeholder="트롤러를 검색해주세요." >
					<input type="image" src="${pageContext.request.contextPath}/resources/img/btn2.png" value="button" id=btnSrc> 
			</div>
		
			</div>
			<div id="boardDiv">
				<div id="oneBoardDivHead">
					<div class="boardId">번호</div>
					<div class="expiredText">투표종료</div>
					<div class="troller">트롤러</div>
					<div class="nickname">신고자</div>
					<div class="writeDate">작성일</div>
					<div class="readcount">조회수</div>
					<div class="upAndDown">찬성</div>
					<div class="clear"></div>
				</div>

				<c:forEach var="board" items="${boards}">
					<div class="oneBoardDiv">
						<input type="hidden" class="expired" style="display: none;"
							value="${board.expired}"> <input type="hidden"
							class="boardIdVal" value="${board.discBoardId}">
						<div class="boardId">${board.discBoardId}</div>
						<div class="expiredText" style="color: red;"></div>
						<div class="troller"> ${board.troller } </div>
						<div class="nickname"> ${board.nickname } </div>
						<div class="writeDate">${board.writeDateString}</div>
						<div class="readcount">${board.readcount}</div>
						<div class="upAndDown">${board.up - board.down}</div>
						<div class="clear"></div>
					</div>
				</c:forEach>
			</div>
			<!-- page 가 음수가 되는 부분에서 처리  -->
			<div class="clear"></div>
			<div id="pageDiv">
				<!-- 검색창 페이징시 조절필요... -->
					<a href="srcTroll?troller=${troller}&page=1">
						<input type="image" src="${pageContext.request.contextPath}/resources/img/left.png" value="button" class="previous_btn">
					</a>
					
					<c:if test="${pageStart-1>0 }">
					
						<a href="srcTroll?troller=${troller}&page=${pageStart-1}">
							<input type="image" src="${pageContext.request.contextPath}/resources/img/prev.png" value="button" class="before"></a>
						
					</c:if>
					<c:forEach begin="${pageStart}" var="page" end="${pageEnd }">
						<a href="srcTroll?troller=${troller}&page=${page}"class="underCount"> ${page} </a>
					</c:forEach>
					<c:if test="${pageEnd+1 <= lastPage }">
						<a href="srcTroll?troller=${troller}&page=${pageEnd+1}">
						<input type="image" src="${pageContext.request.contextPath}/resources/img/next.png" value="button" class="next"></a>
					</c:if>
						<a href="srcTroll?troller=${troller}&page=${lastPage}">
					<input type="image" src="${pageContext.request.contextPath}/resources/img/right.png" value="button" class="next_btn"></a>			
			</div>
		</div>
	</article>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		drawTimer();
		return false;
	})

	var timeCount = setInterval(drawTimer, 1000);

	function drawTimer() {
		var now = new Date().getTime();

		var len = $(".oneBoardDiv").length;

		for (var i = 2; i <= len + 1; i++) {
			var distance = $(".oneBoardDiv:nth-child(" + i + ") > .expired")
					.val()
					- now;
			if (distance < 0) {
				$(".oneBoardDiv:nth-child(" + i + ") > .expiredText").text(
						"<투표종료>");
			} else {
				var days = Math.floor((distance / (1000 * 60 * 60 * 24)));
				distance -= days * (1000 * 60 * 60 * 24);
				var hours = Math.floor(distance / (1000 * 60 * 60));
				distance -= hours * (1000 * 60 * 60);
				var minutes = Math.floor(distance / (1000 * 60));
				distance -= minutes * (1000 * 60);
				var seconds = Math.floor(distance / 1000);
				$(".oneBoardDiv:nth-child(" + i + ") .expiredText").text(
						days + " 일 " + hours + " 시간 " + minutes + " 분 "
								+ seconds + " 초 ");
			}
		}
	}

	$(".oneBoardDiv").on("click", function() {
		var boardId = $(this).children(".boardIdVal").val();
		console.log(boardId);
		location.href = "discDetail?discBoardId=" + boardId;
	});
	
	$("#src_troller").keypress(function(e){
		if ( e.which == 13 ) {
	        $('#btnSrc').click();
	      	return false;
	    }
		
	});
	
	$("#btnSrc").on("click",function(){
		trollSearch();
		return false;
	});
	
	function trollSearch(){
		var troller = $("#src_troller").val();
		location.href = "srcTroll?troller="+troller+"&page=1";
	}
</script>
</html>