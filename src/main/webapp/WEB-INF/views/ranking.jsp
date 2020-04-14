<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>트롤 경찰청 [랭킹]</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	text-decoration: none;
	list-style: none;
}

#wrap {
	margin: 0 auto;
	width: 1200px;
}

#tierWrap {
	margin: 0 auto;
	margin-top:45px;
	height:200px;
	border: 1px solid #e7e7e7;
}

#tierWrap img {
	margin: 0 auto;
	margin-top: 40px;
	margin-left:24px;
	width: 100px;
	height: 100px;
	border: 1px solid #e7e7e7;
}

#tierWrap img:hover{
	background-color: #e7e7e7;
}

#ranking_row_header{
	border-bottom:1px solid  #e7e7e7;
	background-color: #F5F5F4;
	width: 1200px;
	height: 44px;
	margin: 0 auto;
	margin-top:30px;
	color:#333;
	font-size:15px;
	font-weight: 600;
	
}
#ranking_row_header > div{
	float:left;
}

#rank{
	width: 140px;
	height: 33px;
	padding-top:11px;
	text-align: center;
}

.ranking_row >.ranking_row_num{
	height:100px;
	width: 140px;
	float:left;
	text-align: center;
	padding-top: 50px;
	font-size: 30px;
}

#most{
	width:140px;
	margin-left:60px;
	height: 33px;
	padding-top:11px;
	text-align: center;
}

.ranking_row >.ranking_champ{
	height:115px;
	width: 250px;
	float:left;
	text-align: center;
	padding-top: 35px;
}

#summor{
	width: 240px;
	margin-left:60px;
	height: 33px;
	padding-top:11px;
	text-align: center;
}

.ranking_row >.ranking_nickname{
	height:90px;
	width: 260px;
	float:left;
	text-align: center;
	padding-top: 60px;
	font-size: 14px;
	color:#666;
}

#siren{
	width: 120px;
	margin-left:60px;
	height: 33px;
	padding-top:11px;
	text-align: center;
	
}

.ranking_row >.troll_count{
	height:90px;
	width: 220px;
	float:left;
	text-align: center;
	padding-top: 60px;
	font-size: 14px;
	color:#666;
}


#trollCount{
	width: 200px;
	margin-left:100px;
	height: 33px;
	text-align: center;
	padding-top:11px;
}

.ranking_row >.troll_value{
	height:90px;
	width: 300px;
	float:left;
	text-align: center;
	padding-top: 60px;
	font-size: 14px;
	color:#666;
}

.ranking_row {
	width:1200px;
	height: 150px;
	margin: 0 auto;
	border-bottom:1px solid  #e7e7e7;
}

.ranking_champ {
    background-position: center;
    background-repeat: no-repeat;
}

.ranking_row > div {
	height:100px;
	float:left;
	text-align: center;
	padding-top: 50px;
}
.ranking_row:hover{
	cursor: pointer;
}

.ranking_champ>img {
	width: 80px;
	border-radius: 40px;
	height: 85px;
}

.clear {
	clear: both;
}

#textBox{
	margin-top:35px;
	width: 100%;
	height: 150px;
}

h1{
	text-align: center;
	line-height: 150px;
	font-size : 40px;
	font-weight: 500;
	font-family: "Tahoma";
}

h5{
	width: 120px;
	font-size: 14px;
	float: left; 
}

.unranked{
	margin-left:16px;
}

.bronze,
.silver,
.platinum,
.grandmaster,
.challenger{
	margin-left:10px;
}

.gold{
	margin-left:15px;
}

.diamond,.master{
	margin-left:12px;
}
.unranked,
.bronze,
.silver,
.gold,
.platinum,
.diamond,
.master,
.grandmaster,
.challenger{
	padding-bottom: 5px;
	color:gray;
}
.tierText{
   text-align: center;   
}

</style>
</head>
<body>
	<div id="wrap">
		<div id="textBox">
			<h1>당신은 건전한 소환사 입니까?</h1>
		</div>
		<div id="rank_nav">
		</div>
		<div id="tierWrap">
			<a href="ranking?tier=UNRANKED"><img alt="UNRANKED" id="showHover" class="UNRANKED"
				src="${pageContext.request.contextPath}/resources/img/tier/UNRANKED.png"></a>
			<a href="ranking?tier=BRONZE"><img alt="BRONZE" id="showHover" class="BRONZE"
				src="${pageContext.request.contextPath}/resources/img/tier/BRONZE.png"></a>
			<a href="ranking?tier=SILVER"><img alt="SILVER" id="showHover" class="SILVER"
				src="${pageContext.request.contextPath}/resources/img/tier/SILVER.png"></a>
			<a href="ranking?tier=GOLD"><img alt="GOLD" id= "showHover" class="GOLD"
				src="${pageContext.request.contextPath}/resources/img/tier/GOLD.png"></a>
			<a href="ranking?tier=PLATINUM"><img alt="PLATINUM" id="showHover" class="PLATINUM"
				src="${pageContext.request.contextPath}/resources/img/tier/PLATINUM.png"></a>
			<a href="ranking?tier=DIAMOND"><img alt="DIAMOND" id="showHover" class="DIAMOND"
				src="${pageContext.request.contextPath}/resources/img/tier/DIAMOND.png"></a>
			<a href="ranking?tier=MASTER"><img alt="MASTER" id="showHover" class="MASTER"
				src="${pageContext.request.contextPath}/resources/img/tier/MASTER.png"></a>
			<a href="ranking?tier=GRANDMASTER"><img alt="GRANDMASTER" id="showHover" class="GRANDMASTER"
				src="${pageContext.request.contextPath}/resources/img/tier/GRANDMASTER.png"></a>
			<a href="ranking?tier=CHALLENGER"><img alt="CHALLENGER" id="showHover" class="CHALLENGER"
				src="${pageContext.request.contextPath}/resources/img/tier/CHALLENGER.png"></a>
				
			<div class = tierText>
				<h5 class ="unranked">UNRANKED</h5>
				<h5 class = "bronze">BRONZE</h5>
				<h5 class = "silver">SILVER</h5>
				<h5 class = "gold">GOLD</h5>
				<h5 class = "platinum">PLATINUM</h5>
				<h5 class = "diamond">DIAMOND</h5>
				<h5 class = "master">MASTER</h5>
				<h5 class= "grandmaster">GRANDMASTER</h5>
				<h5 class = "challenger">CHALLENGER</h5>
			</div>
		</div>
		<div id="ranking">
			<c:if test="${!empty trollers}">
				<div id="ranking_row_header" >
					<div id = "rank">순위</div>
					<div id = "most">모스트 트롤</div>
					<div id = "summor">소환사 명</div>
					<div id = "siren">신고당한 횟수</div>
					<div id = "trollCount">트롤력[트롤 / 무죄 / 무효]</div>
					<div class="clear"></div>
				</div>
			</c:if>
		

			<c:forEach items="${trollers}" var="troller" varStatus="index">

				<div class="ranking_row" onmouseover="showDisc('${troller.nickname}')" onclick="src('${troller.nickname}')">
					<div class="ranking_row_num">${index.index +1 }</div>
					<div class="ranking_champ">
						<img alt="champion"
							src="${pageContext.request.contextPath}/resources/img/champion/${troller.trollChamp}.png">
					</div>
					<div class="ranking_nickname">${troller.nickname}</div>
					<div class="troll_count">${troller.trollCount} </div>
					<div class="troll_value">${troller.troll } / ${troller.notTroll } / ${troller.tie}</div>
					<div class="clear"></div>
				</div>
				
			</c:forEach>
		</div>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	$(".ranking_row:nth-child(2) > .ranking_champ:nth-child(2)")
	.css("background-image","url('${pageContext.request.contextPath}/resources/img/rank01.png')");
	
	$(".ranking_row:nth-child(3) > .ranking_champ:nth-child(2)")
	.css("background-image","url('${pageContext.request.contextPath}/resources/img/rank02.png')");
	
	$(".ranking_row:nth-child(4) > .ranking_champ:nth-child(2)")
	.css("background-image","url('${pageContext.request.contextPath}/resources/img/rank03.png')");
});

function src(nickname){
	location.href = "srcTroll?page=1&troller="+nickname;
}

function showDisc(nickname){
	console.log(nickname);
	$.get("srcTrollAjax",{"troller":nickname},function(json){
		
	},"json").done(function(){
	});
}
function drawOverview(disc){

	}
	

	
	
$(".UNRANKED").hover(function(){
	$(".unranked").css("color","black");
	$(".bronze").css("color","gray");
	$(".silver").css("color","gray");
	$(".gold").css("color","gray");
	$(".platinum").css("color","gray");
	$(".diamond").css("color","gray");
	$(".master").css("color","gray");
	$(".grandmaster").css("color","gray");
	$(".challenger").css("color","gray");
	
	$(".unranked").css("border-bottom","6px solid black");
	$(".bronze").css("border","none");
	$(".silver").css("border","none");
	$(".gold").css("border","none");
	$(".platinum").css("border","none");
	$(".diamond").css("border","none");
	$(".master").css("border","none");
	$(".grandmaster").css("border","none");
	$(".challenger").css("border","none");
});

$(".BRONZE").hover(function(){
	$(".unranked").css("color","gray");
	$(".bronze").css("color","black");
	$(".silver").css("color","gray");
	$(".gold").css("color","gray");
	$(".platinum").css("color","gray");
	$(".diamond").css("color","gray");
	$(".master").css("color","gray");
	$(".grandmaster").css("color","gray");
	$(".challenger").css("color","gray");
	
	$(".unranked").css("border","none");
	$(".bronze").css("border-bottom","6px solid black");
	$(".silver").css("border","none");
	$(".gold").css("border","none");
	$(".platinum").css("border","none");
	$(".diamond").css("border","none");
	$(".master").css("border","none");
	$(".grandmaster").css("border","none");
	$(".challenger").css("border","none");
});

$(".SILVER").hover(function(){
	$(".unranked").css("color","gray");
	$(".bronze").css("color","gray");
	$(".silver").css("color","black");
	$(".gold").css("color","gray");
	$(".platinum").css("color","gray");
	$(".diamond").css("color","gray");
	$(".master").css("color","gray");
	$(".grandmaster").css("color","gray");
	$(".challenger").css("color","gray");
	
	$(".unranked").css("border","none");
	$(".bronze").css("border","none");
	$(".silver").css("border-bottom","6px solid black");
	$(".gold").css("border","none");
	$(".platinum").css("border","none");
	$(".diamond").css("border","none");
	$(".master").css("border","none");
	$(".grandmaster").css("border","none");
	$(".challenger").css("border","none");
});

$(".GOLD").hover(function(){
	$(".unranked").css("color","gray");
	$(".bronze").css("color","gray");
	$(".silver").css("color","gray");
	$(".gold").css("color","black");
	$(".platinum").css("color","gray");
	$(".diamond").css("color","gray");
	$(".master").css("color","gray");
	$(".grandmaster").css("color","gray");
	$(".challenger").css("color","gray");
	
	$(".unranked").css("border","none");
	$(".bronze").css("border","none");
	$(".silver").css("border","none");
	$(".gold").css("border-bottom","6px solid black");
	$(".platinum").css("border","none");
	$(".diamond").css("border","none");
	$(".master").css("border","none");
	$(".grandmaster").css("border","none");
	$(".challenger").css("border","none");
});

$(".PLATINUM").hover(function(){
	$(".unranked").css("color","gray");
	$(".bronze").css("color","gray");
	$(".silver").css("color","gray");
	$(".gold").css("color","gray");
	$(".platinum").css("color","black");
	$(".diamond").css("color","gray");
	$(".master").css("color","gray");
	$(".grandmaster").css("color","gray");
	$(".challenger").css("color","gray");
	
	$(".unranked").css("border","none");
	$(".bronze").css("border","none");
	$(".silver").css("border","none");
	$(".gold").css("border","none");
	$(".platinum").css("border-bottom","6px solid black");
	$(".diamond").css("border","none");
	$(".master").css("border","none");
	$(".grandmaster").css("border","none");
	$(".challenger").css("border","none");
});

$(".DIAMOND").hover(function(){
	$(".unranked").css("color","gray");
	$(".bronze").css("color","gray");
	$(".silver").css("color","gray");
	$(".gold").css("color","gray");
	$(".platinum").css("color","gray");
	$(".diamond").css("color","black");
	$(".master").css("color","gray");
	$(".grandmaster").css("color","gray");
	$(".challenger").css("color","gray");
	
	$(".unranked").css("border","none");
	$(".bronze").css("border","none");
	$(".silver").css("border","none");
	$(".gold").css("border","none");
	$(".platinum").css("border","none");
	$(".diamond").css("border-bottom","6px solid black");
	$(".master").css("border","none");
	$(".grandmaster").css("border","none");
	$(".challenger").css("border","none");
});

$(".MASTER").hover(function(){
	$(".unranked").css("color","gray");
	$(".bronze").css("color","gray");
	$(".silver").css("color","gray");
	$(".gold").css("color","gray");
	$(".platinum").css("color","gray");
	$(".diamond").css("color","gray");
	$(".master").css("color","black");
	$(".grandmaster").css("color","gray");
	$(".challenger").css("color","gray");
	
	$(".unranked").css("border","none");
	$(".bronze").css("border","none");
	$(".silver").css("border","none");
	$(".gold").css("border","none");
	$(".platinum").css("border","none");
	$(".diamond").css("border","none");
	$(".master").css("border-bottom","6px solid black");
	$(".grandmaster").css("border","none");
	$(".challenger").css("border","none");
});

$(".GRANDMASTER").hover(function(){
	$(".unranked").css("color","gray");
	$(".bronze").css("color","gray");
	$(".silver").css("color","gray");
	$(".gold").css("color","gray");
	$(".platinum").css("color","gray");
	$(".diamond").css("color","gray");
	$(".master").css("color","gray");
	$(".grandmaster").css("color","black");
	$(".challenger").css("color","gray");
	
	$(".unranked").css("border","none");
	$(".bronze").css("border","none");
	$(".silver").css("border","none");
	$(".gold").css("border","none");
	$(".platinum").css("border","none");
	$(".diamond").css("border","none");
	$(".master").css("border","none");
	$(".grandmaster").css("border-bottom","6px solid black");
	$(".challenger").css("border","none");
});

$(".CHALLENGER").hover(function(){
	$(".unranked").css("color","gray");
	$(".bronze").css("color","gray");
	$(".silver").css("color","gray");
	$(".gold").css("color","gray");
	$(".platinum").css("color","gray");
	$(".diamond").css("color","gray");
	$(".master").css("color","gray");
	$(".grandmaster").css("color","gray");
	$(".challenger").css("color","black");
	
	$(".unranked").css("border","none");
	$(".bronze").css("border","none");
	$(".silver").css("border","none");
	$(".gold").css("border","none");
	$(".platinum").css("border","none");
	$(".diamond").css("border","none");
	$(".master").css("border","none");
	$(".grandmaster").css("border","none");
	$(".challenger").css("border-bottom","6px solid black");
});






</script>
</html>