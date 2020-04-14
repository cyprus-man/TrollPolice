<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계정 설정</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/information.css" />
</head>
<%@ include file="/WEB-INF/views/header.jsp"%>
<body>
	<c:if test="${empty loginUser}">
		<script>
			location.href="login";
		</script>	
	</c:if> 
	<div id="wrap">
		<h1>계정 설정 </h1>
		
		<div id="inputLine">
		
			<div id="viewTier">
				<img src="${pageContext.request.contextPath}/resources/img/tier/${loginUser.tier}.png">
			</div>

			<form id="infoNickForm" method="POST">
				
				<input type="hidden" id="eId" name="encrypedID"> 
				<input type="hidden" id="nameId" name="nameId">
				<input type="hidden" id="tier" name="tier">
				
				<div id="emailDiv">
					<h4>이메일</h4>
					<div id="touchEmail">※변경할 수 없습니다.</div>
					<input type="text" id="email" value="${loginUser.email}" readonly>

					<p>소환사 명</p>
					<input type="text" id="nickName" value="${loginUser.nickname}" placeholder="변경할 소환사 명을 입력해주세요">
					<input type="button" id="renew" value="갱신하기"> <input
						type="button" id="searchNickname" value="검색하기">
				</div>
				<div id="nickDiv">
					<span class="notifyCheck" style="color: red;">소환사 검색을해주세요.</span> <span
						class="nicknameWrong" style="color: red;">존재하지않는 소환사입니다.</span> <span
						class="nicknameOverlap" style="color: red;">이미 등록된 소환사 입니다.</span>
					<span class="nicknamePass" style="color: green;">이용가능한
						소환사명입니다.</span>
				</div>
				<input type="button" id="saveImpo" value="저장하기" >
			</form>
		</div>

		<div id="inputLine">
			<p>비밀번호</p>

			<div id="passDiv">
				<input type="password" id="nowPw" placeholder="현재 비밀번호"> <input
					type="password" id="newPw" placeholder="새 비밀번호"> <input
					type="password" id="pwCheck" placeholder="새 비밀번호 확인">
				<div id="passSpanDiv">
					<span class="pwWrong" style="color: red;">비밀번호는 8자 이상 20자
						이하(문자 + 숫자 조합)이어야 합니다.</span> <span class="pwNotSame" style="color: red;">비밀번호가
						일치하지않습니다.</span> <span class="pwPass" style="color: green;">사용가능한
						비밀번호입니다.</span>
				</div>
				<input type="button" id="saveImpo" value="저장하기" class="savePw">
			</div>
		</div>
		<div id="inputLine">
			<p>탈퇴</p>
			<div id="outText">
				<h2>탈퇴 안내 사항</h2>
				<br />
				<h3>
					트롤폴리스에 만족하지 못하셨나요? 탈퇴하기 전에 먼저 개선 요청을 해보시는건 어떨까요?<br> 그래도
					탈퇴하시겠다면 탈퇴 전에 아래 유의사항을 꼭 읽어주세요!<br> &&& 감사합니다 &&&<br> <br>
					1.회원이 작성한 콘텐츠(동영상,게시물,댓글 등)는 자동적으로 삭제되지 않으며,만일 삭제를 원<br> 하시면
					탈퇴 이전에 삭제가 필요합니다.<br> 2.탈퇴 후 동일한 메일로 재가입이 가능하지만,탈퇴 한 계정과 연동되지
					않습니다.<br> 3.탈퇴 후 연동된 소셜 계정 정보도 사라지며,소셜 로그인으로 기존 계정 이용이 불가능합니다.<br>
					4.현재 비밀번호를 입력하고 탈퇴하기를 누르시면 위 내용에 동의하는 것으로 간주합니다.<br>
				</h3>
			</div>
			<input type="password" id="outPw" placeholder="현재 비밀번호"> <br />
			<div id="byeSpan">
				<span class="byePw" style="color: red;">비밀번호를 확인하세요.</span>
			</div>
			<input type="button" id="byeBtn" value="탈퇴하기">
		</div>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
	var regPw = /^[A-Za-z0-9]{8,20}$/;
	var nicknameFlag = false;
	var pwFlag = false;
	var tier;
	
	$("#nickName").on("blur", function() {
		var nickName = $("#nickName").val();
		console.log("nickBlur");
		if (true) {
			$(".notifyCheck").css("display", "inline");
			$(".nicknameWrong").css("display", "none");
			$(".nicknameOverlap").css("display", "none");
			$(".nicknamePass").css("display", "none");
		}
		return false;
	});

	// 비밀번호 변경 버튼
	$(".savePw").on("click", function() {
		console.log("버튼클릭");
		if (pwFlag == true) {
			updatePw();
		} else {
			alert("비밀번호를 확인해주세요.")
			$("newPw").focus();
		}
	})

	// 계정탈퇴 버튼
	$("#byeBtn").on("click", function() {
		console.log("탈퇴클릭");
		deleteMember();
	})

	// 닉네임 검색하기 버튼
	$("#searchNickname").on("click", function() {
		$("#searchNickname").css("display", "none");
		console.log("검색하기")
		searchNickname();
	})
	
	// 닉네임 변경후 저장 버튼
	$("#saveImpo").on("click", function(){
		console.log("닉네임 변경 버튼");
		updateNick();
	})
	
	$("#renew").on("click",function(){
		renewNick();
	});
	
	//비밀번호 변경 제이쿼리
	function isValidPw(pw, pw2) {
		if (regPw.test(pw)) {
			console.log("이용가능한 비밀번호다.");
			//pwWrong
			//pwNotsame
			$(".pwWrong").css("display", "none");
			$(".pwNotSame").css("display", "none");
			$(".pwPass").css("display", "none");
			if (pw == pw2) {
				console.log("같은 비밀번호입니다.");
				$(".pwPass").css("display", "inline");
				$(".pwWrong").css("display", "none");
				$(".pwNotSame").css("display", "none");
				pwFlag = true;
			} else {
				$(".pwPass").css("display", "none");
				$(".pwWrong").css("display", "none");
				$(".pwNotSame").css("display", "inline");
				pwFlag = false;
			}
		} else {
			$(".pwPass").css("display", "none");
			$(".pwWrong").css("display", "inline");
			$(".pwNotSame").css("display", "none");
			pwFlag = false;
		}
	}

	$("#newPw").on("blur", function() {
		var pw = $("#newPw").val();
		var pw2 = $("#pwCheck").val();

		isValidPw(pw, pw2);
	})

	$("#pwCheck").on("blur", function() {
		var pw = $("#newPw").val();
		var pw2 = $("#pwCheck").val();

		isValidPw(pw, pw2);
	})
	
	// 닉네임 검색 
	function searchNickname() {
		var nickname = $("#nickName").val();
		$.post(
				"searchNickname",
				{
					"nickname" : nickname
				},
				function(json) {

					var valid = json["valid"];
					console.log(json);
					console.log(valid);

					if (valid == "overlap") {
						console.log("이미 등록된 소환사입니다.");
						nicknameFlag = false;
						$(".nicknameWrong").css("display", "none");
						$(".nicknameOverlap").css("display", "inline");				// 이미 등록된 소환사
						$(".notifyCheck").css("display", "none");
						$(".nicknamePass").css("display", "none");

					} else if (valid == "notExists") {
						//wrong - > inline
						$(".nicknameWrong").css("display", "inline");				// 없는 소환사 이름
						$(".nicknameOverlap").css("display", "none");
						$(".nicknamePass").css("display", "none");
						$(".notifyCheck").css("display", "none");
						nicknameFlag = false;
					} else if (valid == "pass") {

						console.log("tier" + json['tier']);
						
						$("#viewTier").empty();
						$("#viewTier").append("<img src=${pageContext.request.contextPath}/resources/img/tier/"+json['tier']+".png>")
						$("#nameId").val(json['nameId']);
						$(".nicknameWrong").css("display", "none");
						$(".nicknameOverlap").css("display", "none");
						$("#nickName").val(json['name']);
						$(".nicknamePass").css("display", "inline");			// 사용가능한 소환사
						$(".notifyCheck").css("display", "none");
						nicknameFlag = true;
					}
				}, "json").fail(function() {
			alert("연결오류");
			location.reload();
		}).done(function() {
			$("#searchNickname").css("display", "inline");
		});
	}

	// 비밀번호 수정하기
	function updatePw() {

		var nowPw = $("#nowPw").val();
		var newPw = $("#newPw").val();

		var msg = {
			"nowPw" : nowPw,
			"newPw" : newPw
		};
		if(pwFlag){
			$.post("updatePw", msg, function(text) {
				//text == "wrong"
				//text == "pass"
				console.log(text);
				if (text == "wrong") {
					alert("비밀번호를 확인해주세요.");
				} else if (text == "pass") {
					alert("변경되었습니다.");
					$("#nowPw").val("");
					$("#newPw").val("");
					$("#pwCheck").val("");
					location.href = "login";
				}
			}, "text");
		}
	}

	//계정 탈퇴하기
	function deleteMember() {
		var outPw = $("#outPw").val();
		var outMsg = {
			"outPw" : outPw
		};
		$.post("deleteMember", outMsg, function(text) {
			console.log("post")
			if (text == "pass") {
				alert("정상적으로 탈퇴되었습니다.");
				location.href = "main";
			} else if (text == "wrong") {
				$(".byePw").css("display", "inline");
				$("#outPw").focus();
			} else if (text == "ERROR") {
				location.href = "login";
			}
		}, "text");
	}
	
	function updateNick() {
		var nickName = $("#nickName").val();
		var viewTier = $("#viewTier").val();
		var Nmsg = {
				"nickName": nickName,
				"viewTier": tier
		};
		
		if(nicknameFlag){
			$.post("updateNick", Nmsg, function(text){
				console.log("닉네임변경 가즈아")
				if(text == "pass"){
					alert("정상적으로 변경되었습니다.");
					location.href = "main";
				} else if (text == "wrong"){
					alert("변경실패");
				} else if (text == "ERROR"){
					location.href = "login";
				}
			}, "text");
		}
	}
	
	function renewNick(){
		$.post("renewMember",{},function(){
			location.reload();
			alert("갱신되었습니다.");
			return false;
		},"text");
	}
</script>
</html>