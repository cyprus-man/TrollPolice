<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	*{
		margin: 0;
		padding: 0;
		font-style: none;
		text-decoration: none;
		color:black;
	}
	.wrap{
		width: 900px;
		height: 300px;	
		margin: 0 auto;
		margin-top:100px;
	}
	
	.summoners{
		float: left;
		margin-left: 20px;
	}
	.rateView{
		width: 150px;
		heigth : 21px;		
	}
	.rateWins{
		background: #e2b6b3;
		float: letf;
		display: inline-block;
	}
	.rateLosses{
		background: #a3cfec;
		float: right;
		display: inline-block;
		text-align: right;
	}
	.rate p{
		font-size:30px;
		text-align: center;
		
	}
	.mostChamp{
		text-align: center;
		margin-bottom: 10px;
		font-weight: bold;
	}
	.tier img{
		margin-left: 20px;
	}
	
	
</style>
</head>
<title>search detail</title>
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
		<c:forEach var="summonerInfo" items="${summonerInfos}">
			<a href="report?nickname=${summonerInfo.nickname}">
			<div class="summoners">
				<div class="mostChamp">
					<img src="${pageContext.request.contextPath}/resources/img/champion/${summonerInfo.mostChamp}.png" width="150" alt="mostChamp">
					<p>${summonerInfo.nickname}</p>
				</div>
				<div class="rate">		
					<div class="rateView">
						<div class="rateWins" style="width:<fmt:formatNumber value="${summonerInfo.wins/(summonerInfo.wins + summonerInfo.losses)*100}" pattern=".00"/>%">win:${summonerInfo.wins}</div>
						<div class="rateLosses"  style="width:<fmt:formatNumber value="${summonerInfo.losses/(summonerInfo.wins + summonerInfo.losses)*100}" pattern=".00"/>%">lose:${summonerInfo.losses}</div>
					</div>			
					<p><fmt:formatNumber value="${summonerInfo.wins/(summonerInfo.wins + summonerInfo.losses)*100}" pattern=".00"/>%</p>															
				</div>
				<div class="tier"><img src="${pageContext.request.contextPath}/resources/img/tier/${summonerInfo.tier}.png" width="120" alt="tier"></div>
			</div>
			</a>				
		</c:forEach>
		
		
		
	</div>
	
</body>
<script type="text/javascript">


</script>
</html>



