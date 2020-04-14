<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#wrap{
   width:1300px;
   margin:0 auto;
}
/* COMMON  */
.clear{
   clear:both;
}
#wrap>div{
   border:1px solid rgb(160,163,175);
   width:370px; /* 400px maximum*/
   height:100%;
   float:left;
   margin-top:50px;
   margin-left:30px;
}
#left_div>div{
 height:45%;
 width:80%;
 margin:20px auto;
 border:1px solid rgb(160,163,175);
}
.board h4{
   text-align: center;
   border-bottom:1px solid rgb(160,163,175);
   padding:15px 0;
   height:5%;
}
.board_row{
   margin:5px 0;
   width:100%;
   height:50px;
}


.board_row:hover{
   cursor: pointer;
   background-color: rgb(160,163,175);
}
.board_row:nth-child(2):hover {
   cursor:default;
   background-color: white;
}
.board_row>div{
   height:100%;
   text-align:center;
   line-height:50px;
   font-size:14px;
   float:left;
}
/*RANKING*/
.ranking_info{
   width:90px;
   height:50px;
   float:left;

   
}
.ranking_most{
   width:40px;
   height:40px;
   float:left;
   border-radius:100px;
   margin-left:5px;
   margin-top: 2px;   
}
.ranking_tier{
   height:40px;
   width:40px;   
   float:left;    
}
.ranking_summoner{
   width:150px;
   height:50px;
   font-size:14px;
   float:left;
   line-height: 52px;
   text-align: center;
   
}
.ranking_troll_val{
   margin:0 auto;
   width:50px;
   height:100%;
   font-size:16px;
   float:left;
   line-height: 52px;
   text-align: center;
}
.disc_expired{
   width:150px;
}
.disc_troller{
   width:180px;
} 
.disc_troll_cnt{
   width:30px;
   
} 
/*COMMON*/ 
span.expired{
   color:red;
}

/* DUO*/
span.alert_span{
   font-size:20px;
   text-align: center;
   display:inline-block;
   width:100%;
}
.page_btn{
   position:relative;
}
.page_btn>img{
   width:40px;
   height:40px;
   position:absolute;
   top:50%;
   margin-top:-20px;
}
#prev{
   width:14%;
   height:86%;
   margin:0;
   float:left;
}
#next{
   width:14%;
   height:86%;
   margin:0;
   float:right;
}
.page_btn:hover{
   cursor: pointer;
}
.row_duo{
   
   height:50px;
   margin:0;
   float:left;
   position: relative;
}
.row_duo:hover{
   background-color: rgb(160,163,175);
   cursor: pointer;
}
.duo_lane{
   width:40px;   
   float:left;
   margin-top: 6px;

}
.duo_title{
   
   width:150px;
   height:50px;
   line-height:50px;
   text-align:center;
   float:left;
   font-size:14px;
}
#duo_wrap{
   float: left;
   width: 200px;
   height: 260px;
   margin-top: 15px;
   margin-left: 10px;
}
</style>
</head>
<title>트롤경찰청</title>
<c:if test="${!empty message }">
   <script>
      alert("${message}");
   </script>
</c:if>
<body>
   <div id="wrap">
      <div id="left_div">
         <div id="ranking_board" class="board">
            <h4>TROLL RANKING</h4>
         </div>
         <div id="matching_board" class= "board">
            <h4>DUO</h4>
            <div id="prev">
               
            </div>   
                        
            <div id="next">
               
            </div>
         </div>
      </div>
      <div id="center_div">
         <div id="disc_board" class= "board">
            <h4>DISCUSSION</h4>
         </div>
      </div>
      <div id="right_div">
         <div id="free_board" class= "board">
            <h4>FREE</h4>
         </div>
      </div>
   </div>
</body>
<script type="text/javascript">
var userTier = "${loginUser.tier}";
var day = 1000*60*60*24;
var hour = 1000*60*60;
var minute = 1000*60;
var second = 1000;
var matchingBoard;
var duoPage = 1;
var duoSize = 0;

$(document).ready(function(){
   loadData();
});

function loadData(){
   $(".board>div").remove();
   
   
   $.get("mainDisc",{},function(discBoard){
      console.log(discBoard);
      drawDisc(discBoard);
      drawTimer();
      $.get("mainRanking",{},function(rankingBoard){
         drawRanking(rankingBoard);
         if(userTier!=""){
            $.get("mainDuo",{"tier":userTier},function(duo){
               duoPage = 1;
               matchingBoard = duo;
               drawDuoForm(matchingBoard);
            },"json");   
         }else {
            $("#matching_board").append("<div class='board_row matching_row'></div>");
            $(".matching_row").append("<span class='alert_span'>로그인 후 이용 가능합니다.</span>");
         }
      },"json");
   },"json");
   
}


var timer = setInterval(drawTimer,1000);

//에러 체크 동작시 콜백으로 동작순서가 뒤죽박죽됨
var loadDataInterval = setInterval(loadData,1000*60*5);

//ranking
$(document).on("click",".row_ranking",function(){
   var nickname = $(this).children(".nickname").val();
   //console.log(nickname);
   location.href = "srcTroll?page=1&troller="+nickname;
});

$(document).on("click",".alert_span",function(){
   location.href="login";
})
//discussion
$(document).on("click",".row_disc",function(){
   var discboardId = $(this).children(".disc_boardId").val();
   //console.log(discboardId);
   if(discboardId ==null) return;
   location.href = "discDetail?discBoardId="+discboardId;
});

function drawRanking(ranking){
   var size = ranking.length;
   if(size > 5) size = 5;
   for(var i=0;i<size;i++){
      $("#ranking_board").append("<div class='row_ranking board_row'></div>");
      $(".row_ranking:last-child").append("<input class='nickname' type='hidden' value='"+ranking[i]['nickname']+"'>");
      $(".row_ranking:last-child").append("<div class='ranking_info'></div>");
      $(".row_ranking:last-child").append("<div class='ranking_summoner'></div>");
      $(".row_ranking:last-child").append("<div class='ranking_troll_val'></div>");
      
      //트롤 모스트 챔프, 티어 출력
      $(".row_ranking:last-child .ranking_info").append("<img class='ranking_most' src='${pageContext.request.contextPath}/resources/img/champion/"+ranking[i]['trollChamp']+".png'>");
      $(".row_ranking:last-child .ranking_info").append("<img class='ranking_tier' src='${pageContext.request.contextPath}/resources/img/tier/"+ranking[i]['tier']+".png'>");
      //트롤러 닉네임 출력
      $(".row_ranking:last-child .ranking_summoner").append("<span>"+ranking[i]['nickname']+"</span>");
      //트롤러 트롤지수 출력
      var trollCount = (ranking[i]['tie']+ranking[i]['troll']+ranking[i]['notTroll']);
      $(".row_ranking:last-child .ranking_troll_val").append("<span>"+trollCount+" 회 </span>");
   }
}

function drawDisc(disc){
   console.log(disc);
   $("#disc_board").append("<div class='row_disc board_row'></div>");
   $(".row_disc:last-child").append("<div class='disc_expired'>투표종료</div>");
   $(".row_disc:last-child").append("<div class='disc_troller'>트롤러</div>");
   $(".row_disc:last-child").append("<div class='disc_troll_cnt'>트롤</div>");
   for(var i=0;i<disc.length;i++){
      //ROW
      $("#disc_board").append("<div class='row_disc board_row'></div>");
      //추가
      $(".row_disc:last-child").append("<input class='disc_boardId' type='hidden' value='"+disc[i]['discBoardId']+"'>");
      
      //IN ROW
      //EXPIRED
      $(".row_disc:last-child").append("<div class='disc_expired'></div>");
      $(".row_disc:last-child > .disc_expired").append("<span class='expired'></span>");
      $(".row_disc:last-child .disc_expired").append("<input class='expired' type='hidden' value="+disc[i]['expired']+">");
      
      //TROLLER
      $(".row_disc:last-child").append("<div class='disc_troller'>"+disc[i]['troller']+"</div>");
      //TROLL CNT
      $(".row_disc:last-child").append("<div class='disc_troll_cnt'>"+(disc[i]['up']-disc[i]['down'])+"</div>");
      
   }
}

function drawTimer(){
   var size = $(".row_disc").length;
   console.log(size);
   
   var now = new Date().getTime();
   
   for(var i=2;i<size+2;i++){
      var expired = $(".row_disc:nth-child("+i+") input.expired").val();
      var distance = expired - now;
      var days = Math.floor(distance/day);
      distance -= days*day;
      var hours = Math.floor(distance / hour);
      distance -= hours*hour ;
      var minutes = Math.floor(distance / minute);
      distance -= minutes*minute;
      var seconds = Math.floor(distance / second);
      
      if(days>0)
         var text = days+" 일  "+hours+" 시 " + minutes + " 분 " + seconds +" 초 ";
      else{
         if(hours>0)
            var text =   hours+" 시 " + minutes + " 분 " + seconds +" 초 ";
         else {
            if(minutes>0)
               var text = minutes + " 분 " + seconds +" 초 ";
            else {
               var text = seconds + " 초 ";
            }
         }
      }
      $(".row_disc:nth-child("+i+") span.expired").text(text);
   }
   
}

function drawDuoForm(duo){
   console.log(duo);
   //prevPage 버튼
   $("#matching_board").append("<div id='prev' class='page_btn'></div>");
   $("#prev").append("<img src='${pageContext.request.contextPath}/resources/img/prev.png'>");
   /*게시판이 여기에 들어간다 .*/
   duoSize = duo.length;
   $("#matching_board").append("<section id='duo_wrap'></section>");
   drawDuo(duo);   
   //nextPage버튼
   $("#matching_board").append("<div id='next' class='page_btn'></div>");      
   $("#next").append("<img src='${pageContext.request.contextPath}/resources/img/next.png'>");
   $("#matching_board").append("<span style='display:none;' class='clear'></span>");
}
function drawDuo(duo){
   $("#duo_wrap").empty();
   for(var i=(duoPage-1)*5;i<duoSize&&i<duoPage*5;i++){
      $("#duo_wrap").append("<div class='row_duo'></div>");
      $("#duo_wrap .row_duo:last-child").append("<img class='duo_lane' src='${pageContext.request.contextPath}/resources/img/ranked-positions/Position_"+duo[i]['tier']+"_"+duo[i]['lane']+".png'>");
      var nickname = duo[i]['nickname'];
      $(".row_duo:last-child").append("<div class='duo_title'>"+nickname+"( "+duo[i]['participants']+" )</div>");
      $(".row_duo:last-child").append("<span style='display:none;' class='clear'></span>");
   }
}
/* PAGE BUTTON */
$(document).on("click","#prev",function(){
   if(duoPage>1){
      duoPage--;
      drawDuo(matchingBoard);
   }
})
$(document).on("click","#next",function(){
   var lastPage = Math.floor(duoSize / 5);
   lastPage += duoSize % 5 > 0 ? 1 : 0;
   
   if(duoPage < lastPage){
      duoPage++;
      drawDuo(matchingBoard);
   }
})
function drawFree(free){
   console.log(free);
}
</script>
</html>

