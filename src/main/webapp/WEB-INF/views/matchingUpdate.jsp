<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style type="text/css">
	*{
		margin: 0; padding: 0;	
		font-size: 14px;	
		text-decoration: none;
	}
	hr{
		visibility:hidden;
		clear: both;
	}
	.wrap{
		width: 650px;
		margin:10px auto;
	}
	.writeWrap{
		width: 650px;
		margin-top: 80px;			
	}
	.writeHeader{
		width: 640px;
		height: 30px;
	}
	.writer_wrapper>span{
		line-height:39px;
		height:100%;
	}
	#laneWrapper{
		width: 250px;
    	height: 35px;
    	border: 1px solid #e7e7e7;
    	display:none;
	}
	.lane{
		width:30px;
		height:30px;
		margin:0 3px;
		cursor: pointer;
	}
	.emailNickname, .title{
		float: left;		
	}
	.emailNickname p, .title input{
		margin: 5px 0 0 5px;
	}
	.title input{
		width: 275px;
	}
	.emailNickname{
		width: 350px; height: 30px;	
	}
	.title{
		width: 100%; height: 30px;		
	}
	#title{
		width:100%;
		height:100%;
		line-height: 30px;
		border-bottom:1px solid gray;
	}
	.content{
		margin-top:20px;
		width: 640px;
		height: 300px;
		border:1px solid gray;
	}
	#content{
		width:100%;
		height:100%;
	}
	.submit{
	width: 150px;
    height: 50px;
    margin: 20px auto;
    display: block;
    border: none;
    font-size: 20px;
    color: white;
    background: #f6890a;
	}
	.submit:hover{
		cursor:pointer;
	}
</style>
<title>MatchingBoardWrite</title>
</head>
<c:if test="${!empty message }" >
	<script>alert("${message}");</script>
</c:if>
<body>
<article>
	<div class="wrap">
	
		<div class="writeWrap">
			<form method="post" id="matching" action="matchingUpdateAction">			
				<div class="writeHeader">
					<div id="laneWrapper">
						<img class="lane lane_sel"  src="${pageContext.request.contextPath}/resources/img/ranked-positions/Position_${loginUser.tier}_TOP.png">
						<img class="lane lane_sel"  src="${pageContext.request.contextPath}/resources/img/ranked-positions/Position_${loginUser.tier}_JUNGLE.png">
						<img class="lane lane_sel" src="${pageContext.request.contextPath}/resources/img/ranked-positions/Position_${loginUser.tier}_MIDDLE.png">
						<img class="lane lane_sel" src="${pageContext.request.contextPath}/resources/img/ranked-positions/Position_${loginUser.tier}_BOTTOM.png">
						<img class="lane lane_sel" src="${pageContext.request.contextPath}/resources/img/ranked-positions/Position_${loginUser.tier}_UTILITY.png">
						<img class="lane lane_sel"  src="${pageContext.request.contextPath}/resources/img/ranked-positions/Position_${loginUser.tier}_NONE.png">
					</div>
					<div class="writer_wrapper">
						<input type="hidden" name="lane" value="NONE">
						<img id="selectLane" class="lane" src="${pageContext.request.contextPath}/resources/img/ranked-positions/Position_${loginUser.tier}_NONE.png" alt="NONE">
						
						<span>${loginUser.nickname }</span>
						<span style="float:right;">DUO</span>
					</div>
					<div class="title">
						<input type="hidden" name="title">
						<p id="title" contenteditable="true" >TITLE</p>
					</div>
				</div>
				<div>
				</div>
				<hr>
				<div class="content">
					<input type=hidden name='content'>
					<p contenteditable="true" id='content'>
				</div>		
				<input type="hidden" name="id" value="${board.matchingBoardId}" >
				<input class="submit"  type="button" value="수정">
			</form>
		</div>				
	</div>
</article>

</body>
<script type="text/javascript">
var ajaxFlag = false;
$(document).ready(function(){
	var email = "${board.email}";
	var userMail = "${loginUser.email}";
	
	if(email!=userMail){
		alert("본인이 작성한 글만 수정 가능합니다,");
		location.href="matchingBoard";
	}
})


$(document).ready(function(){
	if(ajaxFlag){
		alert("이미 조회중입니다.");
		return false;
	}
	ajaxFlag = true;
	
	$.post("validDuo",{},function(text){
		console.log(text);
		
		if(text=="FAIL"){
			alert("로그인후 이용가능합니다.");
			location.href="login";
			return false;
		}
		if(text=="PASS"){
			//페이지 이동 막기..
		}else if(text=="EXCEED"){
			alert("이미 듀오의 최대치를 초과했습니다.");
			location.href="matchingBoard";
		}
		ajaxFlag = false;
	},"text");
});

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

$(document).on('click','.submit',function(){
	$("input[name='content']").val($('.content p').html());
	$("input[name='title']").val($("p#title").html());
	var content = $("input[name='content']").val();
	var titleSize = $("input[name='title']").val().length;
	
	console.log(titleSize+":"+content);
	
	if(titleSize >= 5 && content.length > 10){
		$("form#matching").submit();
	}else {
		alert("제목을 5자 이상 내용을 10자 이상 입력해주세요");
	}
	
});

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

</script>

</html>


