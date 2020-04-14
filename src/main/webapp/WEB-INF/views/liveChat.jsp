<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${loginUser.nickname}님의채팅방</title>
</head>
<style>
#chat_wrap {
	border: 1px solid black;
	min-width: 424px;
	max-width: 350px;
	min-height: 700px;
	margin: 0 auto;
	margin-top: 25px;
	background: #b4c8dc;
	padding: 2%;
	border-radius: 20px;
}

.chat_row {
	width: 100%;
	background: white;
	height: 140px;
	margin-bottom: 30px;
}

.champ_div {
	float: left;
	width: 120px;
	height: 100%;
	position: relative;
}

.champ {
	display: inline-block;
	/*border:1px solid black;*/
	border-radius: 100px;
	width: 60px;
	height: 60px;
	position: absolute;
	top: 50%;
	left: 50%;
	margin-top: -30px;
	margin-left: -30px;
	background-repeat: none;
	background-position: center;
	background-size: cover;
}

.champ_div>h6 {
	font-size: 20px;
	text-align: center;
}

.champ_div>span {
	display: block;
	width: 100px;
	position: absolute;
	bottom: 10%;
	left: 50%;
	margin-left: -50px;
	text-align: center;
	font-size: 10px;
}

.chat_text {
	word-break: break-all;
	width: 100%;
	height: 100%;
}

.chat_msg_div {
	float: left;
	min-width: 300px;
	height: 100%;
	position: relative;
}

.message_cnt {
	float: right;
	width: 30px;
	height: 30px;
	text-align: center;
	line-height: 30px;
	background-color: red;
	color: white;
	font-size: 20px;
	border-radius: 30px;
}

.chat_msg {
	position: absolute;
	width: 80%;
	min-height: 65px;
	margin: 0 auto;
	margin-top: 15px;
}

.chat_toolbar {
	width: 50%;
	height: 30px;
	line-height: 30px;
	text-align: center;
	border: 1px solid black;
	bottom: 10%;
	right: 10%;
	position: absolute;
	/*수정*/
	margin-top: 4%;
}

.chat_toolbar>div {
	width: 49%;
	float: left;
	font-size: 14px;
}

.chat_toolbar>div:last-child {
	border-left: 1px solid black;
}

.chat_toolbar>div:hover {
	cursor: pointer;
}

.chat_toolbar>#message {
	width: 72.5%;
	font-size: 17px;
}

.tier {
	width: 35px;
	height: 35px;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
	position: absolute;
	bottom: 0;
	margin-bottom: 15px;
	left: 0;
}

.room_most_champ {
	width: 60px;
	height: 50px;
	margin-top: 10px;
	margin-left: 10px;
	border-radius: 10px;
	display:block;
}

#chat_content {
	max-height: 520px;
	width: 424px;
	position: relative;
	overflow-y: scroll;
	position: relative;
}

#chat_content_header {
	position: static;
	border: 1px solid black;
	height: 50px;
	background-color: rgb(287, 191, 45);
}

#chat_content_header h3 {
	text-align: center;
	width: 85%;
	line-height: 52px;
	float: right;
}

#message {
	width: 75.5%;
	margin-left: 5%;
	height: 40px;
	margin-top: 30px;
}

#send_data {
	width: 50px;
	height: 44px;
	font-size: 15px;
	background: rgb(287, 191, 45);
	border: none;
	font-weight: bold;
}

.clear {
	clear: both;
}

.message_cnt {
	display: none;
}

.chat_msg_div span {
	font-size: 14px;
}

.chat {
	display: none;
}

.back_btn {
	width: 60px;
	height: 60px;
	display: block;
	border: 1px solid gray;
	border-radius: 30px;
	margin: 0 auto;
	margin-top: 30px;
}

.content_row {
	margin-bottom: 30px;
}

.content {
	position: relative;
	background: white;
	border-radius: 10px;
	padding: 15px;
}

.content.notMine:after {
	border-top: 0px solid;
    border-left: 20px solid transparent;
    border-right: 10px solid transparent;
    border-bottom: 20px solid white;
    content: "";
    position: absolute;
    top: 0;
    left: -15px;
}

.content.mine:after {
	border-top: 0px solid transparent;
	border-left: 10px solid transparent;
	border-right: 20px solid transparent;
	border-bottom: 20px solid white;
	content: "";
	position: absolute;
	bottom: 0;
	right: -15px;
}

.content_row .sender {
	width: 30%;
	margin-left: 0%;
	font-weight: bold;
}

.content_row .content {
	width: 62%;
	margin-left: 100px;
	margin-top: -60px;
	font-size: 12px;
}

.content_row .room_date {
	text-align: right;
	font-size: 13px;
	width: 95%;
	margin-bottom: 5px;
}
</style>
<body>
	<div id="chat_wrap">
		<input type="hidden" id="nowChatId">

		<c:forEach var="room" items="${rooms}">
			<div class='chat_row'>
				<input type='hidden' value="${room.chatExpired}" class='chatExpired'>
				<!-- TO GET MOST CHAMP -->
				<c:if test="${room.email1==loginUser.email }">
					<input class="myMost${room.chatId}"
						value=${room.mostChamp1
						} type="hidden">
				</c:if>
				<c:if test="${room.email1!=loginUser.email }">
					<input class="myMost${room.chatId}"
						value=${room.mostChamp2
						} type="hidden">
				</c:if>

				<input type="hidden" class="chat_id" value="${room.chatId}">
				<div class='champ_div'>

					<!-- 상대방 LANE -->
					<c:choose>
						<c:when test="${loginUser.email==room.email1 }">
							<h6>${room.lane2 }</h6>
							<div class='champ'
								style="background-image: url('${pageContext.request.contextPath}/resources/img/champion/${room.mostChamp2 }.png');">
							</div>
						</c:when>
						<c:otherwise>
							<h6>${room.lane1 }</h6>
							<div class='champ'
								style="background-image: url('${pageContext.request.contextPath}/resources/img/champion/${room.mostChamp1 }.png');">
							</div>
						</c:otherwise>
					</c:choose>

					<span id="nickname${room.chatId }">${room.nickname }</span>
				</div>

				<div class='chat_msg_div'>

					<div class='chat_msg'>
						<c:if test="${room.liveChatContent != null}">
							<span class='sender'>[${room.liveChatContent.sender}]</span>
							<span class='send_content'>${room.liveChatContent.content}</span>

							<!-- MESSAGE COUNT 1이상인 경우에만 출력 -->
							<div class='message_cnt message_cnt${room.chatId}'>${room.confirmCount }</div>
							<hr>
							<span class='send_date_format'>${room.liveChatContent.dateFormat}</span>
						</c:if>
						<c:if test="${room.liveChatContent == null}">
							<!-- 방이 개설된 경우 -->
							<c:if test="${room.isEnd == 'N' }">
								<span>채팅방이 개설 되었습니다.</span>
								<hr>
								<span><fmt:formatDate value="${room.createDate }"
										type="both" dateStyle="short" timeStyle="short" /></span>

							</c:if>
							<c:if test="${room.isEnd == 'Y' }">
								<span>${room.nickname}님과의 채팅이 만료되었습니다.</span>
								<hr>
								<span><fmt:formatDate value="${room.createDate }"></fmt:formatDate></span>
							</c:if>
						</c:if>
					</div>
					<c:if test="${room.isEnd=='N' }">
						<div class='tier'
							style="background-image: url('${pageContext.request.contextPath}/resources/img/tier_emblem/Emblem_${room.tier}.png');"></div>
						<div class='chat_toolbar'>
							<div class="btn_enter"
								onclick="enterRoom(${room.chatId },'${room.nickname }')">입장</div>
							<div class="btn_exit" onclick="exitRoom(${room.chatId})">나가기</div>
						</div>
					</c:if>
				</div>
				<div class='clear'></div>
			</div>
		</c:forEach>

		<div class="chat">
			<div id=chat_content_header>
				<img
					src='${pageContext.request.contextPath}/resources/img/mySiren.png'
					id="chat_report" onclick="openService('chat',nowChat)">
				<h3></h3>
			</div>
			<div id="chat_content"></div>
			<div id="chat_toolbar">
				<input type="text" id="message">

				<button id="send_data">전송</button>

				<button class="back_btn" id="btn_go_list"></button>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	var wsURI = "ws://localhost:8181/trollPolice1/chat.do";
	var websocket;
	var nickname = "${loginUser.nickname}";
	var nowChat;
	var inRoomFlag = false;
	var myMost;
	
	
	//room Id send 
	$(document).ready(function() {
		if($(".chat_row").length>0)
			connect();
		
		$(".chat_row").each(function(i){
			i+=2;
			console.log("chat_row index : "+i);
			
			var sendContent = $(".chat_row:nth-child("+i+") .send_content").text();
			
			if(sendContent.length >= 15){
				sendContent = sendContent.substr(0,13);
				sendContent += "...";
				$(" .send_content").text(sendContent);
			}	
		});
		
		
	})

	
	$(document).on("click","#btn_go_list", function() {
		console.log("aaa");
		inRoomFlag = false;
		goRoomList();
		$(".chat_row").css("display", "block");
		$(".message_cnt"+nowChat).css("disaplay","none");
		$(".chat").css("display", "none");
	}); 
	$("#message").keypress(function(e){
		if(e.which==13){
			$("#send_data").click();
			return false;
		}
	})
	$("#send_data").on("click", function() {
		var msg = $("#message").val();
		$("#message").val("");
		doSend(msg);
	});
	
	
	function enterRoom(chatId,nickname){
		nowChat = chatId;
		console.log(nickname);
		myMost = $(".myMost"+nowChat).val();
		$("#chat_content_header > h3 ").text(nickname+" 님과 의 채팅");
		
		$(".chat_row").css("display", "none");
		$(".chat").css("display", "block");
		
		inRoomFlag = true;
		//만료됨 체크
		
		//show chat contents
		getContents();
	}
	
	function goRoomList(){
		$.get("goRoomList",{"chatId":nowChat,"email":"${loginUser.email}"},function(json){
			console.log(json);
			if(json["count"]>0){
				$(".message_cnt"+json['chatId']).text(json["count"]);
				$(".message_cnt"+json["chatId"]).css("display","block");
			}
			else
				$(".message_cnt"+json["chatId"]).css("display","none");
		},"json");
	}
	function connect() {
		websocket = new WebSocket(wsURI);

		websocket.onopen = function(e) {
			websocket.onclose = function(e) {
				websocket.close();
				alert("연결이 종료되었습니다.");
				location.reload();
			};
			websocket.onmessage = function(e) {
				onMessage(e);
				var scrollDown = document.getElementById("chat_content");
				scrollDown.scrollTop=scrollDown.scrollHeight;
			};
			websocket.onerror = function(e) {
				onError(e);
			};
		};
	};
	
	
	function onMessage(e) {
		console.log("onMessage");
		var command = e.data.substr(0,5);
		
		if(command=="alert"){
			//e.data = "type":"chatId" -->string
			//방 나가기
			var chatId = e.data.split(":")[1];
			var nickname = $("#nickname"+chatId).text();
			console.log(chatId);
			alert(nickname+"님과의 채팅방이 만료되었습니다.");
			location.reload();
		}else{
		
			var object = JSON.parse(e.data);
			console.log(object);
			
			if(inRoomFlag){
				//data
				if(nowChat==object["chatId"]){
					onMessageInRoom(object);
				}
			}
			//안읽은 메세지 수 출력
			onMessageInList(object);
		}
	}

	function onError(e) {
		alert("ERROR 문의 바랍니다.");
	}

	function doSend(message) {
		var nickname = "${loginUser.nickname}";
		
		var send = {
				"sender" : nickname,
				"chatId" : nowChat,
				"content" : message,
				"mostChamp" : myMost,
				"sendDate" : new Date()
		};
		
		$.get("chatSendMsg", send, function() {
			var sendData = JSON.stringify(send);
			console.log(sendData);
			websocket.send(sendData);
		}, "text");

	}
	function getContents(){
		$("#chat_content").empty();
		
		
		$.get("getChatMsg",{"chatId":nowChat},function(contents){
			for(var i =0;i < contents.length;i++){
				onMessageInRoom(contents[i]);
			}
			var scrollDown = document.getElementById("chat_content");
			scrollDown.scrollTop=scrollDown.scrollHeight;
		},"json");
	}
	function onMessageInRoom(content){
		console.log(content);
		
		$("#chat_content").append("<div class='content_row'></div>");
		
		if(nickname!=content['sender']){
			$(".content_row:last-child").append("<img class='room_most_champ' src='${pageContext.request.contextPath}/resources/img/champion/"+content['mostChamp']+".png'>");
			$(".content_row:last-child").append("<div class='content notMine'><div class='chat_text'>"+content['content']+"</div></div>");
			$(".content_row:last-child > .content").prepend("<div class='sender' >"+content['sender']+"</div>");
			$(".content_row:last-child .content").append("<div class='room_date' >"+content['dateFormat']+"</div>");	
		}else {
			$(".content_row:last-child").append("<div class='room_most_champ'></div>");
			$(".content_row:last-child").append("<div class='content mine'><div class='chat_text'>"+content['content']+"</div></div>");
			$(".content_row:last-child .content").append("<div class='room_date' >"+content['dateFormat']+"</div>");
		}
		
		//$(".content_row:last-child").append("<button class='chat_report' onclick=chatReport("+content['chatId']+")>신고하기</button>")
		
		var scrollDown = document.getElementById("chat_content");
		scrollDown.scrollTop=scrollDown.scrollHeight;
	}
	function exitRoom(chatId){
		console.log(chatId);
		websocket.send("exit:"+chatId);
		
		$.post("exitRoom",{"chatId":chatId},function(){
			location.reload();
		},"text");
	}
	//TODO : ui 작성
	function onMessageInList(content) {
		//채팅 내용만 바꾼다
		console.log("onMessageInList");
		
		$(".chat_row").each(function(i){
			i+=2;
			console.log(i);
			
			console.log($(".chat_row:nth-child("+i+")").children(".chat_id").val());
			var chatId = $(".chat_row:nth-child("+i+")").children(".chat_id").val();
			var confirmCount = parseInt($(".chat_row:nth-child("+i+") .chat_msg").children("message_cnt"+content['chatId']).text());
			
			if(chatId==content['chatId']){
				console.log("chatId:"+chatId);
				var sendContent = content['content'];
				
				if(sendContent.length >= 15){
					sendContent = sendContent.substr(0,13);
					console.log(sendContent);
					sendContent += "...";
				}
				$(".chat_row:nth-child("+i+") .chat_msg").children(".sender").text("["+content['sender']+"]");
				$(".chat_row:nth-child("+i+") .chat_msg").children(".send_content").text(sendContent);
				$(".chat_row:nth-child("+i+") .chat_msg").children(".send_date_format").text(content['dateFormat']);
				
				$(".chat_row:nth-child("+i+") .chat_msg").children("message_cnt"+content['chatId']).text(confirmCount+1);
				//컨펌 숫자 변경
				return false;
			}
		});
	}
	//소켓 통신중에 만료되는 부분 전송...
	//doSend 에 넣음 됨
	function isExpired(){
		
	}
	
</script>
</html>