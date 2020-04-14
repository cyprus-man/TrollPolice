<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/header.jsp"%>




<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 보기</title>
<style>
* {
   margin: 0;
   padding: 0;
   text-decoration: none;
}
#wrap {
   min-width: 1010px;
   max-width: 1010px;
   margin: 0 auto;
   
}
#modifyReply{
	width:600px;
	height:130px;
	background-color:gray;
	padding:10px;
	z-index:10;
	visibility:hidden;
}

table{
	width:1000px;
}
div#content_article>p {
    text-align: start;
}
table,tr,th{
	border-bottom: 1px solid #e4e4e4;
	padding:5px 3px;
	text-align: center;
}
th{
	background-color: #f9f9f9;
}
td{
	font-size:14px;
}
#boardselect{
	background-color: #f9f9f9;
	font-weight:bold;
	border-bottom: 1px solid #e4e4e4;
	padding:5px 0;
}

button{
  background:#a3a3a3;
  color:#fff;
  border:none;
  height:30px;
  font-size:16px;
  padding:0 2em;
  cursor:pointer;
  outline:none;
  border-radius: 12px;
}
#listdo{
  background:#a3a3a3;
  color:#fff;
  border:none;
  position:relative;
  height:30px;
  font-size:16px;
  padding:0 2em;
  cursor:pointer;
  outline:none;
  border-radius: 12px;
}

#replyboard{
	margin-left:200px;	
}
#listReply{
	margin-left:200px;
}
#content_article{
	width:820px;
	min-height:600px;
}
p{
	width:820px;
	min-height:600px;
}

</style>
</head>
<body>
<div id="wrap">
	<form name="form1" method="post">
		<input type="hidden" name="bno" value="${dto.bno}">
	</form>
		<table style="table-layout: fixed">	
		<caption id="boardselect">게시글 보기</caption>
		<tr>
			<th>번호</th>
			<td style="border-bottom: 1px solid #e4e4e4;">${dto.bno}</td>
			<th>작성자</th>
			<td style="border-bottom: 1px solid #e4e4e4;">${VO.writer}</td>
			<th>등록일</th>
			<td style="border-bottom: 1px solid #e4e4e4;"><fmt:formatDate value="${dto.regdate}" pattern="yyyy.MM.dd KK:mm"/></td>
		</tr>	
		<tr>
			<th>제목</th>
			<td style="border-bottom: 1px solid #e4e4e4;">${dto.title }</td>
			<th>조회수</th>
			<td style="border-bottom: 1px solid #e4e4e4;">${dto.viewcnt}</td>
		</tr>
		<tr>
			<th height="300px;">내용</th>
			<td><div id="content_article">${dto.content }</div></td>
		</tr>
		</table>
	
		<div id="replyboard">	
			<div style="width:650px; text-align:center;" >
			 	<c:if test="${loginUser.email == dto.writer }">
				<button type="button" id="btnUpdate">수정</button>
				<button type="button" id="btnDelete">삭제</button>
				</c:if>
			</div>
			<a href="/trollPolice1/freeBoardList" id="listdo" >목록보기</a>
			<div style="width:650px; text-align:center;">
				<br>
				<c:if test="${not empty loginUser }">
				<textarea rows="6" cols="90" id="replytext" placeholder="댓글을 작성해주세요" ></textarea>
				<br>
				<button type="button" id="btnReply">댓글 작성</button>
				</c:if>
			</div>
		</div>
	<div id="listReply"></div>
</div>


<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
$(document).ready(function(){
	listReplyRest("1");
	$("#btnList").click(function(){
		location.href="${path}/trollPolice1/freeBoardList?curPage=${curPage}&searchOption=${searchOption}&keyword=${keyword}";
	});
	$("#btnDelete").click(function(){
		if(confirm("삭제하시겠습니까?"))
			document.form1.action="freeBoardDelete";
			document.form1.submit();
		
	});
	$("#btnUpdate").click(function(){
		var title=$("title").val();
		var content=$("#content").val();
		document.form1.action="${path}/trollPolice1/freeBoardUpdateBoard?bno=${dto.bno}";
		document.form1.submit();
	});
	$("#btnReply").click(function(){
		replyJson();
	});
	
});
function replyJson(){
	var replytext=$("#replytext").val();    
	var bno="${dto.bno}";
	$.ajax({
		type:"post",
		<%--	url:"/reply/insertRest.do",  --%>
		url:"<c:url value='/reply/freeReplyInsertRest'/>",	
		headers: {
			"Content-Type" : "application/json"
		},
		dataType:"text",
		data: JSON.stringify({
			bno : bno,
			replytext : replytext
		}),
		success:function(){
			alert("댓글이 등록되었습니다.");
			listReplyRest("1");
		}
	});
};
function listReplyRest(num){
	$.ajax({
		type:"get",
			url:"<c:url value='/reply/freeReplyList/${dto.bno}/'/>"+num, 
		success:function(result){
			$("#listReply").html(result);
		}
	});
}
//댓글 수정화면 생성함수
function showReplyModify(rno){
	$.ajax({
		type:"get",
		url:"<c:url value='/reply/freeReplyDetail/'/>"+rno,
		success:function(result){
			$("#modifyReply").html(result);
			$("#modifyReply").css("visibility","visible");
		}
	});
}
</script>
</body>
</html>