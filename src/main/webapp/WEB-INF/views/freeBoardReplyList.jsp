<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 </title>
</head>
<body>
	<table  border="1" style="width:650px">
		<c:forEach var="row" items="${list }">
		<tr>
			<td>
				${row.userName }(<fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd a KK:mm:ss"/>)
				<br>
				${row.replytext }
				<c:if test="${loginUser.nickname==row.replyer }">
					<input type="button" id="btnModify" value="수정" onclick="showReplyModify('${row.rno}')">
				</c:if>
			</td>
		</tr>
		</c:forEach>
		<tr style="text-align:center;">
			<td>
				<c:if test="${replyPager.curBlock >1 }">
					<a href="javascript:listReplyRest('1')">[처음]</a>
				</c:if>
				<c:if test="${replyPager.curBlock > 1 }">
					<a href="javascript:listReplyRest('${replyPager.prevPage }')">[이전]</a>
				</c:if>
				<c:forEach var="num" begin="${replyPager.blockBegin }" end="${replyPager.blockEnd }">
					<c:choose>
						<c:when test="${num==replyPager.curPage }">
							${num}&nbsp;
						</c:when>	
						<c:otherwise>
							<a href="javascript:listReplyRest('${num }')">${num }</a>&nbsp;
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${replyPager.curBlock <=replyPager.totBlock }">
					<a href="javascript:listReplyRest('${replyPager.nextPage }')">[다음]</a>
				</c:if>
				<c:if test="${replyPager.curBlock<=replyPager.totBlock }">
					<a href="javascript:listReplyRest('${replyPager.totPage }')">[끝]</a>
				</c:if>
			</td>
		</tr>
	</table> 
	<div id="modifyReply"></div>
</body>
</html>