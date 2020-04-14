<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
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

#boardDiv {
	height: 600px;
	min-width: 100%;
	max-width: 100%;
	margin-top: 150px;
	color: rgb(51, 51, 51);
	font-size: 14px;
}

#pageDiv {
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

.targetId {
	width: 70px;
}

.troller {
	width: 80px;
}

.writeDate {
	width: 250px;
}

.service_value {
	width: 200px;
}

.nickname {
	width: 200px;
}

.clear {
	clear: both;
}

#topDiv {
	margin-top: 50px;
}

h5 {
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

#src_troller:focus {
	outline: 1px solid #8ba3d1;
}

.underCount{
	margin: 0 20px;
	color:#888;
	font-family: "Tahoma";
	font-size: 19px;
}

.underCount:hover{
	color: #1c6ac3;
}

#talkImg{
	float: left;
	margin-right:15px;
	margin-top:5px;
	width: 50px;
	height: 50px;
}



</style>
</head>
<body>
	<article>
		<c:if test="${loginUser.admin_ != 'Y' }">
			<script>
				//alert("관리자만 이용 가능합니다.");
				//location.href="main";
			</script>
		</c:if>
		<div id="wrap">
		
			<div id="topDiv">
			<img src="${pageContext.request.contextPath}/resources/img/talk.png" id="talkImg">
				<h5>고객센터</h5>
			</div>
			<div id="boardDiv">
				<div id="contentDiv">
					<span>신고</span> <span id="content"></span>
					<div class="toolbar"></div>
				</div>
				<div id="oneBoardDivHead">
					<div class="boardId">번호</div>
					<!--  <div class="expiredText">투표종료</div> -->
					<div class="nickname">신고자</div>
					<div class="troller">신고타입</div>
					<div class="targetId">대상번호</div>
					<div class="writeDate">신고 날짜</div>
					<div class="service_value">신고내용</div>
					<!-- <div class="readcount">조회수</div>  -->
					<!-- <div class="upAndDown">트롤</div> -->
					<div class="clear"></div>
				</div>
				<c:forEach var="serviceBoardList" items="${serviceBoardList}">
					<div class="oneBoardDiv" onclick='showDetail("${serviceBoardList.type}",${serviceBoardList.targetId},${serviceBoardList.serviceId })'>
						<!--  <input type="hidden" class="expired" style="display: none;"
							value="${serviceBoardList.serviceId}"> --> <input type="hidden"
							class="boardIdVal" value="${serviceBoardList.serviceId}">
						<div class="boardId">${serviceBoardList.serviceId}</div>
						<!--  <div class="expiredText" style="color: red;"></div> -->
						<div class="nickname">${serviceBoardList.email }</div>
						<div class="troller">${serviceBoardList.type }</div>
						<div class="targetId">${serviceBoardList.targetId }</div>
						<div class="writeDate"><fmt:formatDate value="${serviceBoardList.writeDate }" type="date" pattern="yy-MM-dd HH:mm"></fmt:formatDate></div>
						<div class="service_value">${serviceBoardList.content }</div>
						<div class="clear"></div>
					</div>
				</c:forEach>
			</div>
			
			<!-- page 가 음수가 되는 부분에서 처리  -->
			<div class="clear"></div>
		</div>
	</article>
</body>
<script type="text/javascript">
$(document).on("change","#suspensionType",function(){
	//접수 타입이 변경시 실행
	if($("#suspensionType").val()==4){
		$("#duration").css("display","none");
		return false;
	}else {
		$("#duration").css("display","inline");
	}
});

$(document).on("keydown","#duration",function(e){
	//ONLY NUMBER
	console.log(e);
	
	if(e.which < 48|| e.which > 57){
		//8:backspace 49:0 ~ 46:9 
		if(e.which!=8 && e.which!=13){
			return false;	
		}
	}
	
})

function showDetail(type,targetId,serviceId){
	//protocol : reportType , targetId
	//reportType : 1: discBoard, 2: discReply, 3: free, 4:freeReply, 5: duoChat
	
	var send={
			"type":type,
			"targetId":targetId
	};
	
	console.log(send);
	
	$.post("serviceDetail",send,function(text){
		console.log(text);
		//email,content
		var receiveData = text.split(',');
		console.log(receiveData);
		
		$("#content").text("[ "+receiveData[0]+" ]"+receiveData[1]);
		$(".toolbar").empty();
		
		$("#contentDiv > .toolbar").append("<select id='suspensionType'></select>");
		$("#contentDiv > .toolbar").append("<input type='text' id='duration' placeholder='정지기간'>");
		$(".toolbar > #suspensionType").append("<option value=1>계정정지");
		$(".toolbar > #suspensionType").append("<option value=2>채팅정지");
		$(".toolbar > #suspensionType").append("<option value=3>트롤정지");
		$(".toolbar > #suspensionType").append("<option value=4>게시글 삭제");
		$("#contentDiv > .toolbar").append("<input type='hidden' id='serviceType' value="+type+">");
		
		$("#contentDiv > .toolbar").append("<button onclick=suspension("+serviceId+",'"+receiveData[0]+"',"+targetId+")>신고 접수</button>");
		$("#contentDiv > .toolbar").append("<button onclick='serviceDelete("+serviceId+")'>신고 철회</button>");
	},"text");
}
function suspension(serviceId,email,targetId){
	var serviceType = $("#serviceType").val();
	var suspensionType = $("#suspensionType").val();
	var duration = $("#duration").val();
	console.log(suspensionType);
	
	var send = {
		"serviceId":serviceId,
		"email" :email,
		"serviceType" : serviceType,
		"suspensionType" : suspensionType,
		"duration"  : duration, 
		"targetId" : targetId
	};
	
	console.log(send);
	
	
	$.post("serviceSuspension",send,function(text){
		//suspensionType : 1.계정정지 2.채팅정지 3.트롤정지 4.게시글삭제
		
		//1. serviceId
		//2. 게시글 작성자 email...
		//3. content
		location.reload();
	},"text");
}
function serviceDelete(serviceId){
	$.get("serviceDelete",{"serviceId":serviceId},function(){
		location.reload();
	},'text');
}
</script>
</html>