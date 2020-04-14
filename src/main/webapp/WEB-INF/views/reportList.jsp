<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<title>신고목록</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

#wrap {
	min-width: 1010px;
	max-width: 1010px;
	margin: 0 auto;
	border: 1px solid white;
}

#headerDiv {
	margin-top: 50px;
	border: 1px solid white;
}

h5 {
	font-size: 32px;
	font-weight: 800;
	float: left;
	margin-right: 30px;
}

#list1 {
	color: #333;
	padding-bottom: 10px;
	border-bottom: 3px solid gray;
	cursor: pointer;
}

#list2 {
	cursor: pointer;
	color: #666;
}

#list2:hover {
	color: #333;
}

#boardDiv {
	height: 600px;
	min-width: 100%;
	max-width: 100%;
	font-size: 14px;
	color: rgb(51, 51, 51);
	margin-top: 100px;
}

#pageDiv {
	float: left;
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

#btnSrc {
	margin-bottom: -10px;
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
	line-height: 35px;
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

#Siren1 {
	float: left;
	margin-right: 13px;
	margin-top: 8px;
	display: inline;
}

#Siren2 {
	float: left;
	margin-right: 13px;
	margin-top: 8px;
	display: none;
}

.next_btn, .next, .before, .previous_btn {
	border: 1px solid #e4e4e4;
	width: 17px;
	height: 17px;
	padding: 1px;
}

.underCount {
	margin: 0 20px;
	color: #888;
	font-family: "Tahoma";
	font-size: 20px;
}

.underCount:hover {
	color: #1c6ac3;
}

#pageDiv {
	float: left;
	margin-top: 20px;
	text-align: center;
	width: 100%;
	height: 50px;
}
</style>
<body>

	<article>
		<div id="wrap">
			<input id="page" type="hidden" value="1"> <input
				id="searchType" type="hidden" value="report">

			<div id="headerDiv">
				<img
					src="${pageContext.request.contextPath}/resources/img/mySiren.png"
					id="Siren1">
				<h5 onclick="getReportList()" id="list1">신고한 목록</h5>
				<img
					src="${pageContext.request.contextPath}/resources/img/mySiren.png"
					id="Siren2">
				<h5 onclick="getTrollList()" id="list2">신고 당한 목록</h5>

				<div id="trollSearch">
					<input type="text" id="src_troller" name="src_troller"
						placeholder="소환사 명을 입력해주세요."> <input type="image"
						src="${pageContext.request.contextPath}/resources/img/btn2.png"
						value="button" id=btnSrc>
				</div>

			</div>

			<div id="boardDiv">
				<div id="oneBoardDivHead">
					<div class="boardId">번호</div>
					<div class="expiredText">투표종료</div>
					<div class="nickname">신고자</div>
					<div class="troller">트롤러</div>
					<div class="writeDate">작성일</div>
					<div class="readcount">조회수</div>
					<div class="upAndDown">트롤</div>
					<div class="clear"></div>
				</div>
			</div>
			<!-- page 가 음수가 되는 부분에서 처리  -->
			<div class="clear"></div>
			<div id="pageDiv">
				<!-- 검색창 페이징시 조절필요... -->


			</div>


		</div>
	</article>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</body>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	var lastPage = 0;
	var isReport = true;

	$(document).ready(function() {
		getReportList().then(function() {
			console.log("aaa");
			drawTimer();
		});
		return false;
	});

	var timeCount = setInterval(drawTimer, 1000);

	function drawTimer() {
		var now = new Date().getTime();

		var len = $(".oneBoardDiv").length;

		for (var i = 2; i <= len + 1; i++) {
			var distance = $(".oneBoardDiv:nth-child(" + i + ") > .expired")
					.val()
					- now;

			if (distance < 0) {
				var trollCount = parseInt($(
						".oneBoardDiv:nth-child(" + i + ") > .upAndDown")
						.text());

				if (trollCount > 0) {
					$(".oneBoardDiv:nth-child(" + i + ") > .expiredText").text(
							"<트롤러>");
				} else if (trollCount == 0) {
					$(".oneBoardDiv:nth-child(" + i + ") > .expiredText").text(
							"<무 효>");
				} else if (trollCount < 0) {
					$(".oneBoardDiv:nth-child(" + i + ") > .expiredText").text(
							"<무 죄>");
				} else {
					$(".oneBoardDiv:nth-child(" + i + ") > .expiredText").text(
							"<NaN>");
				}

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

	$("#list2").on("click", function() {
		$("#list1").css("border-bottom", ("none"));
		$("#list1").css("color", ("#666"));
		$("#list2").css("border-bottom", ("3px solid gray"));
		$("#list2").css("padding-bottom", ("10px"));
		$("#list2").css("color", ("#333"));
		$("#Siren2").css("display", ("inline"));
		$("#Siren1").css("display", ("none"));
	});

	$("#list1").on("click", function() {
		$("#list2").css("border-bottom", ("none"));
		$("#list1").css("border-bottom", ("3px solid gray"));
		$("#list1").css("padding-bottom", ("10px"));
		$("#list1").css("color", ("#333"));
		$("#list2").css("color", ("#666"));
		$("#Siren1").css("display", ("inline"));
		$("#Siren2").css("display", ("none"));
	});

	$(document).on("click", ".oneBoardDiv", function() {
		var boardId = $(this).children(".boardIdVal").val();
		//
		console.log(boardId);
		location.href = "discDetail?discBoardId=" + boardId;
	});

	$("#src_troller").keypress(function(e) {
		if (e.which == 13) {
			$('#btnSrc').click();
			return false;
		}

	});

	$("#btnSrc").on("click", function() {
		searchTroll();
		console.log("clicked");
		return false;
	});

	function getReportList() {
		var page = $("#page").val();
		$("#searchType").val("report");

		console.log(page);

		return new Promise(function(resolve, reject) {
			$.get("getReportList", {
				"reportPage" : page
			}, function(json) {
				console.log(json);
				boardJson = json;
				drawBoard(json);
				lastPage = json['lastPage'];
				isReport = true;
			}, "json");
		});
	};

	function getTrollList() {
		var page = $("#page").val();
		$("#searchType").val("troll");
		console.log(page);

		$.get("getTrollList", {
			"reportPage" : page
		}, function(json) {
			console.log(json);
			boardJson = json;
			drawBoard(json);
			lastPage = json['lastPage'];
			isReport = false;
		}, "json");
	}

	function drawBoard(board) {
		$(".oneBoardDiv").remove();
		$("#pageDiv").empty();

		for (var i = 0; i < board['boardList'].length; i++) {
			var report = board['boardList'][i];

			$("#boardDiv").append("<div class='oneBoardDiv'></div>");
			$(".oneBoardDiv:last-child")
					.append(
							"<input type='hidden' class='expired' style='display: none;' value='"+report['expired']+"'>");
			$(".oneBoardDiv:last-child")
					.append(
							"<input type='hidden'class='boardIdVal' value='"+report['discBoardId']+"'>");
			$(".oneBoardDiv:last-child").append(
					"<div class='boardId'>" + report['discBoardId'] + "</div>");
			$(".oneBoardDiv:last-child").append(
					"<div class='expiredText' style='color: red;'></div>");
			$(".oneBoardDiv:last-child").append(
					"<div class='nickname'> " + report['nickname'] + " </div>");
			$(".oneBoardDiv:last-child").append(
					"<div class='troller'>" + report['troller'] + "</div>");
			$(".oneBoardDiv:last-child").append(
					"<div class='writeDate'>" + report['writeDateString']
							+ "</div>");
			$(".oneBoardDiv:last-child").append(
					"<div class='readcount'>" + report['readcount'] + "</div>");
			$(".oneBoardDiv:last-child").append(
					"<div class='upAndDown'>" + (report['up'] - report['down'])
							+ "</div>");
			$(".oneBoardDiv:last-child").append("<div class='clear'></div>");

		}

		//paging
		$("#pageDiv")
				.append(
						'<input type="image" src="${pageContext.request.contextPath}/resources/img/left.png" onclick=pageFirst() value="button" class="previous_btn">');

	
		if (board['pageStart'] > 2) {
			$("#pageDiv").append(
					"<input type='image' value='button' src='${pageContext.request.contextPath}/resources/img/prev.png' class='before'"+
					" onclick='prevPage(" + (board['pageStart'] - 1)
							+ ")'>");
		}

		for (var i = board['pageStart']; i <= board['pageEnd']; i++) {
			if(i==parseInt($("#page").val())){
				console.log(i);
				$("#pageDiv").append(
						"<a class='underCount' style='color:red;' href=# onclick='movePage(" + i + ")'>" + i + "</a>");
			}else {
				$("#pageDiv").append(
						"<a class='underCount' href=# onclick='movePage(" + i + ")'>" + i + "</a>");	
			}
			
		}

		if (board['pageStart'] + 4 < board['lastPage']) {
			$("#pageDiv").append(
					"<input type='image' value='button' src='${pageContext.request.contextPath}/resources/img/next.png' class='next' onclick=nextPage(" + (board['pageStart'] + 5)
							+ ")>");
		}

		$("#pageDiv").append("<input type='image' src='${pageContext.request.contextPath}/resources/img/right.png' class='next_btn' onclick='pageEnd()'>");
	}

	
	function searchTroll() {
		$("#page").val(1);

		var send = {
			"type" : $("#searchType").val(),
			"nickname" : $("#src_troller").val(),
			"page" : $("#page").val()
		};
		$.get("searchMyTroll", send, function(board) {
			drawBoard(board);
		}, "json").fail(function() {
			alert("ERROR");
		});
	}
	function pageFirst() {
		$("#page").val(1);
		if (isReport) {
			getReportList();
		} else {
			getTrollList();
		}
	}
	function pageEnd() {
		$("#page").val(lastPage);

		console.log("page: " + $("#page").val());
		if (isReport) {
			getReportList();
		} else {
			getTrollList();
		}
	}
	function movePage(page) {
		$("#page").val(page);

		if ($("#searchType").val() == "report") {
			getReportList();
		} else if ($("#searchType").val() == "troll") {
			getTrollList();
		}
	}
	function prevPage(page) {
		if (page < 1)
			page = 1;
		$("#page").val(page);

		if (isReport) {
			getReportList();
		} else {
			getTrollList();
		}
	}
	function nextPage(page) {
		if (page > lastPage)
			page = lastPage;
		$("#page").val(page);

		if (isReport) {
			getReportList();
		} else {
			getTrollList();
		}
	}
</script>
</html>