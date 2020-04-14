<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	*{
		margin: 0;
		padding: 0;
	}
	.wrap{
		width: 750px;
		height: 300px;	
		margin: 40px auto;
	}
	.searchWrap{
		width : 740px;
		height: 290px;
	
	}
	.submitBtn{
		display: inline-block;
		
		width: 200px;
		height: 100px;
		float: left;
		margin: 80px 0 0 20px;
	}
	.submitBtn input{
		width: 190px;
		height: 90px;
		border-radius: 10px;
		background: #a3cfec;
		color: white;
		font-weight: bold;
	}
	.submitBtn input:hover{
		background: #4171d6;
	}
	.searchContent{
		width: 500px;
		height: 250px;		
		float: left;
		
	}	
	.searchContent textarea{
		width: 500px;
		height: 250px;
		border-radius: 5px;
	}
	
	
</style>
</head>
<title>다중검색</title>
<c:if test="${!empty message }" >
	<script>alert("${message}");</script>
</c:if>
<%-- <c:if test="${not empty loginUser }">
	<c:if test="${loginUser.validation != 'Y'}">
		<%@ include file="/WEB-INF/views/emailValidation.jsp"%>
	</c:if>
</c:if> --%>
<body>
	<div class="wrap">
		<form class="searchWrap" action="multiSearchAction">
			<div class="searchContent">
				<!-- <p contenteditable="true" placeholder="placeholder" class='contentP'> -->
				<textarea rows="15" cols="60" placeholder="ROX Smeb 님이 방에 참가했습니다.&#13;&#10;ROX Peanut 님이 방에 참가했습니다.&#13;&#10;ROX Kuro 님이 방에 참가했습니다.&#13;&#10;ROX PraY 님이 방에 참가했습니다.&#13;&#10;ROX GorillA 님이 방에 참가했습니다." name="content"></textarea>
			</div>
			<input type=hidden class="contentI" name='content'>
			<div class="submitBtn"><input type="submit" class="submit" value="여러명 검색"></div>	
		</form>	
	</div>
	
</body>
<script type="text/javascript">
$(document).on('click','.submit',function(){
	$('.contentI').val($('.contentP').text());
	
})

</script>
</html>



