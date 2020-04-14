<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>댓글 상세보기 화면</title>
</head>
<body>
	<textarea id="detailReplytext" rows="5" cols="82">${vo.replytext }</textarea>
	<div style="text-align:center;">
		<c:if test="${loginUser.nickname==vo.replyer }">
			<button type="button" id="btnReplyUpdate">수정</button>
			<button type="button" id="btnReplyDelete">삭제</button>
		</c:if>
		<button type="button" id="btnReplyClose">닫기</button>
	</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
	$("#btnReplyUpdate").click(function(){
		if(confirm("수정 하시겠습니까?")){
			var detailReplytext=$("#detailReplytext").val();
			$.ajax({
				type:"put",
					url:"<c:url value='/reply/freeReplyUpdate/${vo.rno}'/>", 
				headers: {
					"Content-Type":"application/json"
				},
				data: JSON.stringify({
					replytext : detailReplytext 
				}),
				dataType: "text",
				success:function(result){
					if(result == "success"){
						alert("수정이 완료되었습니다.");
						$("#modifyReply").css("visibility","hidden");
						listReplyRest("1");
					}
				}
			});
		}
	});
	$("#btnReplyClose").click(function(){
		$("#modifyReply").css("visibility","hidden");
	});
	$("#btnReplyDelete").click(function(){
		if(confirm("삭제하시겠습니까?")){
			$.ajax({
				type:"delete",
				
				url:"<c:url value='/reply/freeReplyDelete/${vo.rno}'/>",  
				success:function(result){
					if(result=="success"){
						alert("삭제되었습니다.");
						$("#modifyReply").css("visibility","hidden");
						listReplyRest("1");
					}
				}
			});
		}
	});
</script>
</body>
</html>