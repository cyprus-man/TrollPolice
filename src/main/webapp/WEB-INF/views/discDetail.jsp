<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${board.troller}님이신고되셨습니다.</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style type="text/css">
* {
   color: black;
   text-decoration: none;
}

*:focus {
   outline: none;
}

#wrap {
   min-width: 990px;
   max-width: 990px;
   margin: 0 auto;
   margin-top: 90px;
}

div #board {
   position: relative;
}

.boardName {
   width: 990px;
   height: 60px;
   padding-top: 40px;
   padding-bottom: 10px;
}

#backPage {
   width: 80px;
   height: 20px;
   font-size: 13px;
   color: #666;
   cursor: pointer;
   margin-top: 10px;
   padding-top: 10px;
   padding-bottom: 10px;
   border: 1px solid #e6e6e6;
   text-align: center;
   float: right;
}

div#backPage:hover {
   border: 1px solid #a3a3a3;
}

h1 {
   font-size: 32px;
   font-weight: 400;
   float: left;
}

.mainHeader {
   height: 70px;
   width: 930px;
   margin: 0 auto;
   padding: 50px 30px 20px 30px;
   background-color: #f9f9f9;
   border-top: 1px solid #7e7e7e;
}

h2 {
   font-size: 24px;
   font-weight: 500;
}

.subHeader {
   height: 45px;
   width: 945px;
   margin: 0 auto;
   border-top: 1px solid #e3e3e3;
   border-bottom: 1px solid #e3e3e3;
   padding-top: 15px;
   padding-right: 15px;
   padding-left: 30px;
}

h3 {
   float: left;
   font-size: 13px;
   font-weight: 400;
   margin-top: 6px;
   margin-right: 25px;
   margin-left: 5px;
   color: #888;
}

#TierDiv, #boardTier {
   width: 20px;
   height: 20px;
   float: left;
}

#boardTier {
   margin-top: 5px;
}

.rightHeader {
   width: 270px;
   height: 30px;
   float: right;
}

.boardSub {
   position: absolute;
   left: 915px;
   display: none;
}

#boardSiren {
   width: 80px;
   height: 30px;
   padding: 9px 5px 5px 5px;
   text-align: center;
   cursor: pointer;
   background-color: #ec4b39;
   color: white;
}

#boardCount, #boardEye {
   float: left;
   margin-top: 8px;
}

#boardMenu {
   margin-top: 3px;
   float: right;
   cursor: pointer;
}

#boardToolbarDiv {
   width: 800px;
   height: 100px;
   margin: 0 auto;
}

#boardToolbarDiv button {
   border: none;
   width: 190px;
   height: 53px;
   float: left;
   font-size: 22px;
   font-weight: 500;
}

#ToolMove {
   width: 600px;
   height: 53px;
   margin: 0 auto;
}

#upDownDiv {
   width: 77px;
   height: 40px;
   padding-top: 13px;
   margin-left: 15px;
   margin-right: 15px;
   text-align: center;
   border: 1px solid #e3e3e3;
   float: left;
}

#boardContent {
   width: 800px;
   margin: 0 auto;
   color: #333;
   font-size: 16px;
   border-top: 1px solid black;
   padding-top: 40px;
   padding-bottom: 40px;
   padding-left: 20px;
   padding-right: 20px;
}

/*match Info css*/
#resultDiv {
   min-width: 900px;
   max-width: 980px;
}

.result {
   margin: 0 auto;
}

.row {
   height: 380px;
   padding: 15px;
   border-radius: 5px;
   width: 800px;
   margin: 40px auto;
   position: relative;
}

.summoner {
   width: 100px;
}

.summonerInfo {
   width: 105px;
   float: right;
}

.summoners {
   width: 850px;
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
   border: 5px solid red;
}

.item {
   width: 30px;
   height: 30px;
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
   height: 15px;
   background-color: #f6890a;
   font-size: 12px;
   color: white;
}

.spellRune {
   margin-top: 5px;
   width: 40px;
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
   width: 820px;
   height: 40px;
   bottom: 30px;
   left: 50%;
   margin-left: -350px;
   position: absolute;
}

.teamStats>div {
   padding: 5px;
}

img.teamStatsImg {
   width: 30px;
   height: 30px;
}

.blueTeam {
   width: 220px;
   height: 40px;
   line-height: 40px;
   border: 1px solid black;
   border-radius: 5px;
   margin-left: 60px;
   margin-top: 30px;
   display: inline-block;
}

.redTeam {
   width: 220px;
   height: 40px;
   line-height: 40px;
   border: 1px solid black;
   border-radius: 5px;
   margin: 0px 143px;
   display: inline-block;
}

/* REPLY CSS*/
#replyWrap {
   width: 100%;
}

#replyForm {
    width: 100%;
    min-height: 50px;
    line-height: 25px;
    padding-bottom: 20px;
    margin-left: 15px;
    margin-bottom: 20px;
    border-bottom: 1px solid gray;
    position: relative;
}

#replyContentP {
   height: 70%;
    width: 80%;
    margin-right: 20px;
    margin-left: 12px;
    display: inline-block;
    border-bottom: 3px solid gray;
}

button#insertReply {
   width: 150px;
   height: 40px;
   border: none;
}

button.insertReply{
   width: 150px;
    height: 40px;
    margin-top: 50px;
    border: none;
    float: right;
    margin-right: 13px;
}
button#insertReply:hover {
   background-color: RGB(163, 184, 214);
   cursor: pointer;
}

.toolbarDiv {
   margin: 15px 0;
    padding: 10px;
    margin-left: 60px;
    clear: both;
}
.toolbarDiv div{
    float: left;
    background-position: center;
    background-repeat: no-repeat;
    width: 30px;
    height: 30px;
}
.replyRow {
   border: 1px solid white;
    min-height: 100px;
    line-height: 25px;
    padding-bottom: 20px;
    margin-bottom: 20px;
    border-bottom: 1px solid gray;
    position: relative;
    float: left;
}

.answers > p.nickname {
    padding-top: 30px;
    padding-bottom: 20px;
}

.replyRow > .nickname {
   margin-top:30px;
}

#contentDiv {
   width: 865px;
    word-break: break-all;
    padding: 0 0 20px 40px;
    float: left;
    margin-left: 35px;
}

#childContent{
    width: 740px;
    padding-left: 20px;
    padding-top: 25px;
    padding-bottom: 60px;
    position: absolute;
}

.btnAnswer {
   width: 120px;
   height: 30px;
   border: 1px solid gray;
   margin: 0 10px;
}

.upVote {
   background-image:
      url("${pageContext.request.contextPath}/resources/img/like.png");
}

.upVote.voted {
   background-image:
      url("${pageContext.request.contextPath}/resources/img/like_voted.png");
}

.downVote {
   background-image:
      url("${pageContext.request.contextPath}/resources/img/dislike.png");
}

.downVote.voted {
   background-image:
      url("${pageContext.request.contextPath}/resources/img/dislike_voted.png");
}

.btnAnswer:hover {
   background-color: RGB(163, 184, 214);
}
/*replyRow > p  border-bottom*/
.replyRow p:focus {
   max-height: 25px;
   overflow-y: scroll;
}

.replyAccept {
   width: 70px;
   height: 40px;
   background-color: #e6e6e6;
   float: left;
   line-height: 40px;
   text-align: center;
   margin: 0 20px;
}

.replyCancel {
   width: 70px;
   height: 40px;
   background-color: #e6e6e6;
   float: left;
   line-height: 40px;
   text-align: center;
   margin: 0 20px;
}

img.replyMenu:hover {
   cursor: pointer;
}

img.replyMenu {
   position: absolute;
   top: 20px;
   right: 20px;
}

/* MY TOOLBAR*/
.myToolbar {
   width: 90px;
   background-color: #e6e6e6;
   z-index: 1;
   border: 1px solid gray;
   position: absolute;
   top: 44px;
   right: 20px;
   padding: 10px 0;
   display: none;
   position: absolute;
}

.myToolbar>div {
   width: 100%;
   height: 50%;
   line-height: 44px;
   font-size: 20px;
   font-size: 18px;
   text-align: center;
}

.myToolbar>div:hover {
   background-color: #ccc;
}

.tier_container {
   width: 60px;
   height: 60px;
   float: left;
   margin: 10px;
}

.tier_img {
   width: 100%;
   height: 100%;
}

.btnReport {
   display: none;
}

.replyRow button {
   cursor: pointer;
}

.answers {
   margin-left: 70px;
   position: relative;
   margin-bottom: 40px;
}



.voted {
   background-color: RGB(163, 184, 214);
   color: white;
}

.replyChildDiv {
   width: 100%;
    height: 110px;
    border: 1px solid black;
}

/* UPDATE REPLY */
.update_selected {
   
}

.notUpdated {
   display: none;
}
</style>
<!--  NOT LOGIN -->

</head>
<body>

   <article>
      <div id="wrap">
         <!-- 20200326 -->
         <form id="serviceReport" method="post" action="serviceCenterWrite">
            <input type="hidden" name="type" id="serviceType"> <input
               type="hidden" name="targetId" id="serviceTargetId">
            <!--  -->
         </form>
         <div id="board">

            <div class="boardName">
               <h1>토론게시판</h1>

               <div id="backPage">
                  <a href="discussionBoard">목록</a>
               </div>

            </div>

            <div class="mainHeader">
               <h2>${board.troller}님이 신고되셨습니다.</h2>
            </div>

            <div class="subHeader">
               <div id="TierDiv">
                  <img id="boardTier"
                     src="${pageContext.request.contextPath}/resources/img/tier/${board.tier}.png">
               </div>

               <h3>${board.nickname}</h3>

               <div class="rightHeader">

                  <img id="boardCount"
                     src="${pageContext.request.contextPath}/resources/img/eye.png">
                  <h3>${board.readcount}</h3>

                  <img id="boardEye"
                     src="${pageContext.request.contextPath}/resources/img/date.png">
                  <h3>
                     <fmt:formatDate value="${board.writeDate}"
                        pattern="yyyy.MM.dd KK:mm" />
                  </h3>

                  <img id="boardMenu"
                     src="${pageContext.request.contextPath}/resources/img/menu.png">
               </div>
            </div>

            <div class="boardSub">
               <div id="boardSiren"
                  onclick="openService('disc',${board.discBoardId})">신고하기</div>
            </div>

            <div id="resultDiv"></div>

            <div id="boardContent">${board.content}</div>

            <div id=boardToolbarDiv>

               <div id="ToolMove">

                  <button id='troll'>트롤</button>

                  <div id="upDownDiv">
                     <span id=trollUp>${board.up}</span>명
                  </div>


                  <button id='notTroll'>반대</button>

                  <div id="upDownDiv">
                     <span id=trollDown>${board.down}</span>명
                  </div>
               </div>

            </div>
            <!-- 리포트의 view 를 본따서 만듬 -->
         </div>

         <div id="replyForm">
            <c:if test="${!empty loginUser }">
               <p id="replyContentP" contenteditable="true"></p>
               <input type="hidden" id="content" name="content">
               <button id="insertReply">댓글 작성</button>
            </c:if>
         </div>

         <div id="replyWrap"></div>
         <input type='hidden' id="answerPage" name='answerPage' value='1'>
         <input type='hidden' id="replyPage" name='replyPage' value='1'>
         <!-- 
            <c:if test="${!empty loginUser }">
            </c:if>
          -->

      </div>
   </article>
   <script type="text/javascript"
      src="https://code.jquery.com/jquery-3.4.1.js"></script>
   <script type="text/javascript">
   //matchDraw variables
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

                     
                     
                     
var troller = "${board.troller}";
var nickname = "${loginUser.nickname}";
var email    = "${loginUser.email}";
var validation = "${loginUser.validation}";
var discId = ${board.discBoardId};
var replyCount = ${board.replyCount};
var discIsVote = ${board.isVote};
var minute = 1000 * 60;
var updateFlag = false;
var replyContent;
var isUpdate = false;


$(document).ajaxStart(function() {
   $(document.body).css({'cursor' : 'wait'});
   $("button").attr("disabled",true);
}).ajaxStop(function() {
   $(document.body).css({'cursor' : 'default'});
   $("button").attr("disabled",false);
}).ajaxSuccess(function(){
   $(document.body).css({'cursor' : 'default'});
   $("button").attr("disabled",false);
});


//SUBMENU toggle
$(document).on("click","#boardMenu",function(){
      $(this).toggleClass("menu_open");
      console.log("aaa");
      
      if($(this).hasClass("menu_open")){
         console.log("true");
         $(".boardSub").fadeIn(400);   
      }else{
         console.log("false");
         $(".boardSub").fadeOut(400);
      }
   }).on("click","body",function(){
      console.log(isUpdate);
   });
//var rowScheme = "<div class='row'>"; var rowSchemeEnd = "</div>"
$(document).ready(function(){
   $.get("getMatchByBoard",{"discId":discId},function(json){
      drawOneMatch(json,0);
      selectTroller();
      
      if(discIsVote==1){
         $("#troll").addClass("voted");
      }else if(discIsVote==-1){
         $("#notTroll").addClass("voted");
      }
      
   },"json").fail(function(){
      alert("서버 연결 오류");
   });
   
   getReplyList(false)
   //PROMISE 
});


$(document).on("click","#insertReply",function(){
   if(validation!='Y'){
      if(confirm("인증 후 이용 가능합니다.\n인증 페이지로 이동합니까?")){
         location.href="main";
      }else{
         return;
      }
   }
   insertReply();
});


//troll Vote
$("#troll").on("click",function(){
   if(loginCheck()){
      if($("#troll").hasClass("voted")){
         //delete TrollVote
         trollVoteDelete(1);
      }
      else if($("#notTroll").hasClass("voted")){
         //switch Troll Vote
         trollVoteUpdate(1);
      }
      else{
         //new Troll Vote
         trollVote(1);
      }
   }
})


$("#notTroll").on("click",function(){
   if(loginCheck()){
      if($("#notTroll").hasClass("voted")){
         //delete TrollVote
         trollVoteDelete(-1);
      }
      else if($("#troll").hasClass("voted")){
         //switch Troll Vote
         trollVoteUpdate(-1);
      }
      else{
         //new Troll Vote
         trollVote(-1);
      }
   }
})
$(document).on("focus",".replyRow p",function(){
   console.log("focus");
})

function selectTroller(){
   var size = $(".summoners").length;
   
   for(var i=2;i<=6;i++){
      //summonerDiv index 2 ~ 6
      if($(".summoners:nth-child("+i+") > .summoner:nth-child("+ 2 +") .summonerName").text()==troller){
         
         $(".summoners:nth-child("+i+") > .champ:nth-child(1)").addClass("champSelect");
      };
      if($(".summoners:nth-child("+i+") > .summoner:nth-child("+ 5 +") .summonerName").text()==troller){
         
         $(".summoners:nth-child("+i+") > .champ:nth-child(7)").addClass("champSelect");
      };
      //summonerName
   }
}
function loginCheck()
{
   if(email.length == 0){
      if(confirm("로그인 후 이용가능합니다.\n로그인페이지로 이동합니까?")){
         location.href="login";
         return false;
      }
      return false;
   }
   else{
      if(validation!='Y'){
         if(confirm("인증 후 이용 가능합니다.\n인증페이지로 이동합니까?")){
            location.href="main";
         }
         return false;
      }
      return true;
   }
}

//댓글도 페이징을 해야한다.?
//이 부분이 가장 큰 문제...
function insertReply(){
   if(!loginCheck()){
      return ;   
   }
   
   //html 태그가 먹는걸 막아야함...
   var now      = Date.now();
   var distance = (now - sessionStorage.getItem("discReply"));
   $("#content").val($("#replyContentP").text());
   
   if($("#content").val()==""){
      alert("내용을 입력해주세요.");
      return false;
   }
   
   if(distance < minute) {//
      alert("1분에 한번 댓글을 작성 할 수 있습니다.");
      return false;
   }
   else{
      $("#replyContentP").text("");
      
      var content  = $("#content").val();
      var msg = 
         {
            "nickname" : nickname,
            "email" : email,
            "content" : content,
            "discBoardId"   : discId
         };
      
      sessionStorage.setItem("discReply",Date.now());   

      $.post("insertReply",msg,function(){
         $("#replyWrap").empty();
         $("#replyPage").val(1);
         getReplyList(false);
      },"text").fail(function(){
         alert("서버 오류");
      });
      
   }
      return false;
}


function getReplyList(isNext){
   var replyPage = parseInt($("#replyPage").val());
   var maxReplyPage = parseInt(replyCount / 20);
   
   maxReplyPage += maxReplyPage % 20 > 0 ? 1 : 0;
   
      $.get("getReplyList",{"discBoardId":discId,"replyPage" : replyPage},function(json){
         //replyCount 동적으로 재할당
         //replyCount = ...
         
         
         
         //함수로 분리
         var size = json.length;
         if(!isNext){
            $("#replyWrap").empty();
            replyPage = 1;
         }
         
         console.log(json);
         
         for(var i=0;i<size;i++){
            var parentId = json[i]["parentId"];
            //div에 append 댓글 창 div 하나 
            $("#replyWrap").append("<div class='replyRow'></div>");
            
            //닉네임에도 a태그를 붙여서 이용
            $(".replyRow:last-child").append("<div class='tier_container'></div");
            $(".replyRow:last-child > .tier_container").append("<img class='tier_img' src='${pageContext.request.contextPath}/resources/img/tier/"+json[i]['tier']+".png'>");
            $(".replyRow:last-child").append("<p class='nickname'> [ "+json[i]['nickname']+" ] </p>");
            $(".replyRow:last-child").append("<input type='hidden' value='"+json[i]['childCount']+"'>");
            
            var content = json[i]['content'];
            var childCount= json[i]['childCount'];
            var replyEmail = json[i]['email'];
            console.log(replyEmail);
            
            
            
            /* 댓글 폼 append*/
            $(".replyRow:last-child").append("<div id ='contentDiv' class='content"+json[i]['replyId']+"'>"+content+"</div>");
            $(".replyRow:last-child").append("<input type='hidden' value='"+replyEmail+"' class='email'>");
            $(".replyRow:last-child").append("<br>");
            $(".replyRow:last-child").append("<div class='toolbarDiv'></div>");
            
            // toggleClass good - > if good 이면 ... good -> voted
            //voted is 0 or 1 good/bad toggle.voted
            $(".replyRow:last-child .toolbarDiv").append("<div class='upVote upVote"+json[i]['replyId']+"' onclick='upVote("+json[i]['replyId']+")'></div>");
            
            
            //up > 0 : show up Count 
            //else : do nothing
            $(".replyRow:last-child .toolbarDiv").append("<div class='upCount"+json[i]['replyId']+"'></div>");
            if(json[i]['up']>0)
               $(".upCount"+json[i]['replyId']).text(json[i]['up']);
            $(".replyRow:last-child .toolbarDiv").append("<div class='downVote downVote"+json[i]['replyId']+"' onclick=downVote("+json[i]['replyId']+")></div>");
            $(".replyRow:last-child .toolbarDiv").append("<input type='hidden' class=downCount"+json[i]['replyId']+" value='"+json[i]['down']+"'>");
            $(".replyRow:last-child .toolbarDiv").append("<button class='btnAnswer btnAnswer"+
                  json[i]['replyId']+"' onclick=getChildForm("+i+","+json[i]['replyId']+")>답글</button>");
            
            
            
            //delete and update
            $(".replyRow:last-child").append("<img class=replyMenu onclick='openReplyMenu("+json[i]['replyId']+")' src='${pageContext.request.contextPath}/resources/img/menu.png'>");
            $(".replyRow:last-child").append("<div class='myToolbar myToolbar"+json[i]['replyId']+"'></div>");
            
            if(email==json[i]['email']){
               $(".replyRow:last-child > .myToolbar").append("<div class='replyUpdate"+json[i]['replyId']+
                     " replyUpdate' onclick='updateReply("+json[i]['replyId']+")'>수정</div>");
               $(".replyRow:last-child > .myToolbar").append("<div class='replyDelete"+json[i]['replyId']+
                     " replyDelete' onclick='deleteReply("+json[i]['replyId']+")'>삭제</div>");
               $(".replyRow:last-child ").append("<div class='replyAccept"+json[i]['replyId']+
                     " notUpdated replyAccept' onclick='acceptReply("+json[i]['replyId']+")'>등록</div>");
               $(".replyRow:last-child ").append("<div class='replyCancel"+json[i]['replyId']+
                     " notUpdated replyCancel' onclick='cancelReply("+json[i]['replyId']+")'>취소</div>");
            }else {
               /*20200326   현재 본인 글만 신고가 가능함 버그 수정...*/
               $(".replyRow:last-child > .myToolbar").append("<div class='service' onclick=openService('discReply',"+json[i]['replyId']+")>신고하기</div>");
            }
            
            //to show vote 
            if(json[i]['isVote']==1){
               $(".upVote"+json[i]['replyId']).addClass("voted");
            }else if(json[i]['isVote']==-1){
               $(".downVote"+json[i]['replyId']).addClass("voted");
            }
            
            
            //답글 보기.
            if(childCount > 0){
               
               $(".replyRow:last-child").append("<div class='answer'></div>");
               
               $(".replyRow:last-child ").append("<input type='hidden' class='childCount'  value="+childCount+">");
               $(".replyRow:last-child ").append("<input type='hidden' class='nowChildPage'  value=1>");
               $(".replyRow:last-child .answer").append("<span id='moreLook'onclick=getChildReply("+json[i]['replyId']+","+i+","+childCount+
                     ") style='color:blue;'>답글  "+childCount+" 개 더보기</span>");
            }
         }
         
         
         //댓글 더 보기
         $(".nextReply").remove();
         
         if(maxReplyPage > replyPage){
            $(".replyRow:last-child").append("<div class='nextReply' onclick='getNextReply("+replyPage+")'>댓글 더 보기</div>");
         }   
         
         if(isExpired()){
            $("#boardToolbarDiv button").attr("disabled","true");
            $("#replyForm").css("display","none");
            $(".toolbarDiv button").attr("disabled","true");
         }
            
         },"json").fail(function(){
            alert("서버 오류.");
         });
   
   };
   /* reply MENU OPEN*/
   function openReplyMenu(replyId){
      if($(".myToolbar"+replyId).is(":visible")){
         $(".myToolbar"+replyId).hide("fast");
      }else {
         $(".myToolbar").hide();
         $(".myToolbar"+replyId).show("fast");
      }
      
   }
   /*
      ---------------~TrollVote Functions~-----------
   */
   
   function trollVote(decision){
      var msg = {
            "discBoardId" : discId,
            "decision" : decision
      };
      $.post("insertTrollVote",msg,function(text){
         //json OR text
         if(text=="notLogin"){
            alert("로그인 안된 상태입니다.");
            return false;
         }
         if(decision == 1){
            $("#troll").addClass("voted");
            var up = parseInt($("#trollUp").text())+1;
            $("#trollUp").text(up);
         }else if(decision == -1){
            $("#notTroll").addClass("voted");
            var down = parseInt($("#trollDown").text())+1;
            $("#trollDown").text(down);
         }
         
      },"text");
      
   }
   
   function trollVoteUpdate(decision){
      var msg = {
         "discBoardId" : discId,
         "decision" : decision
      };
      
      $.post("updateTrollVote",msg,function(text){
         if(text=="notLogin"){
            alert("로그인 안된 상태입니다.");
            return false;
         }
         $("#troll").toggleClass("voted");
         $("#notTroll").toggleClass("voted");
         if(decision == 1){
            var up = parseInt($("#trollUp").text())+1;
            var down = parseInt($("#trollDown").text())-1;
            $("#trollUp").text(up);
            $("#trollDown").text(down);
         }else if(decision == -1){
            var up = parseInt($("#trollUp").text())-1;
            var down = parseInt($("#trollDown").text())+1;
            $("#trollUp").text(up);
            $("#trollDown").text(down); 
         }
      },"text").fail(function(){
         alert("서버 오류 문의 바랍니다.");
      });
   }
   
   function trollVoteDelete(decision){
      
      $.post("deleteTrollVote",{"discBoardId":discId,"decision":decision},function(text){
         if(text=="notLogin"){
            alert("로그인 안된 상태입니다.");
            return false;
         }
         console.log(decision);
         switch(decision){
         case  1: 
            $("#troll").toggleClass("voted");
            var up = parseInt($("#trollUp").text())-1;
            $("#trollUp").text(up);
            break;
         case -1: 
            $("#notTroll").toggleClass("voted");
            var down = parseInt($("#trollDown").text())-1;
            $("#trollDown").text(down);
            break;
         }
      },"text")
   }
   function getNextReply(replyPage){
      $("#replyPage").val(replyPage+1);
      getReplyList(true);
   }
   
   
   function getChildReply(replyId,index,count){
      var answerPage = 1;
      
      $(".forming").removeClass("forming");
      
      $.get("getChildReply",{"replyId" : replyId,"discBoardId" : discId, "answerPage" : answerPage },function(json){
         $(".replyRow:nth-child("+(index+1)+") > .answer").empty();
         $(".replyRow:nth-child("+(index+1)+") > .answer").append("<div onclick='hideChildReply("+replyId+","+index+","+count+")' style='color:blue; margin-bottom:20px; '>답글  "+count+" 개 숨기기</div>");
         drawChild(json,index);
         
         
         //if expired -> disabled
         if(isExpired()){
            $(".toolbarDiv button").attr("disabled","true");
         }
         
      },"json");
   }
   
   
   function hideChildReply(replyId,index,childCount){
      //답글 작성 form 삭제
      $(".forming").removeClass("forming");
      
      //답글 더보기 삭제 
      $(".replyRow:nth-child("+(index+1)+") .moreChild").remove();
      //현재 답글 페이지 1
      $(".replyRow:nth-child("+(index+1)+") .nowChildPage").val(1);
      $(".replyRow:nth-child("+(index+1)+") > .answer").empty();
      
      //답글 form 삭제 
      $(".replyChildDiv").remove();
      
      //for child paging
      $(".replyRow:last-child .answer").append("<input type='hidden' class='childCount'  value="+childCount+">");
      $(".replyRow:last-child .answer").append("<input type='hidden' class='nowChildPage'  value=1>");
      
      $(".replyRow:nth-child("+(index+1)+") > .answer").append("<span  onclick=getChildReply("+replyId+","+index+","+childCount+
            ") style='color:blue;'>답글  "+childCount+" 개 더보기</span>");
   }
   
   
   function drawChild(child,index){
      var size = child.length;
      console.log(index);
      console.log(size);
      console.log(child);
      
      
      $(".replyChildDiv").remove();
      
      for(var i=0;i<size;i++){
         
         var parentId = child[i]["parentId"];
         var content = child[i]['content'];
         var childCount= child[i]['childCount'];
         var replyEmail = child[i]['email'];
         
         //대댓글 하나씩에 div 로 묶는다 -> answers  이거 클래스명이 서로 바뀜... 뜻이해가 힘들수도  
         //전체  div 가 answer 
         //댓글 각각의 div answers
         
         //대댓글 페이징 5개씩 ...
         
         $(".replyRow:nth-child("+(index+1)+") > .answer").append("<div class='answers'></div>");
         
         
         //여기다
         $(".replyRow:nth-child("+(index+1)+") .answers:last-child").append("<div class='tier_container'></div");
         $(".replyRow:nth-child("+(index+1)+") .answers:last-child .tier_container").append("<img class='tier_img' src='${pageContext.request.contextPath}/resources/img/tier/"+child[i]['tier']+".png'>");
         $(".replyRow:nth-child("+(index+1)+") .answers:last-child").append("<p class='nickname'> [ "+child[i]['nickname']+" ] </p>");
         
         //댓글 폼 append
         $(".replyRow:nth-child("+(index+1)+") .answers:last-child").append("<p class='content"+child[i]['replyId']+"'>"+content+"</p>");
         $(".replyRow:nth-child("+(index+1)+") .answers:last-child").append("<input type='hidden' value='"+replyEmail+"' id='email'>");
         $(".replyRow:nth-child("+(index+1)+") .answers:last-child").append("<br>");
         $(".replyRow:nth-child("+(index+1)+") .answers:last-child").append("<div class='toolbarDiv'></div>");
         
         // toggleClass good - > if good 이면 ... good -> voted
         //voted is 0 or 1 good/bad toggle.voted
         $(".replyRow:nth-child("+(index+1)+") .answers:last-child .toolbarDiv").append("<div class='upVote upVote"+child[i]['replyId']+"' onclick='upVote("+child[i]['replyId']+")'></div>");
         
         
         //up > 0 : show up Count 
         //else : do nothing
         
         $(".replyRow:nth-child("+(index+1)+") .answers:last-child .toolbarDiv").append("<div class='upCount"+child[i]['replyId']+"'></div>");
         
         if(child[i]['up']>0)
            $(".upCount"+child[i]['replyId']).text(child[i]['up']);
         
         $(".replyRow:nth-child("+(index+1)+") .answers:last-child .toolbarDiv").append("<div class='downVote downVote"+child[i]['replyId']+"' onclick=downVote("+child[i]['replyId']+")></div>");
         $(".replyRow:nth-child("+(index+1)+") .answers:last-child .toolbarDiv").append("<input type='hidden' class=downCount"+child[i]['replyId']+" value='"+child[i]['down']+"'>");
         
         
         //delete and update
         
         $(".replyRow:nth-child("+(index+1)+") .answers:last-child").append("<div class='myToolbar"+child[i]['replyId']+"'></div>");
         if(email==child[i]['email']){
            $(".replyRow:nth-child("+(index+1)+") .answers:last-child .myToolbar").append("<button class='replyUpdate"+child[i]['replyId']+
                  " replyUpdate' onclick='updateReply("+child[i]['replyId']+")'>수정</button>");
            $(".replyRow:nth-child("+(index+1)+") .answers:last-child .myToolbar").append("<button class='replyDelete"+child[i]['replyId']+
                  " replyDelete' onclick='deleteReply("+child[i]['replyId']+")'>삭제</button>");
            $(".replyRow:nth-child("+(index+1)+") .answers:last-child").append("<button class='replyAccept"+child[i]['replyId']+
                  " notUpdated' onclick='acceptReply("+child[i]['replyId']+")'>등록</button>");
            $(".replyRow:nth-child("+(index+1)+") .answers:last-child").append("<button class='replyCancel"+child[i]['replyId']+
                  " notUpdated' onclick='cancelReply("+child[i]['replyId']+")'>취소</button>");
         }else {
            /*20200326   현재 본인 글만 신고가 가능함 버그 수정...*/
            $(".replyRow:nth-child("+(index+1)+") .answers:last-child .myToolbar").append("<button class='service' onclick=openSerivce('discReply',"+child[i]['replyId']+")>신고하기</button>");
         }
         
         
         if(child[i]['isVote']==1){
            $(".upVote"+child[i]['replyId']).addClass("voted");
         }else if(child[i]['isVote']==-1){
            $(".downVote"+child[i]['replyId']).addClass("voted");
         }
      }
      
      
      
      //페이징  마지막 부분에 더보기 붙임.
      var nowChildPage = $(".replyRow:nth-child("+(index+1)+") > .nowChildPage").val();
      var max = $(".replyRow:nth-child("+(index+1)+") > .childCount").val();
      var maxChildPage = Math.floor(max/10);
      maxChildPage += max % 10 >0 ? 1 : 0;
      
      console.log(nowChildPage);
      console.log(maxChildPage);
      
      //more child load
      if(nowChildPage < maxChildPage){
         console.log("더보기 가능");
         $(".replyRow:nth-child("+(index+1)+") ").append("<div class='moreChild' onclick=moreChild("+index+","+parentId+")>답글 더보기</div>");
      }
   }
   
   //답글 더보기
   function moreChild(index,parentId){
      //index : replyRow 의 인덱스
      //parentId 답글의 댓글 번호.
      //page 1칸 이동
      
      var nowChildPage = $(".replyRow:nth-child("+(index+1)+") > .nowChildPage").val();
      $(".replyRow:nth-child("+(index+1)+") > .nowChildPage").val(++nowChildPage);
      var max = $(".replyRow:nth-child("+(index+1)+") > .childCount").val();
      var maxChildPage = Math.floor(max/10);
      
      maxChildPage += max % 10 >0 ? 1 : 0;
      
      $(".moreChild").remove();
      
      //아작스 호출
      $.get("getChildReply",{"replyId" : parentId,"discBoardId" : discId, "answerPage" : nowChildPage },function(json){
         drawChild(json,index);
         console.log(json);
         //if expired -> disabled
         if(isExpired()){
            $(".toolbarDiv button").attr("disabled","true");
         }
      },"json");
   }
   
   /*답글 from draw*/
   function getChildForm(index,replyId){
      
      // FROM NOT TO IS
      if(!loginCheck()){//
         return ; 
      }
      
      
      $(".replyChildDiv").remove();
      
      //FORM DRAW
      //디버깅... forming이 있는 상태에서 다른 걸 눌러서 forming을 만든경우 버그 발생
      // 다시  ( 포밍이었던 )포밍이 아닌걸 누르면 에러...
      if(!$(".btnAnswer"+replyId).hasClass("forming")){
         $(".forming").removeClass("forming");
         console.log(index);
         console.log(replyId);
         console.log("false");
         //forming-parameter is NOT replyId 
         $(".replyRow:nth-child("+(index+1)+")").append("<div class='replyChildDiv'></div>");
         $(".replyChildDiv").append("<p id='childContent' contentEditable='true'></p>");
         $(".replyChildDiv").append("<button class='insertReply' onclick='insertChildReply("+replyId+")'>작성하기</button>");
      }
      
      $(".btnAnswer"+replyId).toggleClass("forming");
   }
   
   
   /*send childReply to server*/
   function insertChildReply(parentId){
      var content = $("#childContent").text();
      console.log("childContent : "+ content);
      
      var now      = Date.now();
      var distance = (now - sessionStorage.getItem("discReply"));
      
      if(content.length<=0) {
         alert("내용을 입력해주세요 ");
         return ;
      }
      else if(distance < minute){
         alert("1분에 한번 작성 가능합니다.");
      }
      else if(content.length>50){
         // byte 계산 
         alert("최대 50글자 입력 가능합니다.");
      }
      else{
         var msg = 
         {
            "nickname" : nickname,
            "email" : email,
            "content" :content,
            "discBoardId"   : discId,
            "parentId" : parentId
         };
         
         $.post("insertReply",msg,function(){
            getReplyList(false);
         }).fail(function(){
            alert("서버오류 문의 바랍니다.");
         });
      }
   }
   
   
   /*댓글 추천/반대  */
   function upVote(replyId){
      
      if(!loginCheck()){
         return ;
      }
      else if($(".downVote"+replyId).hasClass("voted")){
         //down to up
         switchVote(replyId,"up");
      }
      else{
         var voted = $(".upVote"+replyId).hasClass("voted");
         var up = 0;
         up = voted ? 0 : 1;
         upCount = $(".upCount"+replyId).text().length == 0 ? 0 : $(".upCount"+replyId).text();
         upCount = parseInt(upCount);
         
         var msg = {
               "email" : email,
               "replyId" : replyId,
               "up" : up,
               "upCount" : upCount
         };
         
         console.log(msg);
         
         $.post("discReplyUpVote",msg,function(){
            //send msg
            $(".upVote"+replyId).toggleClass("voted");
            if(up==1)
               $(".upCount"+replyId).text(upCount+1);
            else if(up==0)
               $(".upCount"+replyId).text(upCount-1);
         },"text").fail(function(){
            alert("<Error : 문의 해주세요.>");
         });
      }
   }
   
   
   
   function deleteReply(replyId){
      console.log(replyId);
      $.post("discReplyDelete",{"replyId":replyId},function(){
         alert("삭제 되었습니다");
         $("#replyPage").val(1);
         
         getReplyList(false);
      }).fail(function(){
         alert("오류 문의 바랍니다.");
      })
   }
   function updateReply(replyId){
      console.log(replyId);
      updateFlag = true;
      //$(".content"+replyId).attr("contentEditable","true");
      replyContent = $(".content"+replyId).text();
      console.log(replyContent);
      
      
      //content
      $(".content"+replyId).toggleClass("update_selected");
      $(".content"+replyId).attr("contentEditable","true");
      $(".content"+replyId).focus();
      
      
      //toolbar AND menuIMG buttonHide
      $(".myToolbar").css("display","none");
      $(".toolbarDiv").css("display","none");
      $(".replyMenu").css("display","none");
      $(".answer").css("display","none");
      
      //Apply,Cancel buttonShow
      $(".replyAccept"+replyId).toggleClass("notUpdated");
      $(".replyCancel"+replyId).toggleClass("notUpdated");
      
      
   }
   function acceptReply(replyId){
      console.log(replyId);
      
      var content = $(".content"+replyId).text();  
      console.log(content);
      if(content.length<1){
         alert("내용을 입력해주세요 .");
         return false;
      }
      var send = {
         "content" : content,
         "replyId" : replyId
      };
      
      $.post("updateReply",send,function(){
         getReplyList(false);
      },"text").fail(function(){
         alert("서버오류입니다.");
      })
   }
   function cancelReply(replyId){
      
      //span show selected
      if(!$(".content"+replyId).hasClass("update_selected"))
         $(".update_selected").removeClass("update_selected");
      $(".content"+replyId).toggleClass("update_selected");
      
      $(".content"+replyId).text(replyContent);
      $(".content"+replyId).attr("contentEditable","false");
      
      //hideAccept
      $(".replyAccept"+replyId).toggleClass("notUpdated");
      $(".replyCancel"+replyId).toggleClass("notUpdated");
      
      //show update,delete Btn
      $(".replyMenu").css("display","inline");
      $(".toolbarDiv").css("display","block");
      $(".answer").css("display","block");
      
   }
   /*20200326*/
   function service(targetId,type){
      $("#serviceTargetId").val(targetId);
      $("#serviceType").val(type);
      $("#serviceReport").submit();
   }
   
   
   //Voted 가 하나라도 있을시 조정...
   function downVote(replyId){
      console.log("replyId : "+replyId);
      if(!loginCheck()){
         return ;
      }// is up voted?
      else if($(".upVote"+replyId).hasClass("voted")){
         switchVote(replyId,"down");
      }
      else{   
         var voted = $(".downVote"+replyId).hasClass("voted");
         var up = -1;
         up = voted ? 0 : -1;
         
         //downCount == hide -> val
         
         var downCount = $(".downCount"+replyId).val()=="" ? 0 : $(".downCount"+replyId).val();
         
         downCount = parseInt(downCount);
         
         var msg = {
               "email" : email,
               "replyId" : replyId,
               "up" : up,
               "downCount" : downCount
         };
         
         $.post("discReplyDownVote",msg,function(){
            $(".downVote"+replyId).toggleClass("voted");
            return false;
         },"text").fail(function(){
            alert("[-ERROR- 문의 바랍니다.]");
         })
      }
   }
   
   /*switch to good - > bad*/
   function switchVote(replyId,choice){
      // up   -1
      var upCount   = $(".upCount"+replyId).text();
      upCount = $(".upCount"+replyId).text().length == 0 ? 0 : $(".upCount"+replyId).text();
      upCount = parseInt(upCount);
      
      var downCount = $(".downCount"+replyId).val();
      
      console.log("up/down"+upCount+"/"+downCount);
      
      if(choice=="up"){
         var up = 1;
      }else if(choice == "down"){
         console.log("switch down");
         var up = -1;
      }
      var msg = {
            "email" : email,
            "replyId" : replyId,
            "up" : up,
            "upCount" : upCount,
            "downCount" : downCount
      };
      
      $.post("updateVote",msg,function(){
         $(".upVote"+replyId).toggleClass("voted");
         $(".downVote"+replyId).toggleClass("voted");
         if(up==1)
            $(".upCount"+replyId).text(upCount+1);
         else if(up==-1)
            $(".upCount"+replyId).text(upCount-1);
      },"text").fail(function(){
         alert("서버오류-문의 바랍니다.");
      })
      
   }
   
   /*
      DRAW MATCH
   */
   function drawOneMatch(match,index){
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
          $(".summoners:nth-child("+(i+2)+") .summoner:nth-child(2) .deal").css("width",bluePercent+"%");
          
          var redPercent = parseInt((participants[i+5]['totalDamageDealtToChampions']/maxDeal*100));
          $(".summoners:nth-child("+(i+2)+") .summoner:nth-child(5) .deal").css("width",redPercent+"%");
       }
       
       
       drawTeamStats(match['teamStatsVOList']);
   }
   
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
   
   function isExpired(){
      var expired = ${board.expired};
      var now = new Date();
      
      if(now.getTime()-${board.expired} > 0)
         return true;
      else
         return false;
   };
   
</script>
</body>
</html>