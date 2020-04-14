<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/header.jsp"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style type="text/css">
* {
   margin: 0;
   padding: 0;
   color: black;
   font-size: 14px;
   text-decoration: none;
}

#wrap {
   min-width: 1050px;
   max-width: 1050px;
   margin: 0 auto;
   border: 1px solid white;
}

.wraper{
   height: 70px;
}

#boardDiv {
   height: 600px;
   min-width: 100%;
   max-width: 100%;
   color: rgb(51, 51, 51);
}
#boardDiv  div{
   font-size: 13px;
}
.pageDiv {
    margin: 0 auto;
    margin-top: 60px;
    text-align: center;
    width: 400px;
    height: 30px;
}
.category_tier{
   width:1100px;
   height:200px;
   margin-top:25px;
    border: 1px solid #e7e7e7;
}
.category_tier img{
    margin: 0 auto;
    margin-left: 28px;
    margin-top: 40px;
    width: 100px;
    height: 100px;
    border: 1px solid #e7e7e7;
}
.category_tier img:hover{
   background-color: #e7e7e7;
}

.tierText{
   text-align: center;
}

.category_lane{
   width: 450px;
   height: 70px;
   margin: 0 auto;
   margin-top:30px;
   margin-bottom: 20px;
}

.category_lane img{
   margin: 0 auto;
   width: 70px;
}

h6{
   width: 120px;
   font-size: 14px;
   font-weight: 600;
   float: left;
   margin-top:5px;
   color: #666;
   padding-bottom:5px;
}

.bronze{
   margin-left:20px;
}

.silver,.platinum,.diamond{
   margin-left: 14px;
}

.gold,.master,.grandmaster,.challenger{
   margin-left: 15px;
}

#trollSearch {
   width: 250px;
   height : 40px;
   float: right;
   margin-bottom: 20px;
}

#oneBoardDivHead{   
   width: 100%;
   margin: 0 auto;
   padding: 5px 0;
   border-bottom: 1px solid #e4e4e4;
   border-top: 1px solid #e4e4e4;
   height: 40px;
}

.oneBoardDiv{
   width: 100%;
   margin: 0 auto;
   padding: 5px 0;
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

.boardId {
   width: 40px;
}

.expiredText {
   width: 200px;
}
.title{
   width:240px;
}
.lane{
   width:30px;
}
.lane img{
   width:100%;
}
.nickname {
   width: 200px;
}

.writeDate {
   width: 200px;
}

.readcount {
   width: 45px;
}

.participants {
   width: 45px;
}

.clear {
   clear: both;
}

#topDiv {
   margin-top: 50px;
}
#topDiv div{
   width:150px;
   margin-left: 30px;
}
h5 {
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

#src_summoner {
   width: 169px;
   height: 38px;
   line-height: 38px;
   background-color: #fff;
   border: 1px solid #e4e4e4;
   padding: 0 20px 0 20px;
}

#btnSrc {
   margin-bottom: -10px;
}

#src_summoner:focus {
   outline: 1px solid #8ba3d1;
}

.underCount{
   margin: 0 20px;
   color:#888;
   font-family: "Tahoma";
   font-size: 20px;
}

.underCount:hover{
   color: #1c6ac3;
}

#headImg{
   float: left;
   margin-right:15px;
   margin-top:5px;
   width: 50px;
   height: 50px;
}

.next_btn,.next,.before,.previous_btn{
   border:1px solid #e4e4e4;
   width:17px;
   height: 17px;
   padding: 1px;
}

#moveBtn{
   margin:0 auto;
   margin-top:40px;
   margin-bottom:100px;
   width: 150px;
   height: 50px;
   float: right;
}

.btn_get_duo{
   width: 100px;
   height: 40px;
   margin: 0 auto;
   background-color: #2fc97a;
    font-size:18px;
    color: #fff;
}

#clear{
   clear: both;
}

#laneMargin{
   margin-top:5px;
   margin-left:1px;
}
</style>
</head>
<title>MatchingBoard</title>
<c:if test="${!empty message }">
   <script>alert("${message}");</script>
</c:if>
<c:if test="${empty loginUser }">
   <script>
      alert("로그인후 이용 가능합니다.");
      location.href="login";
   </script>
</c:if>
<body>
   <article>
      <div id="wrap">
            <div id="topDiv">
               <div class="wraper">
                  <img
                     src="${pageContext.request.contextPath}/resources/img/duo.png"
                     id="headImg">
                  <h5>듀오</h5>
               </div>
            </div>
            <div class="category_tier"> <a
                  href="matchingBoard?tier=BRONZE&page=1"><img id="BRONZE" class = "tier_line"
                  src="${pageContext.request.contextPath}/resources/img/tier/BRONZE.png"
                  width="100" alt="bronze"></a> <a
                  href="matchingBoard?tier=SILVER&page=1"><img id="SILVER" class = "tier_line"
                  src="${pageContext.request.contextPath}/resources/img/tier/SILVER.png"
                  width="100" alt="silver"></a> <a
                  href="matchingBoard?tier=GOLD&page=1"><img id="GOLD" class = "tier_line"
                  src="${pageContext.request.contextPath}/resources/img/tier/GOLD.png"
                  width="100" alt="gold"></a> <a
                  href="matchingBoard?tier=PLATINUM&page=1"><img id="PLATINUM" class = "tier_line"
                  src="${pageContext.request.contextPath}/resources/img/tier/PLATINUM.png"
                  width="100" alt="platinum"></a> <a
                  href="matchingBoard?tier=DIAMOND&page=1"><img id="DIAMOND" class = "tier_line"
                  src="${pageContext.request.contextPath}/resources/img/tier/DIAMOND.png"
                  width="100" alt="diamond"></a> <a
                  href="matchingBoard?tier=MASTER&page=1"><img id="MASTER" class = "tier_line"
                  src="${pageContext.request.contextPath}/resources/img/tier/MASTER.png"
                  width="100" alt="MASTER"></a> <a
                  href="matchingBoard?tier=GRANDMASTER&page=1"><img id="GRANDMASTER" class = "tier_line"
                  src="${pageContext.request.contextPath}/resources/img/tier/GRANDMASTER.png"
                  width="100" alt="GRANDMASTER"></a> <a
                  href="matchingBoard?tier=CHALLENGER&page=1"><img id="CHALLENGER" class = "tier_line"
                  src="${pageContext.request.contextPath}/resources/img/tier/CHALLENGER.png"
                  width="100" alt="CHALLENGER"></a>
                  
                  <div class = tierText>
                     <h6 class = "bronze">BRONZE</h6>
                     <h6 class = "silver">SILVER</h6>
                     <h6 class = "gold">GOLD</h6>
                     <h6 class = "platinum">PLATINUM</h6>
                     <h6 class = "diamond">DIAMOND</h6>
                     <h6 class = "master">MASTER</h6>
                     <h6 class= "grandmaster">GRANDMASTER</h6>
                     <h6 class = "challenger">CHALLENGER</h6>
                  </div>
            </div>
            <div class="category_lane">
               <a href="matchingBoard?tier=${tier}&page=1&lane=TOP"><img
                  id="TOP"
                  src="${pageContext.request.contextPath}/resources/img/ranked-positions/Position_${tier }_TOP.png"
                  width="70" alt="TOP"></a> <a
                  href="matchingBoard?tier=${tier}&page=1&lane=JUNGLE"><img
                  id="JUNGLE"
                  src="${pageContext.request.contextPath}/resources/img/ranked-positions/Position_${tier }_JUNGLE.png"
                  width="70" alt="JUNGLE"></a> <a
                  href="matchingBoard?tier=${tier}&page=1&lane=MIDDLE"><img
                  id="MID"
                  src="${pageContext.request.contextPath}/resources/img/ranked-positions/Position_${tier }_MIDDLE.png"
                  width="70" alt="MID"></a> <a
                  href="matchingBoard?tier=${tier}&page=1&lane=BOTTOM"><img
                  id="SUPPORT"
                  src="${pageContext.request.contextPath}/resources/img/ranked-positions/Position_${tier }_BOTTOM.png"
                  width="70" alt="BOTTOM"></a> <a
                  href="matchingBoard?tier=${tier}&page=1&lane=UTILITY"><img
                  id="BOT"
                  src="${pageContext.request.contextPath}/resources/img/ranked-positions/Position_${tier }_UTILITY.png"
                  width="70" alt="SUPPORT"></a>
                  <a
                  href="matchingBoard?tier=${tier}&page=1&lane=NONE"><img
                  id="BOT"
                  src="${pageContext.request.contextPath}/resources/img/ranked-positions/Position_${tier }_NONE.png"
                  width="70" alt="NONE"></a>
            </div>
            
               <div id="trollSearch">
                  <input type="text" id="src_summoner" name="src_summoner"
                     placeholder="소환사 명을 입력해주세요."> <input type="image"
                     src="${pageContext.request.contextPath}/resources/img/btn2.png"
                     value="button" id=btnSrc>
               </div>
               
            <div id = clear>
            </div>
               
            <div id="boardDiv">
               <div id="oneBoardDivHead">
                  <div class="boardId">번호</div>
                  <div class="expiredText">참가종료</div>
                  <div class="lane">라인</div>
                  <div class="nickname">소환사명</div>
                  <div class="title">제목</div>
                  <div class="writeDate">작성일</div>
                  <div class="readcount">조회수</div>
                  <div class="participants">참가수</div>
               </div>
               <c:forEach var="board" items="${boards}">
                  <div class="oneBoardDiv"
                     onclick="matchingDetail(${board.matchingBoardId})">
                     <div class="boardId">${board.matchingBoardId}</div>
                     <div class="expiredText" style="color: red;">
                     </div>
                     <input class='expired' type="hidden" value="${board.expired}">
                     <div class="lane">
                        <img id ="laneMargin" src="${pageContext.request.contextPath}/resources/img/ranked-positions/Position_${tier }_${board.lane }.png">
                     </div>
                     <div class="nickname">${board.nickname}</div>
                     <div class="title">${board.title}</div>
                     <div class="writeDate">${board.writeDate}</div>
                     <div class="readcount">${board.readcount}</div>
                     <div class="participants">${board.participants}</div>
                  </div>
               </c:forEach>
            </div>
            <div class="clear"></div>
            
            <div id = "moveBtn">
               <button class="btn btn_get_duo">듀오 구해요</button>
            </div>
            
            <div class="pageDiv">
               <a href="matchingBoard?page=1&tier=${tier}">
                  <input type="image" src="${pageContext.request.contextPath}/resources/img/left.png" value="button" class="previous_btn">
               </a>

               <!-- 페이지가 2번째 페이지 이후부터 이전 띄우기 -->
               <c:if test="${pageStart>5}">
                  <a
                     href="matchingBoard?page=${pageStart-1}&beforeNext=before&tier=${tier}&lane=${lane}">
                     <input type="image" src="${pageContext.request.contextPath}/resources/img/prev.png" value="button" class="before">
                  </a>
               </c:if>

               <!-- 페이지 뿌리는 부분 -->
               <c:forEach begin="${pageStart }" var="page" end="${pageEnd }">
                  <a href="matchingBoard?page=${page}&tier=${tier}&lane=${lane}" class='underCount'>${page}</a>
               </c:forEach>

               <c:if test="${pageEnd < lastPage}">
                  <a
                     href="matchingBoard?page=${pageEnd+1}&beforeNext=next&tier=${tier}&lane=${lane}">
                     <input type="image" src="${pageContext.request.contextPath}/resources/img/next.png" value="button" class="next">
                  </a>
               </c:if>
               <a href="matchingBoard?page=${lastPage}&tier=${tier}&lane=${lane}">
                  <input type="image" src="${pageContext.request.contextPath}/resources/img/right.png" value="button" class="next_btn">
               </a>
            </div>
            
            <!-- 검증 이후 페이지 이동 -->

         </div>
   </article>
</body>
<%-- <%@ include file="/WEB-INF/views/footer.jsp"%>    --%>
<script type="text/javascript">
var ajaxFlag = false;
var timeCount = setInterval(drawTimer, 1000);


   $(document).ready(function(){
      drawTimer();
      
      return false;
   });
$(".btn_get_duo").on("click",function(){
   if(ajaxFlag){
      alert("이미 조회중입니다.");
      return false;
   }
   ajaxFlag = true;
   
   $.post("validDuo",{},function(text){
      console.log(text);
      
      if(text=="FAIL"){
         alert("서버 오류입니다.");
         location.reload();
         return false;
      }
      if(text=="PASS"){
         
         location.href="matchingWrite";
      }else if(text=="EXCEED"){
         alert("이미 듀오의 최대치를 초과했습니다.");
      }
      ajaxFlag = false;
   },"text");
});

//매칭 검색기능 
$(document).on("click","#btnSrc",function(){
   var  nickname = $("#src_summoner").val();
   console.log(nickname);
   if(nickname.length>0){
      location.href="searchMatchingNickname?nickname="+nickname+"&page=1";
   }
   else {
      alert("닉네임을 입력해주세요 .");
   }
}).on("keypress","#src_summoner",function(e){
   if(e.which==13){
      $("#btnSrc").click();
      return false;
   }
});

function matchingDetail(matchingBoardId){
   console.log(matchingBoardId);
   location.href = "matchingDetail?id="+matchingBoardId;
   
}
function drawTimer(){
      var now = new Date().getTime();
      var len = ${fn:length(boards)};

      
      for(var i=2; i<=len+1; i++){
         var distance = $(".oneBoardDiv:nth-child("+i+") .expired").val() - now;
         
         
         if (distance < 0) {
            $(".oneBoardDiv:nth-child("+i+") .expiredText").text("기간만료");
            
         }
         else {
            var days    = Math.floor((distance / (1000 * 60 * 60 * 24)));
            distance   -= days*(1000 * 60 * 60 * 24);
            var hours   = Math.floor(distance / (1000 * 60 * 60));
            distance   -= hours*(1000*60*60);
            var minutes = Math.floor(distance / (1000 * 60));
            distance   -= minutes*(1000*60);
            var seconds = Math.floor(distance/1000);
            
            $(".oneBoardDiv:nth-child("+i+") .expiredText").text(days+" 일 "+hours+" 시간 "+minutes+" 분 "+seconds+" 초 ");
         }         
      }
}

$("#BRONZE").hover(function() {
   $(".bronze").css("color","black");
   $(".silver").css("color","gray");
   $(".gold").css("color","gray");
   $(".platinum").css("color","gray");
   $(".diamond").css("color","gray");
   $(".master").css("color","gray");
   $(".grandmaster").css("color","gray");
   $(".challenger").css("color","gray");
   
   $(".bronze").css("border-bottom","6px solid black");
   $(".silver").css("border","none");
   $(".gold").css("border","none");
   $(".platinum").css("border","none");
   $(".diamond").css("border","none");
   $(".master").css("border","none");
   $(".grandmaster").css("border","none");
   $(".challenger").css("border","none");
})

$("#SILVER").hover(function() {
   $(".bronze").css("color","gray");
   $(".silver").css("color","black");
   $(".gold").css("color","gray");
   $(".platinum").css("color","gray");
   $(".diamond").css("color","gray");
   $(".master").css("color","gray");
   $(".grandmaster").css("color","gray");
   $(".challenger").css("color","gray");
   
   $(".bronze").css("border","none");
   $(".silver").css("border-bottom","6px solid black");
   $(".gold").css("border","none");
   $(".platinum").css("border","none");
   $(".diamond").css("border","none");
   $(".master").css("border","none");
   $(".grandmaster").css("border","none");
   $(".challenger").css("border","none");
})

$("#GOLD").hover(function() {
   $(".bronze").css("color","gray");
   $(".silver").css("color","gray");
   $(".gold").css("color","black");
   $(".platinum").css("color","gray");
   $(".diamond").css("color","gray");
   $(".master").css("color","gray");
   $(".grandmaster").css("color","gray");
   $(".challenger").css("color","gray");
   
   $(".bronze").css("border","none");
   $(".silver").css("border","none");
   $(".gold").css("border-bottom","6px solid black");
   $(".platinum").css("border","none");
   $(".diamond").css("border","none");
   $(".master").css("border","none");
   $(".grandmaster").css("border","none");
   $(".challenger").css("border","none");
})

$("#PLATINUM").hover(function() {
   $(".bronze").css("color","gray");
   $(".silver").css("color","gray");
   $(".gold").css("color","gray");
   $(".platinum").css("color","black");
   $(".diamond").css("color","gray");
   $(".master").css("color","gray");
   $(".grandmaster").css("color","gray");
   $(".challenger").css("color","gray");
   
   $(".bronze").css("border","none");
   $(".silver").css("border","none");
   $(".gold").css("border","none");
   $(".platinum").css("border-bottom","6px solid black");
   $(".diamond").css("border","none");
   $(".master").css("border","none");
   $(".grandmaster").css("border","none");
   $(".challenger").css("border","none");
})

$("#DIAMOND").hover(function() {
   $(".bronze").css("color","gray");
   $(".silver").css("color","gray");
   $(".gold").css("color","gray");
   $(".platinum").css("color","gray");
   $(".diamond").css("color","black");
   $(".master").css("color","gray");
   $(".grandmaster").css("color","gray");
   $(".challenger").css("color","gray");
   
   $(".bronze").css("border","none");
   $(".silver").css("border","none");
   $(".gold").css("border","none");
   $(".platinum").css("border","none");
   $(".diamond").css("border-bottom","6px solid black");
   $(".master").css("border","none");
   $(".grandmaster").css("border","none");
   $(".challenger").css("border","none");
})

$("#MASTER").hover(function() {
   $(".bronze").css("color","gray");
   $(".silver").css("color","gray");
   $(".gold").css("color","gray");
   $(".platinum").css("color","gray");
   $(".diamond").css("color","gray");
   $(".master").css("color","black");
   $(".grandmaster").css("color","gray");
   $(".challenger").css("color","gray");
   
   $(".bronze").css("border","none");
   $(".silver").css("border","none");
   $(".gold").css("border","none");
   $(".platinum").css("border","none");
   $(".diamond").css("border","none");
   $(".master").css("border-bottom","6px solid black");
   $(".grandmaster").css("border","none");
   $(".challenger").css("border","none");
})

$("#GRANDMASTER").hover(function() {
   $(".bronze").css("color","gray");
   $(".silver").css("color","gray");
   $(".gold").css("color","gray");
   $(".platinum").css("color","gray");
   $(".diamond").css("color","gray");
   $(".master").css("color","gray");
   $(".grandmaster").css("color","black");
   $(".challenger").css("color","gray");
   
   $(".bronze").css("border","none");
   $(".silver").css("border","none");
   $(".gold").css("border","none");
   $(".platinum").css("border","none");
   $(".diamond").css("border","none");
   $(".master").css("border","none");
   $(".grandmaster").css("border-bottom","6px solid black");
   $(".challenger").css("border","none");
})

$("#CHALLENGER").hover(function() {
   $(".bronze").css("color","gray");
   $(".silver").css("color","gray");
   $(".gold").css("color","gray");
   $(".platinum").css("color","gray");
   $(".diamond").css("color","gray");
   $(".master").css("color","gray");
   $(".grandmaster").css("color","gray");
   $(".challenger").css("color","black");
   
   $(".bronze").css("border","none");
   $(".silver").css("border","none");
   $(".gold").css("border","none");
   $(".platinum").css("border","none");
   $(".diamond").css("border","none");
   $(".master").css("border","none");
   $(".grandmaster").css("border","none");
   $(".challenger").css("border-bottom","6px solid black");
})


</script>


</html>