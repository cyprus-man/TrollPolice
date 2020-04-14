<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<link href="${pageContext.request.contextPath}/resources/img/siren.png"
   rel="shortcut icon" type="image/x-icon">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
* {
   margin: 0;
   padding: 0;
}
#wrap{
   min-height:750px;
   height:750px;   
}
#menu {
   height: 70px;
   width: 1400px;
   border-bottom: 1px solid rgba(206, 206, 206, 0.959);
   margin: 0 auto;
}

input:focus {
   outline: none;
}

#Logo {
   width: 150px;
   height: 50px;
   float: left;
   margin-top: 15px;
}
#Logo  img{
	width:100px;
	
	margin: 0 auto;
    display: block;
}
.leftMenu {
   list-style: none;
}

.leftMenu li {
   padding: 0;
   float: left;
   margin-right: 50px;
   margin-top: 5px;
   line-height: 60px;
}

.rightMenu {
   line-height: 70px;
   margin-right:20px;
   width: 400px;
   height: 70px;
   float: right;
}

.rightMenu a {
   margin-right: 20px;
   color: #4a4a4a;
   text-decoration: none;
   font-size: 14px;
   font-weight: bold;
}

.leftMenu a {
   color: #4a4a4a;
   text-decoration: none;
   font-size: 16px;
   font-weight: bold;
}

.leftMenu li a:hover, .rightMenu a:hover {
   color: #2fc97a;
}

.notice {
   float: left;
   margin-top: 10px;
   margin-right : 15px;
   position:relative;
}

.notice div {
   color: white;
   width: 20px;
   height: 20px;
   line-height: 20px;
   font-weight: 800;
   text-align: center;
   background-color: red;
   border-radius: 10px;
   font-weight: 800;
   position: absolute;
   top: -5%;
   right: 3%;
}

#noticeBox {
   border: 4px solid black;
   border-radius: 20px;
   width: 400px;
   max-height: 300px;
   padding: 20px;
   display: none;
   z-index:1;
   position: absolute;
   left: 0px;
   top: 0px;
   background-color: white;
   text-align: center;
   display: none;
}
#noticeBox table {
   margin:0 auto;
}
#noticeBox a:hover {
   border-bottom: 4px solid black;
}

#notice_close {
   position: relative;
   float: right;
}

#noticeBox h5,#noticeBox h6 {
   font-size: 18px;
   width:100%;
   text-align: center;
   margin-bottom: 10px;
}

.noticeScroll{
	overflow-y: scroll;
	max-height: 200px;
}
#count {
   border: 1px solid red;
}

hr {
   margin-top: 10px;
}

/* !!신고하기 양식!!*/

#service_form {
   width: 500px;
   height: 400px;
   border:1px solid rgba(206, 206, 206, 0.959);
   position:fixed;
   background-color:white;
   z-index:2;
   /*center*/
   top:50%;
   left:50%;
   margin-left:-250px;
   margin-top:-200px;
   display:none;
}

#header {
   width: 480px;
   height: 40px;
   padding-top: 15px;
}

#header>h1 {
   font-size: 24px;
   font-weight: 400;
   color:#4a4a4a;
   padding-left: 20px;
}

.put_custom_wrap1,
.put_custom_wrap2,
.put_custom_wrap3,
.put_custom_wrap4,
.put_custom_wrap5 {
   margin-top: 30px;
   margin-bottom: 30px;
   margin-left:20px;
   color:#4a4a4a;
}

.put_custom_wrap1 input[type=radio]::-ms-check,
.put_custom_wrap2 input[type=radio]::-ms-check,
.put_custom_wrap3 input[type=radio]::-ms-check,
.put_custom_wrap4 input[type=radio]::-ms-check,
.put_custom_wrap5 input[type=radio]::-ms-check {
   border: solid 1px #fff;
}

.put_custom_wrap1 input[type=radio],
.put_custom_wrap2 input[type=radio],
.put_custom_wrap3 input[type=radio],
.put_custom_wrap4 input[type=radio],
.put_custom_wrap5 input[type=radio] {
   -webkit-appearance: none;
   position: absolute;
   top: 2px;
   left: -1px;
   width: 22px;
   height: 22px;
   vertical-align: middle;
}

.put_custom_wrap1 input[type=radio]+label,
.put_custom_wrap2 input[type=radio]+label,
.put_custom_wrap3 input[type=radio]+label,
.put_custom_wrap4 input[type=radio]+label,
.put_custom_wrap5 input[type=radio]+label {
   display: inline-block;
   cursor: pointer;
   position: relative;
   padding-left: 35px;
   margin-right: 15px;
   font-size: 16px;
}

.put_custom_wrap1 input[type=radio]+label:before,
.put_custom_wrap2 input[type=radio]+label:before,
.put_custom_wrap3 input[type=radio]+label:before,
.put_custom_wrap4 input[type=radio]+label:before,
.put_custom_wrap5 input[type=radio]+label:before {
   content: "";
   display: inline-block;
   width: 20px;
   height: 20px;
   margin-right: 10px;
   position: absolute;
   top: 0;
   left: 0;
   bottom: 1px;
   background-color: #4a4a4a;
   /* border-radius:2px; */
   box-shadow: inset 0px 1px 1px 0px rgba(0, 0, 0, .3), 0px 1px 0px 0px
      rgba(255, 255, 255, .8);
}

.put_custom_wrap1 input[type=radio]:checked+label:before,
.put_custom_wrap2 input[type=radio]:checked+label:before,
.put_custom_wrap3 input[type=radio]:checked+label:before,
.put_custom_wrap4 input[type=radio]:checked+label:before,
.put_custom_wrap5 input[type=radio]:checked+label:before {
   content: "\2713";
   text-shadow: 1px 1px 1px rgba(0, 0, 0, .2);
   font-size: 18px;
   font-weight: 800;
   color: #fff;
   background: green;
   text-align: center;
   line-height: 18px;
}


#buttonForm{
   width:500px;
   height: 40px;
   border-top:1px solid rgba(206, 206, 206, 0.959);
   padding-top:10px;
}

.service_btn{
   width: 70px;
   height: 40px;
   float: right;
   margin-right:10px;
   cursor: pointer;
   background-color: white;
   border:0;
   outline: 0;
}

#service_apply{
   color:#5e84f1;
}

#service_cancel{
   color:#4a4a4a;
}
#report_values{
   display:none;
}
/*-- 신고 양식END --*/
</style>

</head>

<body>
   <header>

      <div id="menu">

         <div id="Logo">

            <a href="main"><img
               src="${pageContext.request.contextPath}/resources/img/trollLogo.png"></a>

         </div>

         <ul class="leftMenu">

            <li><a href="discussionBoard">토론</a></li>
            <li><a href="freeBoardList">자유</a></li>
            <li><a href="ranking">랭킹</a></li>
            <c:if test="${!empty loginUser }">
               <c:if test='${loginUser.validation!="Y" }'>
                  <script>
                     location.href = "emailValidation";
                  </script>
               </c:if>
               <li><a href="report">신고하기</a></li>
               <li><a href="matchingBoard">듀오</a></li>
               <li><a href="liveChat">LIVE DUO</a></li>
               <li><a href="reportList">신고목록</a></li>
               <li><a href="multiSearch">전적 검색</a></li>
               <!-- 20200326 -->
               <c:if test='${loginUser.admin_ == "Y" }'> 
                  <li><a href="serviceCenter">고객관리</a></li>
               </c:if>
               <!--  -->
            </c:if>

         </ul>

         <div class="rightMenu">

            <c:if test="${!empty loginUser}">

               <c:if test="${not empty noticeList}">
               
                  <div class="notice">

                     <img
                        src="${pageContext.request.contextPath}/resources/img/black.png">

                     <div id=count>${noticeList.size()}</div>

                  </div>

               </c:if>

               <c:if test="${empty noticeList }">

                  <div class="notice">

                     <img
                        src="${pageContext.request.contextPath}/resources/img/white.png">

                  </div>

               </c:if>
            </c:if>
            <c:choose>
               <c:when test="${empty loginUser}">

                  <a href="login">로그인</a>

                  <a href="signup">회원가입</a>

               </c:when>

               <c:otherwise>
                  <span>${loginUser.nickname } 님</span>
                  <a href="information">나의 정보</a>

                  <a href="logout">로그아웃</a>

               </c:otherwise>
            </c:choose>
         </div>
      </div>
   </header>
   <c:if test="${not empty noticeList }">
		<div id="noticeBox">
			<div id="notice_close">
				<img class="notice_close"
					src="${pageContext.request.contextPath}/resources/img/x.png">
			</div>
			<div>
				<div><span
					style="font-size: 20px; color: #2fc97a; font-weight: bolder;">${loginUser.nickname}</span>님의
					쪽지함<br> <br></div>
			</div>
			<h5>새로운 알림이 있습니다.</h5>
			<div class="noticeScroll">
			<table>
			<c:forEach items="${noticeList}" var="notice">
				<c:if test="${notice.type eq 'disc'}">
					<tr>
						<td><a style="color: black;"
							href="discDetail?discBoardId=${notice.targetId}"> <span
								style="font-size: 20px; color: red; font-weight: bold;">${notice.sender}</span>님이
								당신을 신고하셨습니다.
						</a></td>
					</tr>
				</c:if>
				<c:if test="${notice.type eq 'matching'}">
					<tr>
						<td><a style="color: black;"
							href="liveChat"> <span
								style="font-size: 20px; color: red; font-weight: bold;">${notice.sender}</span>님이
								당신을 선택하셨습니다.
						</a></td>
					</tr>
				</c:if>
				<c:if test="${notice.type eq 'reply'}">
					<tr>
						<td><a style="color: black;"
							href="matchingDetail?id=${notice.targetId}"> <span
								style="font-size: 20px; color: red; font-weight: bold;">${notice.sender}</span>님이
								듀오에 참여하셨습니다.
						</a></td>
					</tr>
				</c:if>
			</c:forEach>
			</table>
			</div>
			<hr>
		</div>
   </c:if>
   
   
   <!--  신고하기 양식   -->
   <div id="service_form">
      <div id="report_values">
         <input type="hidden" name="targetId" id="service_target">
         <input type="hidden" name="type" id="service_type">
      </div>
      <div id="header">
      
         <h1>신고 하기</h1>
         
      </div>
         <div class="put_custom_wrap1">
            <input type="radio" name="checkbox1" id="ckBox1" value=0> <label for="ckBox1">원치 않는 상업성 콘텐츠 또는 스팸</label>
         </div>

         <div class="put_custom_wrap2">
            <input type="radio" name="checkbox1" id="ckBox2" value=1> <label for="ckBox2">포르노 또는 음란물</label>
         </div>

         <div class="put_custom_wrap3">
            <input type="radio" name="checkbox1" id="ckBox3" value=2> <label for="ckBox3">아동 학대</label>
         </div>

         <div class="put_custom_wrap4">
            <input type="radio" name="checkbox1" id="ckBox4" value=3> <label for="ckBox4">증오심 표현 또는 노골적인 폭력</label>
         </div>

         <div class="put_custom_wrap5">
            <input type="radio" name="checkbox1" id="ckBox5" value=4> <label for="ckBox5">희롱 또는 괴롭힘</label>
         </div>
      
      <div id="buttonForm">
         <input type="button"  id="service_apply" class="service_btn" value="신고">
         <input type="button" id="service_cancel" class="service_btn"  value="취소" onclick="hideServiceForm()">
      </div>
   </div>
</body>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	getNotice();
})
//bubbling STOP
   $(".notice").mouseover(function(e) {

      var x = e.pageX;

      var y = e.pageY;

      if (!$("#noticeBox").hasClass("hover")) {

         $('#noticeBox').css({

            top : e.pageY + 40,

            left : e.pageX - 200,

            display : "block"

         });

      }

      $("#noticeBox").addClass("hover");

   });

   $(".notice_close").on("click", function() {

      $("#noticeBox").css("display", "none");

      $("#noticeBox").removeClass("hover");

   })
   
   /* SERVICE FORM */
   
var serviceFlag = false;



$("#service_apply").on("click",function(){
   var value = $("input[name='checkbox1']:checked").val();
   var type = $("#service_type").val();
   var targetId = $("#service_target").val();
   
   if(value == null){
      //0:원치않은 내용물, 1:음란물, 2:아동학대, 3:증오, 4:희롱
      alert("신고 내용을 정해주세요 .");
   }else{
      var send = {
         "value" : value,
         "type" : type,
         "targetId" : targetId
      };
      
      console.log(send);
      
      $.post("serviceApply",send,function(text){
         if(text=="fail"){
            alert("실패했습니다.");
            location.reload();
         }else {
            alert("신고되었습니다.");
            hideServiceForm();
         }
      },"text");
      
   }
   return false;
});
function openService(type,targetId){
   serviceFlag = true;
   $("#service_target").val(targetId);
   $("#service_type").val(type);
   $("#service_form").fadeIn();
}
function hideServiceForm(){
   $("#service_form").fadeOut();
}
function getNotice(){
	$.post("getNotice",{},function(){
		
	},"text");
}
</script>
</html>