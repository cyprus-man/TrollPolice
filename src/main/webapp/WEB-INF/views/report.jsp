<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/header.jsp"%>
<style>
#searchDiv {
	min-width: 100%;
	background-color: #2fc97a;
	height: 200px;
}

#searchBox {
	height: 200px;
	width: 585px;
	margin: 0 auto;
}

#searchWrap {
	width: 580px;
	height: 54px;
	background-color: #fff;
	border-radius: 30px;
	display: table-cell;
	vertical-align: middle;
}

#summonerName {
	width: 500px;
	height: 20px;
	font-size: 16px;
	margin-left: 22px;
	float: left;
	margin-top: 5px;
	border: none;
}

#searchBtn {
	height: 30px;
	width: 25px;
	margin-left: 10px;
	border: none;
}

h1 {
	color: #fff;
	font-size: 24px;
	font-weight: 700;
	text-align: center;
	margin-bottom: 20px;
	padding-top: 30px;
}


#wrap {
	width: 1200px;
	margin: 0 auto;
}
#searchSide {
	margin-right: 5px;
	margin-bottom: -15px;
}

/*MATCH INFO*/
#resultDiv {
	width: 1000px;
	border-left:1px solid rgba(206, 206, 206, 0.959);
	border-right:1px solid rgba(206, 206, 206, 0.959);
	margin: 0 auto;
}
.subTitle{
	text-align: center;
	min-width: 100%;
}
.result {
	margin: 0 auto;
}

.row {
	border:5px solid white;
	padding-top:40px;
	padding-left:35px;
	min-height: 420px;
	width: 850px;
	margin: 30px auto;
	position: relative;
}

.row:hover{
	border:5px solid #666;
}

/* SELECT CHAMP CSS */
.rowSelect{
	background-color:#2fc97a;
	border:5px solid #333;
}
.rowSelect .champ:hover{
	border:5px solid red;
}
.summoner {
	width: 100px;
}

.summonerInfo {
	width: 105px;
}
.summoner:nth-child(2) > .summonerInfo{
	float: right;	
}

.summoners {
	width: 900px;
	margin: 0 auto;
	margin-bottom: 20px;
}

.summoners>div {
	height: 50px;
	float: left;
}

.itemDiv {
	width: 130px;
	margin: 0 25px;
}

.summoners span {
	font-size: 12px;
	line-height: 21px;
	display: block;
}

.champ {
	-moz-border-radius: 50px;
	background-size: contain;
	border-radius: 30px;
	background-repeat: no-repeat;
	border: 5px solid rgba(0, 0, 0, 0);
	width: 50px;
	height: 50px;
}

.champSelect {
	border: 5px solid yellow;
}

.item {
	width: 30px;
	height: 30px;
	border: 1px solid yellow; float : left;
	background-size: contain;
	float: left;
}

.name {
	height: 42px;
}

.summoner {
	width: 150px;
}

.deal {
	width: 70%;
	border: 1px solid black;
	height: 15px;
	background-color: blue;
	font-size: 12px;
	color: white;
}

.spellRune {
	margin-top: 5px; width : 40px;
	height: 40px;
	vertical-align: middle;
	width: 40px;
}

.spell {
	width: 20px; /*----50%*/
	height: 20px;
	float: left;
	background-size: contain;
}

.clear {
	clear: both;
}

.row>input {
	display: none;
}

.teamStats {
	width: 700px;
	height:40px;
	bottom: 70px;
	left: 50%;
	margin-left: -350px;
	position: absolute;
}
img.teamStatsImg{
	width:30px;
	height:30px;
}
.teamStats>div {
	width: 220px;
	height: 35px;
	line-height: 35px;
	border: 1px solid black;
	border-radius: 5px;
	margin: 0 60px;
	display: inline-block;
}



/* report write form css*/
#writeDiv {
	width:900px;
	margin-top: 50px;
	margin: 0 auto;
	border: 1px solid black;
	margin-bottom: 50px;
}
#writeForm {
	margin: 0 auto;
	margin-bottom: 40px;
}
#writeForm>p {
	margin:20px 0;
	margin-left:30px;
}
#trollerName {
	font-size: 32px;
}
#contentP {
	width: 80%;
	min-height: 300px;
	margin: 0 auto;
	border: 2px solid gray;
	border-radius: 5px;
	margin-bottom: 60px;
	margin-top: 40px;
}
#write_toolbar{
	width:300px;
	margin:0 auto;
}
#writeDiv input#btnWrite,
#writeDiv input#btnCancel{
	background-color: #f7f7f7;
	color:#666;
	border:1px solid #e3e3e3;
	font-size: 16px;
	margin:0 25px;
}
#writeDiv #btnWrite:hover,
#writeDiv #btnCancel:hover{
	border:1px solid #afafaf;
}
#btnWrite {
	width: 100px;
	height: 60px;
	line-height: 60px;
}

#btnCancel{
	width: 100px;
	height: 60px;
	line-height: 60px;
}

.btnReport{
	width:100px;
	display:none;
	height:60px;
	margin:10px auto;
	line-height: 60px;
	border: none;
	background-color:#aaf1cc;
	color:white;
	font-weight: 800;
	cursor: pointer;
}

.btnReport img{
	margin-top: 10px;
} 
h3{
	font-size:26px;	
	font-weight: 500;
	margin-top:80px;
	margin-bottom:60px;
}

.blueTeam > div{
	float: left;
}
</style>
<title>당신을 괴롭힌 트롤러는 누구인가요?</title>
<!-- 로그인 +  valid 통과 한 사람만 이용 가능하도록... -->
<nav>
<c:if test="${empty loginUser}">
	<script>
		if(confirm("로그인후 이용가능합니다.\n로그인 페이지로 이동합니까?")){
			location.href="login";
		}else{
			location.href="main";
		}
	</script>
</c:if>

<c:if test="${loginUser.validation != 'Y' }">
	<script>
		alert("인증 후 이용가능합니다.");
		//validation -> page 이동 
		location.href="main";
	</script>
</c:if>

<c:if test="${!empty message}">
	<script>
		if(confirm("${message}\n"+"해당 페이지로 이동합니까?")){
			location.href="discDetail?discBoardId="+"${discBoardId}";
		}
	</script> 
</c:if>


	<div id="searchDiv">
		<div id="searchBox">
			<h1>
				<img
					src="${pageContext.request.contextPath}/resources/img/siren.png"
					id="searchSide">당신이 목격한 트롤러를 신고하십시오.
			</h1>
			<div id="searchWrap">
				<input type="text" id="summonerName" name="summonerName"
					placeholder="신고할 소환사 명을 입력해주세요.">
				<div id=searchdiv>
					<input type="button" style="display: none;" id="search">
					<button type="button" id="searchBtn">
						
						<img
							src="${pageContext.request.contextPath}/resources/img/button.png"
							alt="">
					</button>
				</div>

			</div>
		</div>
	</div>
</nav>
<article>
	<div id="wrap">
		<div id="resultDiv"></div>
	</div>
</article>
</body>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.js"></script>
<c:if test="${!empty loginUser}">
	<script type="text/javascript">
	var loginSummoner = "${loginUser.nickname}";
	</script>
</c:if>
<script type="text/javascript">
var nickname = "${nickname}";

//script 부분 파일 하나 만들어서 이용 ...
//1. 액세스 금지된 경우 , 2. 랭겜 이용 불가능자...
var blueChampImg = "<div class ='summoners'>" + "<div class='champ' "+
        				   " style=background-image:url('${pageContext.request.contextPath}/resources/img/champion/"; // champImg
var blueSummonerNum = ".png')><input type='hidden' value =";
var blueSummonerName = "></div><div class='summoner'><div class='name'>"
								+"<span class='summonerName'>"; //summonerName
var blueKda = "</span><span class='kda'>";
var blueDeal = "</span></div><div class='deal'>";
var blueItem0 = "</div></div>"+
						"<div class='itemDiv'><div class='item' style=background-image:url('${pageContext.request.contextPath}/resources/img/items/";
var blueItem1 = ".png')></div><div class='item' style=background-image:url('${pageContext.request.contextPath}/resources/img/items/";
var blueItem2 = ".png')></div><div class='item' style=background-image:url('${pageContext.request.contextPath}/resources/img/items/";
var blueItem3 = ".png')></div><div class='item' style=background-image:url('${pageContext.request.contextPath}/resources/img/items/";
var blueItem4 = ".png')></div><div class='item' style=background-image:url('${pageContext.request.contextPath}/resources/img/items/";
var blueItem5 = ".png')></div><div class='item' style=background-image:url('${pageContext.request.contextPath}/resources/img/items/";
var blueItem6 = ".png')></div><div class='item' style=background-image:url('${pageContext.request.contextPath}/resources/img/items/"; 
		//Accessary
		
		
var redItem0 = ".png')></div></div>" // blue팀 itemDiv close
				+ "<div class='itemDiv'><div class='item' style=background-image:url('${pageContext.request.contextPath}/resources/img/items/";
var redItem1 = ".png')></div><div class='item' style=background-image:url('${pageContext.request.contextPath}/resources/img/items/";
var redItem2 = ".png')></div><div class='item' style=background-image:url('${pageContext.request.contextPath}/resources/img/items/";
var redItem3 = ".png')></div><div class='item' style=background-image:url('${pageContext.request.contextPath}/resources/img/items/";
var redItem4 = ".png')></div><div class='item' style=background-image:url('${pageContext.request.contextPath}/resources/img/items/";
var redItem5 = ".png')></div><div class='item' style=background-image:url('${pageContext.request.contextPath}/resources/img/items/";
var redItem6 = ".png')></div><div class='item' style=background-image:url('${pageContext.request.contextPath}/resources/img/items/";  

//Item 6 == > accessary

var redSummonerName = ".png')></div></div>"+
					"<div class='summoner'><div class='name'><span class='summonerName'>";
var redKda = "</span><span class='kda'>"; 
var redDeal = "</span></div><div class='deal'>";
var redChampImg = "</div></div>"+
						  "<div class='champ' style=background-image:url('${pageContext.request.contextPath}/resources/img/champion/";
var redSummonerNum = ".png')><input type='hidden' value=";						  
var summonerSchemeEnd = "></div>"+ //class = champ close
							"<div class='clear'></div>"+
							"</div>";//class = summoners close

var jsonArray = {};
var searchFlag = false;

$(document).ready(function(){
	if(nickname!=""){
		$("#summonerName").val(nickname);
	}
})
//enable press enter to search
$('#summonerName').keypress(function(event){
    if ( event.which == 13 ) {
        $('#search').click();
        return false;
    }
});

  
//match select to report function
$(document).on("click",".row",function(){
	//선택 부분은 전부 다 가능하게 하고 신고를 눌렀을시 검사 
	if ($(this).hasClass("rowSelect")) {
		//1. 챔프 선택한걸 없앰  
		//2. 선택한 부분을 다시 클릭시 선택 취소
		//3. 다른 경기를 선택시 선택한 경기 취소
		//4. 경기를 새로 클릭시  신고버튼을 없앰
		$(".rowSelect .btnReport").css("display","none");
		$(".champSelect").removeClass("champSelect");
		$(this).removeClass("rowSelect");
	 } else {
	    $(".rowSelect .btnReport").css("display","none");
	    $(".champSelect").removeClass("champSelect");
	    $(".rowSelect .btnReport").css("display","none");
	    $(".rowSelect").toggleClass("rowSelect");
	    $(this).toggleClass("rowSelect");
	    }
    return false;
});

//champ select to report function 
$(document).on("click",".rowSelect .champ",function(){
	if(!isParticipant(loginSummoner)){alert("참여한 경기만 선택할 수 있습니다.");}else{
		if ($(this).hasClass("champSelect")) {
			$(".rowSelect .btnReport").css("display","none");
			$(this).removeClass("champSelect");
		}else {
		    	$(".champSelect").toggleClass("champSelect");
		        $(this).toggleClass("champSelect");
		        $(".rowSelect .btnReport").css("display","block");
		}
	}
	// in this ... select is success
    return false;
})


//report button click function 
$(document).on("click",".rowSelect .btnReport",function(){
	//ajax 를 통한 작성글로 이동 
	var rownum = $(".rowSelect > .rownum").val();
	console.log("선택한 경기 : ");
	console.log(jsonArray[rownum]);	
	var summonerNum = $(".champSelect input").val();
	var troller = jsonArray[rownum]['participantVOList'][summonerNum]['summonerName'];
	console.log("select trollerName : "+
			jsonArray[rownum]['participantVOList'][summonerNum]['summonerName']);
	drawReport(jsonArray[rownum],troller,loginSummoner);
})


//search button click function
$(document).on("click", "#search", function() {
	var summonerName = $("#summonerName").val();
	if(!searchFlag){
		
		searchFlag=true;
		//ajax shorcut -> url,data,success,dataType + using method 
		$.post('getList', {
			name : summonerName
		}, function(txt) {
			console.log(txt);
			jsonArray = txt;
			//중간에 실패 처리 작업 ex api키 만료 등등 ... 서버 에러 처리\
			console.log(jsonArray.length);
			if(jsonArray.length>=10){
				$(".subTitle").remove();
				showMatchOverview(jsonArray);
				$("#wrap").prepend("<h3 class='subTitle'>\""+summonerName+"\" 님의 최신 랭크 10경기 입니다.</h3>");
			}
			else {
				//jsonArray 가 10보다 작을경우 실패한 경우...
				alert("서버 오류입니다.");
				location.reload();
			}
		}, "json").fail(function() {
			alert("실패했습니다.");
			searchFlag = false;
		}).done(function() {
			searchFlag = false;
		})
	}
	else if(searchFlag){
		alert("이미 검색중입니다.");
	}
})

$(document).on("submit","#writeForm",function(){
	$("#content").val($("#contentP").html());
})

$(document).on("click","#btnCancel",function(){
	showMatchOverview(jsonArray);
})

function drawTeamStats(teamStats){
	$("#resultDiv > .row:last-child").append("<div class=teamStats></div>");
	
    $(".row:last-child > .teamStats")//UI update is need...
	.append("<div class=blueTeam><img class=teamStatsImg src='${pageContext.request.contextPath}/resources/img/tower.png'> "+teamStats[0]['towerKills']+
			" <img class=teamStatsImg src='${pageContext.request.contextPath}/resources/img/dragon.png'> "+teamStats[0]['dragonKills']+
			" <img class=teamStatsImg src='${pageContext.request.contextPath}/resources/img/inhibitor.png'> "+teamStats[0]['inhibitorKills']+
			" <img class=teamStatsImg src='${pageContext.request.contextPath}/resources/img/baron.png'> "+teamStats[0]['baronKills']+" </div>"+
			"<div class=redTeam><img class=teamStatsImg src='${pageContext.request.contextPath}/resources/img/tower.png'> "+teamStats[1]['towerKills']+
			" <img class=teamStatsImg src='${pageContext.request.contextPath}/resources/img/dragon.png'> "+teamStats[1]['dragonKills']+
			" <img class=teamStatsImg src='${pageContext.request.contextPath}/resources/img/inhibitor.png'> "+teamStats[1]['inhibitorKills']+
			" <img class=teamStatsImg src='${pageContext.request.contextPath}/resources/img/baron.png'> "+teamStats[1]['baronKills']+"</div>"+
			"<span class='btnReport'><img class=teamStatsImg src='${pageContext.request.contextPath}/resources/img/mySiren.png'><span>신고하기</span></span>"+
			"</div>");
} 

 function drawOneMatch(match,index){
	var blueChampImg = "<div class ='summoners'>" + "<div class='champ' "+
			   " style=background-image:url('${pageContext.request.contextPath}/resources/img/champion/"; // champImg
var blueSummonerNum = ".png')><input type='hidden' value =";
var blueInfoDiv = "></div><div class='summoner'><div class='summonerInfo'>"; //info
var blueSummonerName = "<div class='name'>"
					+"<span class='summonerName'>"; //summonerName
var blueKda = "</span><span class='kda'>";
var blueDeal = "</span></div><div class='deal'>";
var blueSpellRune = "</div></div><div class='spellRune'>";
var blueRune1  ="<div class='spell'style=background-image:url('${pageContext.request.contextPath}/resources/img/rune/";
var blueSpell1 = ".png')></div>   <div class='spell' style=background-image:url('${pageContext.request.contextPath}/resources/img/summoner_spell/";
var blueRune2 = ".png')></div>    <div class='spell' style=background-image:url('${pageContext.request.contextPath}/resources/img/rune/";
var blueSpell2 = ".png')></div>   <div class='spell' style=background-image:url('${pageContext.request.contextPath}/resources/img/summoner_spell/";
var blueItem0 = ".png')></div>    </div></div>"+
			"<div class='itemDiv'><div class='item' style=background-image:url('${pageContext.request.contextPath}/resources/img/items/";
var blueItem1 = ".png')></div><div class='item' style=background-image:url('${pageContext.request.contextPath}/resources/img/items/";
var blueItem2 = ".png')></div><div class='item' style=background-image:url('${pageContext.request.contextPath}/resources/img/items/";
var blueItem3 = ".png')></div><div class='item' style=background-image:url('${pageContext.request.contextPath}/resources/img/items/";
var blueItem4 = ".png')></div><div class='item' style=background-image:url('${pageContext.request.contextPath}/resources/img/items/";
var blueItem5 = ".png')></div><div class='item' style=background-image:url('${pageContext.request.contextPath}/resources/img/items/";
var blueItem6 = ".png')></div><div class='item' style=background-image:url('${pageContext.request.contextPath}/resources/img/items/"; 
//Accessary


var redItem0 = ".png')></div></div>" // blue팀 itemDiv close
	+ "<div class='itemDiv'><div class='item' style=background-image:url('${pageContext.request.contextPath}/resources/img/items/";
var redItem1 = ".png')></div><div class='item' style=background-image:url('${pageContext.request.contextPath}/resources/img/items/";
var redItem2 = ".png')></div><div class='item' style=background-image:url('${pageContext.request.contextPath}/resources/img/items/";
var redItem3 = ".png')></div><div class='item' style=background-image:url('${pageContext.request.contextPath}/resources/img/items/";
var redItem4 = ".png')></div><div class='item' style=background-image:url('${pageContext.request.contextPath}/resources/img/items/";
var redItem5 = ".png')></div><div class='item' style=background-image:url('${pageContext.request.contextPath}/resources/img/items/";
var redItem6 = ".png')></div><div class='item' style=background-image:url('${pageContext.request.contextPath}/resources/img/items/";  

//Item 6 == > accessary
var redInfoDiv = ".png')></div></div><div class='summoner'>"; 
var redSummonerName = 
		"<div class='summonerInfo'><div class='name'><span class='summonerName'>";
var redKda = "</span><span class='kda'>"; 
var redDeal = "</span></div><div class='deal'>";
/*
* 
var blueSpellRune = "</div></div><div class='spellRune'>";
var blueRune1  ="<div class='spell'style=background-image:url('${pageContext.request.contextPath}/resources/img/rune/";
var blueSpell1 = ".png')></div>   <div class='spell' style=background-image:url('${pageContext.request.contextPath}/resources/img/summoner_spell/";
var blueRune2 = ".png')></div>    <div class='spell' style=background-image:url('${pageContext.request.contextPath}/resources/img/rune/";
var blueSpell2 = ".png')></div>   <div class='spell' style=background-image:url('${pageContext.request.contextPath}/resources/img/summoner_spell/";
*/
var redSpellRune ="</div></div></div><div class='spellRune'>";
var redSpell1 = "<div class='spell' style=background-image:url('${pageContext.request.contextPath}/resources/img/summoner_spell/";
var redRune1 = ".png')></div><div class='spell' style=background-image:url('${pageContext.request.contextPath}/resources/img/rune/";
var redSpell2 = ".png')></div><div class='spell' style=background-image:url('${pageContext.request.contextPath}/resources/img/summoner_spell/";
var redRune2 = ".png')></div><div class='spell' style=background-image:url('${pageContext.request.contextPath}/resources/img/rune/";
var redChampImg = ".png')></div></div>"+
			  "<div class='champ' style=background-image:url('${pageContext.request.contextPath}/resources/img/champion/";
var redSummonerNum = ".png')><input type='hidden' value=";						  
var summonerSchemeEnd = "></div>"+ //class = champ close
				"<div class='clear'></div>"+
				"</div>";//class = summoners close
			
	
	$("#resultDiv").append("<div class='row'><input type='text' class='rownum' value='"+index+"'></div>");
		var maxDeal  = 0;
		console.log(match);
		
		for (var blue = 0; blue < 5; blue++) {
	        var red = blue + 5;
	        var participants = match['participantVOList'];
			
	        //deal
	        
	        if(maxDeal < participants[blue]['totalDamageDealtToChampions']) maxDeal = participants[blue]['totalDamageDealtToChampions'];
			if(maxDeal < participants[red]['totalDamageDealtToChampions']) maxDeal = participants[red]['totalDamageDealtToChampions'];
			
	        $("#resultDiv > .row:last-child").append(
	        blueChampImg+
	        participants[blue]['champId']+
	        blueSummonerNum + blue +
	        blueInfoDiv + 
	        blueSummonerName+participants[blue]['summonerName']+
	        blueKda+participants[blue]['kills']+"/"+
	        participants[blue]['deaths']+"/"+
	        participants[blue]['assists']+
	        blueDeal + participants[blue]['totalDamageDealtToChampions']+
	        blueSpellRune + blueRune1 + participants[blue]['primaryRune'] + 
	        blueSpell1 + participants[blue]['spell1'] + 
	        blueRune2 + participants[blue]['secondaryRune'] +
	        blueSpell2 + participants[blue]['spell2'] + 
	        blueItem0+participants[blue]['item0']+
	        blueItem1+participants[blue]['item1']+
	        blueItem2+participants[blue]['item2']+
	        blueItem3+participants[blue]['item6']+
	        blueItem4+participants[blue]['item3']+
	        blueItem5+participants[blue]['item4']+
	        blueItem6+participants[blue]['item5']+
	        redItem0+participants[red]['item0']+
	        redItem1+participants[red]['item1']+
	        redItem2+participants[red]['item2']+
	        redItem3+participants[red]['item6']+
	        redItem4+participants[red]['item3']+
	        redItem5+participants[red]['item4']+
	        redItem6+participants[red]['item5']+
	        redInfoDiv + 
	        redSummonerName+participants[red]['summonerName']+
	        redKda+participants[red]['kills']+"/"+
	        participants[red]['deaths']+"/"+
	        participants[red]['assists']+
	        redDeal+participants[red]['totalDamageDealtToChampions']+
	        redSpellRune +
	        redSpell1 + participants[red]['spell1'] +
	        redRune1 + participants[red]['primaryRune']  +
	        redSpell2 + participants[red]['spell2'] +
	        redRune2 +  participants[red]['secondaryRune'] +
	        redChampImg+participants[red]['champId'] +
	        redSummonerNum+red+
	        summonerSchemeEnd);
	    }
	    
	    
	  	//deal graph
		 for(var i = 0;i<5;i++){
		    	
		    	var bluePercent = parseInt(participants[i]['totalDamageDealtToChampions']/maxDeal*100);
		    	$(".row:last-child .summoners:nth-child("+(i+2)+") .summoner:nth-child(2) .deal").css("width",bluePercent+"%");
		    	console.log("blueP " +bluePercent);
		    	
		    	var redPercent = parseInt((participants[i+5]['totalDamageDealtToChampions']/maxDeal*100));
		    	$(".row:last-child .summoners:nth-child("+(i+2)+") .summoner:nth-child(5) .deal").css("width",redPercent+"%");
		    	console.log("redP " +redPercent);
		    }
	    
	    drawTeamStats(match['teamStatsVOList']);
	}

//to show match list
function showMatchOverview(jsonArray) {
		$("#resultDiv").empty();
        //TODO top jungle mid ad sup 순서로 정렬하기 -> participantVO list 에 lane 항목이 있습니다.
        
        for(var match=0;match<10;match++){        
			//parametehr : 1.matchData 2 . index
            drawOneMatch(jsonArray[match],match);
            //0 : blue -> teamStatsId : 100 , 1 : red - > teamStatsId : 200
            
            //colorChange to show winner team
            //functional to drawTS
            /// search troller 기준으로 win lose 
            if(jsonArray[match]['teamStatsVOList'][0]['win']=="Win"){
            	$(".row:last-child").css("background-color","rgb(221,255,255)");
            }
            else {
            	$(".row:last-child").css("background-color","rgb(254,222,237)");
            }
        }
    }


function isParticipant(nickname){
	var rownum = $(".row > .rownum").val();
	
	//rownum is defined row > input display : none.
	
	var size = jsonArray[rownum]['participantVOList'].length; // maybe 10
	for(var i=0;i<size;i++){
		if(jsonArray[rownum]['participantVOList'][i]['summonerName'] == nickname)
			return true;
	}
	return false;
}

function drawReport(match,troller,reporter){
	$("#resultDiv").empty();
	//2. resultDiv draw one match
	drawOneMatch(match);
	//2-1. match to jsonString
	var matchString = JSON.stringify(match);
	//3. draw form tag
	$("#resultDiv").append("<div id='writeDiv'></div>");
	$("#resultDiv #writeDiv").append("<form id='writeForm' method='post' action = 'insertDisc'></form>");
	$("#resultDiv #writeForm").append("<input type='text' id = 'troller' style='display:none;' name = 'troller' value='"+troller+"' >");
	$("#resultDiv #writeForm").append("<input type='text' id='reporter' style='display:none;' name='reporter' value='"+loginSummoner+"'>");
	$("#writeForm").append("<p id='trollerName'>[ 트롤러 ]"+troller+"</p>");
	$("#writeForm").append("<hr class='border_bottom'>");
	$("#resultDiv #writeForm").append("<div id='contentBox'></div>");
	$("#contentBox").append("<textarea name='content' id='content' style='display:none;'>");
	$("#contentBox").append("<p id='contentP' contenteditable='true'></p>");
	$("#resultDiv #writeForm").append("<input type='hidden' id='match' name='match' value='"+matchString+"'>");
	$("#resultDiv #writeForm").append("<div id='write_toolbar'></div>")
	$("#write_toolbar").append("<input id='btnCancel' type='button' value='취소하기'>");
	$("#write_toolbar").append("<input id='btnWrite' type='button' value='글 작성하기'>");
	$("#resultDiv #writeForm").append("<div class='clear'></div>");
}
$(document).on("click","#btnWrite",function(){
	var len = $("#contentP").text().length;
	console.log(len);
	if(len < 30){
		alert("당시 경기 상황을 30자 이상 작성해주세요."+len+"/30");
	}else {
		$("#writeForm").submit();
	}
})
</script>
</html>