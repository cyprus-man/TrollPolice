<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/header.jsp"%>

<%@ page import="com.javalec.vo.MemberVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	text-decoration: none;
}

.clear {
	clear: both;
}

.wrap {
	width: 1010px;
	margin: 10px auto;
}

.duoheader {
	width: 990px;
	height: 60px;
	padding-top: 40px;
	padding-left: 15px;
	padding-bottom: 10px;
}

h1 {
	font-size: 32px;
	font-weight: 400;
	float: left;
}

div#backpage:hover {
	border: 1px solid #a3a3a3;
}

#backpage {
	width: 80px;
	height: 20px;
	font-size: 13px;
	color: #666;
	cursor: pointer;
	margin-top: 10px;
	padding-top: 10px;
	padding-bottom: 10px;
	margin-right: 15px;
	border: 1px solid #e6e6e6;
	text-align: center;
	float: right;
}

/*Info header*/
.detailWrap {
	width: 1000px;
}

.writerInfo {
	width: 250px;
	height: 60px;
	margin-left: 20px;
	margin-top: 15px;
	float: left;
}

.writerInfo>span {
	width: 55%;
	display: inline-block;
}

.writerInfo img.champ {
	width: 60px;
	height: 60px;
	float: left;
}

img.tier {
	width: 20px;
	height: 20px;
	float: left;
}

.sub_left {
	width: 40%;
	height: 100%;
	float: left;
}

.sub_right {
	line-height: 60px;
	margin-top: 15px;
	font-size: 16px;
	color: #879292;
	float: right;
}

.sub_right>span {
	margin-right: 25px;
	font-size: 13px;
	font-weight: 400;
	color: #888;
}

#boardMenu {
	margin-top: 18px;
	margin-right: 10px;
	float: right;
	cursor: pointer;
}

.sub_right>a {
	color: #879292;
}

.boardSub {
	border: 1px solid red;
	position: absolute;
	width: 90px;
	left: 915px;
	display: none;
}

#boardSiren {
	width: 80px;
	height: 30px;
	padding: 9px 5px 5px 5px;
	text-align: center;
	cursor: pointer;
	background-color: #ec4b39;
	color: white;
}

button {
	width: 90px;
	height: 44px;
	float: left;
	padding: 9px 5px 5px 5px;
	font-size: 16px;
	text-align: center;
	cursor: pointer;
	background-color: #ec4b39;
	color: white;
	border: 0;
	outline: 0;
}

.title {
	height: 70px;
	width: 930px;
	margin: 0 auto;
	padding: 20px;
	background-color: #f9f9f9;
	border-top: 1px solid #7e7e7e;
	border-bottom: 1px solid #e3e3e3;
	font-size: 24px;
	font-weight: 500;
	line-height: 70px;
}

#writerDiv {
	height: 90px;
	width: 1000px;
	border-bottom: 1px solid #e3e3e3;
}

.writeDate {
	width: 230px;
	height: 50px;
}

.etc {
	width: 230px;
	height: 50px;
}

div.detailContent {
	margin: 30px auto;
	border: 1px solid #e3e3e3;
}

.detailContent {
	padding: 25px 20px 25px 20px;
	width: 900px;
	height: 300px;
	border-bottom: 1px solid gray;
}

.rates {
	margin: 5px;
	width: 60%;
	height: 30px;
	float: left;
	color: gray;
}

.board_wins {
	background-color: rgb(211, 255, 250);
	height: 100%;
	float: left;
	text-align: center;
	padding-top: 5px;
}

.board_losses {
	background-color: rgb(254, 222, 237);
	height: 100%;
	float: left;
	text-align: center;
	padding-top: 5px;
}

/* reply*/
.reply {
	width: 960px;
	min-height: 70px;
	border: 1px solid gray;
}

.replyInfo, .replyChoice {
	float: left;
	height: 100%;
}

.replyContent {
	float: left;
	width: 575px;
	min-height: 100%;
	position: relative;
}

.replyInfo {
	width: 200px;
}

.replyWriteDate {
	width: 175px;
	text-align: center;
	float: right;
}

.replyChoice {
	width: 175px;
}

.replyHeader {
	width: 960px;
	min-height: 60px;
	margin-bottom: 15px;
}

#laneWrapper {
	width: 220px;
	height: 30px;
	border-bottom: 1px solid #e7e7e7;
	display: none;
}

img.lane {
	width: 30px;
	height: 30px;
}

p#replyContent {
	width: 80%;
	float: left;
	height: 50px;
	border-bottom: 1px solid gray;
	overflow-y: scroll;
}

.tierImg {
	float: left;
	width: 30px;
	height: 30px;
}

.replyMost {
	width: 70px;
	height: 70px;
	float: left;
}

input#replySubmit {
	width: 150px;
	height: 50px;
	font-size: 25px;
	margin-left: 30px;
	background-color: white;
	line-height: 50px;
}

.writeEmailNickname, .replyWriteContent {
	float: left;
	border: 1px solid gray;
}

.emailNickname {
	width: 200px;
	height: 50px;
}

.replyWriteContent {
	width: 300px;
	height: 50px;
}

.replyWrite .replySubmit {
	float: right;
}

.parentId {
	visibility: hidden;
}
</style>
</head>
<title>${board.nickname}님의${board.title}</title>
<c:if test="${!empty message }">
	<script>alert("${message}");</script>
</c:if>

<body>
	<article>
		<div class="wrap">
			<div class="duoheader">
				<h1>듀오게시판</h1>
				<div id="backpage">
					<a href="matchingBoard">목록</a>
				</div>
			</div>
			<div class="detailWrap">
				<h2 class="title">${board.title}</h2>
				<div id="writerDiv">
					<div class="sub_left">
						<div class="writerInfo">
							<img class="champ"
								src="${pageContext.request.contextPath}/resources/img/champion/${writerInfo.mostChamp }.png">
							<img class="tier"
								src="${pageContext.request.contextPath}/resources/img/ranked-positions/Position_${board.tier }_${board.lane }.png">
							<span>${board.nickname}</span>
							<div class="rates">
								<div class="board_wins">${writerInfo.wins }승</div>
								<div class="board_losses">${writerInfo.losses }패</div>
							</div>
							<div class="clear"></div>
						</div>
					</div>
					<div class="sub_right">

						<img id="boardCount"
							src="${pageContext.request.contextPath}/resources/img/eye.png">
						<span>${board.readcount}</span> <img id="boardEye"
							src="${pageContext.request.contextPath}/resources/img/date.png">
						<span>${board.writeDate }</span> <img id="boardMenu"
							src="${pageContext.request.contextPath}/resources/img/menu.png">
					</div>
				</div>
			</div>

			<div class="boardSub">
				<div id="boardSiren"
					onclick="openService('matching',${board.matchingBoardId})">신고하기</div>

				<div class="updateDelete">
					<a class="update" href="matchingUpdate?id=${board.matchingBoardId}"><button>수정</button></a>
					<a class="delete" href="matchingDelete?id=${board.matchingBoardId}"><button>삭제</button></a>
				</div>
			</div>

			<div class="detailContent">${board.content}</div>



			<div class="replyWrite">
				<div id="laneWrapper">
					<img class="lane lane_sel"
						src="${pageContext.request.contextPath}/resources/img/ranked-positions/Position_${loginUser.tier}_TOP.png">
					<img class="lane lane_sel"
						src="${pageContext.request.contextPath}/resources/img/ranked-positions/Position_${loginUser.tier}_JUNGLE.png">
					<img class="lane lane_sel"
						src="${pageContext.request.contextPath}/resources/img/ranked-positions/Position_${loginUser.tier}_MIDDLE.png">
					<img class="lane lane_sel"
						src="${pageContext.request.contextPath}/resources/img/ranked-positions/Position_${loginUser.tier}_BOTTOM.png">
					<img class="lane lane_sel"
						src="${pageContext.request.contextPath}/resources/img/ranked-positions/Position_${loginUser.tier}_UTILITY.png">
					<img class="lane lane_sel"
						src="${pageContext.request.contextPath}/resources/img/ranked-positions/Position_${loginUser.tier}_NONE.png">
				</div>
				<div class="replyHeader">
					<input id="parentId" type="hidden" name="matchingBoardId"
						value="${board.matchingBoardId}">

					<div id="writer_wrapper">
						<input type="hidden" name="lane" value="NONE"> <img
							id="selectLane" class="lane"
							src="${pageContext.request.contextPath}/resources/img/ranked-positions/Position_${loginUser.tier}_NONE.png"
							alt="lane"> <span>${loginUser.nickname}</span>
					</div>
					<div id="replyWriteContent">
						<p id="replyContent" contenteditable="true"></p>
						<input id="replySubmit" type="button" value="등록">
					</div>
				</div>
			</div>


			<div id="replyWrap"></div>
		</div>
	</article>
</body>
<script type="text/javascript">
var parentId = $('.parentId').val();
var writerLane = "${board.lane}";

//TIER ENUMERATION
var UNRANKED = 0;
var BRONZE = 1;
var SILVER = 2;
var GOLD  =  3;
var PLATINUM = 4;
var DIAMOND = 5;
var MASTER = 6;
var GRANDMASTER = 7;
var CHALLENGER = 8;

//
var tierCal=${board.tier}-${loginUser.tier};
var matchingBoardId = ${board.matchingBoardId};
var wins   = ${writerInfo.wins};
var losses = ${writerInfo.losses};
var total = wins+losses;

//wrtier mostChamp
var writerMost = ${writerInfo.mostChamp };

$(document).ready(function(){	
	console.log(parentId);
	
	var now = new Date().getTime();
	console.log(now);
	if(${board.expired} < now){ 
		alert("만료된 게시글 입니다.");
		location.href="matchingBoard";
	}
	/* 일단 선택 버튼 가리고 시작 자기글이면 선택버튼 보이게 */
	$(".choiceButton").hide();
	$(".update").hide();
	$(".delete").hide();
	$("#boardSiren").show();
	/* 자기글에 댓글 못 쓰게 */
	if("${loginUser.email}"=="${board.email}"){
		$(".replyWrite").hide();
		$(".choiceButton").show();
		$(".update").show();
		$(".delete").show();
		$("#boardSiren").hide();
	}
	
	if( tierCal < -1 || tierCal > 1) {
		$(".replyWrite").hide();		
	}
	
	//승률 짜기
	$(".board_wins").css("width",((wins/total)*100)+"%");
	$(".board_losses").css("width",((losses/total)*100)+"%");
	
	//리플 목록 불러오기
	$.get("getReplys",{"matchingBoardId":matchingBoardId},function(json){
		getReplyList(json);
		hideReplyWrite(json);
	},"json");
});

$("#replySubmit").on("click",function(){
	var content = $("#replyContent").text();
	
	if(content==""){
		alert("내용을 입력해주세요.");
		return ;
	}else {
		var lane = $("input[name='lane']").val();
		
		if(lane==null){
			alert("라인을 선택해주세요.");
		}
		else if(lane==writerLane&&writerLane!="NONE"){
			alert("작성자와 다른 라인을 선택해주세요.");
			
		}
		else{
			$("#replyContent").text("");
			
			var send = {
					"matchingBoardId":matchingBoardId,
					"content" : content,
					"lane" : lane
			};
			//WRITE REPLY
			$.post("matchingReplyAction",send,function(){
				$.get("getReplys",{"matchingBoardId":matchingBoardId},function(json){
					getReplyList(json);
					hideReplyWrite(json);
				},"json");
			},"text");
			
		}
	}
});

//SUBMENU toggle
$(document).on("click","#boardMenu",function(e){
	   $(this).toggleClass("menu_open");
	   console.log("aaa");
	   console.log(e.screenX);
	   console.log(e.screenY);
	   if($(this).hasClass("menu_open")){
	      console.log("true");
	      $(".boardSub").fadeIn(400);
	      $(".boardSub").css({"top":e.screenY-50,"left":e.screenX-60});
	   }else{
	      console.log("false");
	      $(".boardSub").fadeOut(400);
	   }
	});
var choiceFlag =false;
function choiceDuo(replyId,replyEmail){
	console.log(replyId);
	
	/* 
	<a class="${reply.nickname} choiceButton"
	 href="choice?nickname=${reply.nickname}
	 &matchingBoardId
	 =${board.matchingBoardId}
	 &lane1=${board.lane}&lane2=${reply.lane}"
	*/
	var nickname = $(".nickname"+replyId).text();//now <p> tag
	var replyEmail = $(".email"+replyId).val();
	var replyLane = $(".lane"+replyId).val();
	var writerLane = "${board.lane}";
	
	var send={
		"partnerEmail" : replyEmail,
		"nickname"  : nickname,
		"matchingBoardId" : matchingBoardId,
		"email2" :  replyEmail,
		"lane1" : writerLane,
		"lane2" : replyLane,
		"mostChamp1" : writerMost
	};
	choiceFlag = true;
	if(!choiceFlag){	
		$.post("choice",send,function(text){
			
			if(text=="open"){
				alert("채팅방이 열렸습니다.");
				location.href = "liveChat";
			}else if(text=="fail"){
				alert("상대방이나 회원님의 채팅방 이용개수가 초과되었습니다. (최대 : 3개)");
			}else if(text=="exists"){
				alert("이미 채팅중인 상대입니다.");
				location.href="liveChat";
			}
			choiceFlag = false;
		},"text");
	}else {
		alert("이미 선택중입니다.");
	}
}

function getReplyList(replys){
	   
	   $("#replyWrap").empty();
	   console.log(replys);
	   
	   for(var i=0;i < replys.length;i++){
	      
	      $("#replyWrap").append("<div class='reply'></div>");
	      $(".reply:last-child").append("<div class='replyInfo'></div>");
	      //mostChamp
	      $(".reply:last-child > .replyInfo").append("<img class='replyMost' src=${pageContext.request.contextPath}/resources/img/ranked-positions/Position_"+replys[i]['tier']+"_"+replys[i]['lane']+".png>")
	      $(".reply:last-child > .replyInfo")
	      .append("<img class='tierImg' src=${pageContext.request.contextPath}/resources/img/ranked-positions/Position_"+replys[i]['tier']+"_"+replys[i]['lane']+".png>");
	      $(".reply:last-child > .replyInfo").append("<input type='hidden' class='email"+replys[i]['replyId']+"' value='"+replys[i]['email']+"'>");
	      $(".reply:last-child > .replyInfo").append("<input type='hidden' class='lane"+replys[i]['replyId']+"' value='"+replys[i]['lane']+"'>");
	      $(".reply:last-child > .replyInfo").append("<span class='nickname"+replys[i]['replyId']+"'>"+replys[i]['nickname']+"</span>");
	      $(".reply:last-child").append("<div class='replyContent'>"+replys[i]['content']+"</div>");
	      $(".reply:last-child .replyContent").append("<div class='replyWriteDate'>"+replys[i]['writeDate']+"</div>");
	      if("${loginUser.email}"=="${board.email}"){
	         $(".reply:last-child").append("<button class='btn_choice' onclick=choiceDuo("+replys[i]['replyId']+","+"'"+replys[i]['email']+"')>선택</button>");   
	      }
	      $(".reply:last-child").append("<div class='clear'></div>");
	   }
	}

	//lane wrapper CSS
	$("#selectLane").on("click",function(){
	   console.log("aaa");
	   $("#laneWrapper").toggle("fast");   
	   return false;
	});
	
	function selectLane(value){
	   console.log(value);
	   $("#selectLane").attr("src","${pageContext.request.contextPath}/resources/img/ranked-positions/Position_${loginUser.tier}_"+value+".png");
	   $("#laneWrapper").toggle("fast");
	   $("input[name='lane']").val(value);
	   return false;
	};
	
	$(".lane_sel").on("click",function(){
	   console.log("aaa");
	   var index = $(".lane_sel").index(this);
	   
	   console.log(index);
	   var lane;
	   switch(index){
	   case 0:
	      lane = "TOP";
	      break;
	   case 1:
	      lane = "JUNGLE";
	      break;
	   case 2:
	      lane = "MIDDLE";
	      break;
	   case 3:
	      lane = "BOTTOM";
	      break;
	   case 4:
	      lane = "UTILITY";
	      break;
	   case 5:
	      lane = "NONE";
	      break;
	   }
	   selectLane(lane);
	});

function hideReplyWrite(replies){
	   for(var i=0; i<replies.length; i++){
	      if("${loginUser.nickname}"== replies[i]['nickname']){
	         $(".replyWrite").hide();
	      }
	   }
}


	
</script>
</html>
