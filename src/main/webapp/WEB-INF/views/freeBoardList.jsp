
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/header.jsp"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자유게시판 목록</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.js"></script>

<style>
* {
   margin: 0;
   padding: 0;
   text-decoration: none;
}
#wrap{
	 width: 1010px;
   margin: 0 auto;
}
#boardDiv {
   margin-left:100px;
   height: 570px;
   min-width: 80%;
   max-width: 80%;
   color: rgb(51, 51, 51);
   font-size: 14px;   
}
#topDiv {
	height:100px;
   margin-top: 20px; 
}
#searchOption {
   width: 420px;
   float: right;
   margin-top: 130px;
  
}
.oneBoardDiv, #oneBoardDivHead {
   width: 100%;
   margin: 0 auto;
   padding: 5px 50px;
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
.regdate{
	width:250px;
}
.viewcnt{
	width:50px;
}
.title{
	width:200px;
}
.bno{
	width:60px;
}
.writer{
	width:200px;
}

table{
	font-size: 15px;
}
li{
	list-style:none; float:left; padding:6px;
}
#talkImg{
   float: left;
   margin-right:15px;
   margin-top:5px;
   width: 50px;
   height: 50px;
}
#freeBoard {
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
#search {
   width: 169px;
   height: 38px;
   line-height: 38px;
   background-color: #fff;
   border: 1px solid #e4e4e4;
   padding: 0 20px 0 20px;
}
#search:focus {
   outline: 1px solid #8ba3d1;
}
#pageDiv {
   float: left;
    margin-top: 20px;
    text-align: center;
    width: 100%;
    height: 50px;
}
.clear {
   clear: both;
}
#viewcnt{
	margin:80px 0 0 150px;
	 color: rgb(51, 51, 51);
}
.writeBtn{
  background:#a3a3a3;
  color:#fff;
  border:none;
  height:30px;
  font-size:14px;
  width:70px;
  cursor:pointer;
  outline:none;
  border-radius: 12px;
	margin-left:910px;
}
#searchButton{
  background:#a3a3a3;
  color:#fff;
  border:none;
  height:30px;
  font-size:14px;
  width:50px;
  cursor:pointer;
  outline:none;
 
}
#selectOption{
	height:41px
}
.next_btn,.next,.before,.previous_btn{
   border:1px solid #e4e4e4;
   width:17px;
   height: 17px;
   padding: 1px;
}

.title{

}
</style>
</head>
<body>
<div id="wrap">
	<div id="topDiv">
	<img src="${pageContext.request.contextPath}/resources/img/talk.png" id="talkImg">
	<a href="/trollPolice1/freeBoardList" id="freeBoard">자유게시판</a>
	<form name="form1" method="post" action="${path }/trollPolice1/freeBoardList">
	<div id="searchOption">
		<select name="searchOption" id="selectOption">
			<option value="all" <c:out value="${map.searchOption=='all'?'selected':'' }"/> >제목+내용+닉네임</option>
			<option value="nickname" <c:out value="${map.searchOption=='writer'?'selected':'' }"/> >닉네임</option>
			<option value="content" <c:out value="${map.searchOption=='content'?'selected':'' }"/> >내용</option>
			<option value="title" <c:out value="${map.searchOption=='title'?'selected':'' }"/> >제목</option>
		</select>
		<input name="keyword" id="search" value="${map.keyword }">
		<input type="submit" id="searchButton" value="조회">
	</div>
	
	</form>
	</div>
	<div id="viewcnt"></div>
	<div id="boardDiv">
         <div id="oneBoardDivHead">
			<div class="bno">번호</div>
			<div class="title">제목</div>
			<div class="writer">닉네임</div>
			<div class="regdate">작성일</div>
			<div class="viewcnt">조회</div>
		</div>
		<c:forEach var="row" items="${map.list}">
		<div class="oneBoardDiv">
			<input type='hidden' class='board_no' value="${row.bno }">
			<div class="bno">${row.bno}</div>
						<div class="title"><a href="${path}/trollPolice1/freeBoardView?bno=${row.bno}&curPage=${map.boardPager.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}">${row.title}
				<c:if test="${row.recnt >0 }">
				<span style="color:red;">(${row.recnt })</span>
				</c:if></a></div>
			<div class="writer">${row.writer }</div>
			<div class="regdate"><fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd KK:mm"/></div>	
			<div class="viewcnt">${row.viewcnt}</div>
		</div>
		</c:forEach>
	</div>
	<div>
		<c:if test="${not empty loginUser }">
				<button type="button" id="btnWrite" class="writeBtn">글쓰기</button>
		</c:if>
	</div>
	  <div class="clear"></div>
     	 <div id="pageDiv">
				<c:if test="${map.boardPager.curBlock>1 }">
					<a href="javascript:list('1')"><input type="image" src="${pageContext.request.contextPath}/resources/img/left.png" value="button" class="previous_btn"></a>
				</c:if>
				<c:if test="${map.boardPager.curBlock>1 }">
					<a href="javascript:list('${map.boardPager.prevPage }')"> <input type="image" src="${pageContext.request.contextPath}/resources/img/prev.png" value="button" class="before"></a>
				</c:if>
				<c:forEach var="num" begin="${map.boardPager.blockBegin }" end="${map.boardPager.blockEnd }">
					<c:choose>
						<c:when test="${num==map.boardPager.curPage }">
							<span style="color:red">${num }</span>&nbsp;
						</c:when>
						<c:otherwise>
							<a href="javascript:list('${num }')">${num }</a>&nbsp;
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${map.boardPager.curBlock <= map.boardPager.totBlock}">
					<a href="javascript:list('${map.boardPager.nextPage }')"><input type="image" src="${pageContext.request.contextPath}/resources/img/next.png" value="button" class="next"></a>	
				</c:if>
				<c:if test="${map.boardPager.curPage <=map.boardPager.totPage }">
					<a href="javascript:list('${map.boardPager.totPage }')"> <input type="image" src="${pageContext.request.contextPath}/resources/img/right.png" value="button" class="next_btn"></a>
				</c:if>
      </div>
</div>
</body>
<script type="text/javascript">
	$(".oneBoardDiv").on("click",function(){
		var boardNo = $(this).children(".board_no").val();
		location.href = "freeBoardView?bno="+boardNo+"&curPage=${map.boardPager.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}";
	});  
	$(document).ready(function(){
		$("#btnWrite").click(function(){
			location.href="${path}/trollPolice1/freeBoardWrite";
		});
	});
	function list(page){
		location.href="${path}/trollPolice1/freeBoardList?curPage="+page+"&searchOption-${map.searchOption}"+"&keyword=${map.keyword}";
	}
</script>
</html>