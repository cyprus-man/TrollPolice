<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/signup.css" />
</head>
<%@ include file="/WEB-INF/views/header.jsp"%>
<body>

	<div id="wrap">

		<div id="wrapForm">
			<h1>회원 가입</h1>
			<div id="sideline">
				<form id="signupForm" method="POST">
				
					<input type="hidden" id="eId" name="encrypedID"> <input
						type="hidden" id="nameId" name="nameId"> <input
						type="hidden" id="tier" name="tier">



					<div id="checkForm">
						<div id="sumForm">
							<div id="summoner" style="background-image:url('${pageContext.request.contextPath}/resources/img/tier/UNRANKED.png')">
							</div>
						</div>

						<h4>이메일</h4>
						<div class="inputCon">
							<input type="text" id="email" name="email">
							<div class="textDiv">
								<span id="emailOverlap" style="color: red;">중복된 이메일입니다.</span> <span
									id="emailWrong" style="color: red;">이메일 형식이 아닙니다.</span> <span
									id="emailPass" style="color: green;">사용가능한 이메일 입니다.</span>
							</div>
						</div>
						<h4>소환사명</h4>
						<div class="inputCon">
							<input type="text" id="nickname" name="nickname">

							<div id=btnForm>
								<input type="button" value="소환사 검색" id="searchNickname">
							</div>

							<div class="textDiv">
								<span class="notifyCheck" style="color: red;">소환사
									검색을해주세요.</span> <span class="nicknameWrong" style="color: red;">존재하지않는
									소환사입니다.</span> <span class="nicknameOverlap" style="color: red;">이미
									등록된 소환사 입니다.</span> <span class="nicknamePass" style="color: green;">이용가능한
									소환사명입니다.</span>

							</div>


						</div>
						<h4>비밀번호</h4>
						<div class="inputCon">

							<input type="password" id="pw" name="pwd"><br>
							<div class="textDiv">
								<span class="pwWrong" style="color: red;">영문 대/소문자,숫자
									조합으로 8자리 이상</span> <span class="pwNotSame" style="color: red;">비밀번호가
									일치하지않습니다.</span> <span class="pwPass" style="color: green;">사용가능한
									비밀번호입니다.</span>
							</div>
						</div>

						<div class="inputCon">
							<h4>비밀번호 확인</h4>
							<input type="password" id="pwCheck">
							<div class="textDiv">
								<span class="pwWrong" style="color: red;">영문 대/소문자,숫자
									조합으로 8자리 이상</span> <span class="pwNotSame" style="color: red;">비밀번호가
									일치하지않습니다.</span><span class="pwPass" style="color: green;">사용가능한
									비밀번호입니다.</span>
							</div>
						</div>

						<p>
							트롤경찰청의 다양한 소식을 받아보시겠어요? &nbsp; <input type="checkbox" checked>
						</p>

					</div>
				</form>

				<div id="under">
					<div id="signText">
						가입하기를 클릭함으로써 트롤경찰청의&nbsp;<br /> &nbsp;&nbsp;이용약관,개인정보취급 방침에
						동의합니다. <input type="checkbox" checked>
					</div>
					<button onclick="submit();">가입하기</button>
				</div>
			</div>
		</div>
	</div>

</body>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	var regEmail = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,3}$/;
	var regPw = /^[A-Za-z0-9]{8,20}$/;

	var emailFlag = false;
	var pwFlag = false;
	var nicknameFlag = false;
	var isMem = false;
	var tier;

	$("#email").on("blur", function() {
		var email = $("#email").val();
		/*
			overlap #emailOverlap
			notEmail #emailWrong
		 */
		if (validEmail(email)) {
			isMember(email);
		} else {
			$("#emailWrong").css("display", "inline");
			$("#emailOverlap").css("display", "none");
			$("#emailPass").css("display", "none");
			emailFlag = false;
		}
	})

	$("#searchNickname").on("click", function() {
		
		$("#searchNickname").css("display", "none");
		searchNickname();
		return false;
	})

	$("#pw").on("blur", function() {
		var pw = $("#pw").val();
		var pw2 = $("#pwCheck").val();

		isValidPw(pw, pw2);
	})

	$("#pwCheck").on("blur", function() {
		var pw = $("#pw").val();
		var pw2 = $("#pwCheck").val();

		isValidPw(pw, pw2);
	})

	$("#nickname").on("focus", function() {
		nicknameFlag = false;
		return false;
	})

	$("#nickname").on("blur", function() {
		if (!nicknameFlag) {
			$(".nicknameWrong").css("display", "none");
			$(".nicknameOverlap").css("display", "none");
			$(".nicknamePass").css("display", "none");
			$(".notifyCheck").css("display", "inline");
		}
	})

	function validEmail(email) {
		if (regEmail.test(email)) {
			return true;
		} else {
			return false;
		}
	}

	function isMember(email) {

		$.post("emailValid", {
			"email" : email
		}, function(txt) {
			console.log(txt);
			if (txt == "overlap") {
				//is already summoner
				$("#emailWrong").css("display", "none");
				$("#emailOverlap").css("display", "inline");
				$("#emailPass").css("display", "none");
				emailFlag = false;
			} else if (txt == "pass") {
				emailFlag = true;
				$("#emailWrong").css("display", "none");
				$("#emailOverlap").css("display", "none");
				$("#emailPass").css("display", "inline");
			}

		}, "text").fail(function() {
			alert("연결에 실패했습니다.");
			emailFlag = false;
		});

	}

	function searchNickname() {
		var nickname = $("#nickname").val();
		//존재하지 않는 소환사의 경우 fileNotFound
		//json 으로 받아와서 가공 필요...
		//tier와 accountId nameId
		if(nickname==""){
			$("#searchNickname").css("display","block");
			alert("닉네임을 입력해주세요.");
			return ;
		}
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
						$(".nicknameOverlap").css("display", "inline");
						$(".notifyCheck").css("display", "none");
						$(".nicknamePass").css("display", "none");
						
						
						//error logic...QNA
						//이미 등록된 소환사의경우 팝업창을 띄우는 버튼 

						//reload to changed name

					} else if (valid == "notExists") {
						//wrong - > inline
						$(".nicknameWrong").css("display", "inline");
						$(".nicknameOverlap").css("display", "none");
						$(".nicknamePass").css("display", "none");
						$(".notifyCheck").css("display", "none");
						
						nicknameFlag = false;

					} else if (valid == "pass") {
						//css 로 tier 그림 띄우기

						//show tier Image id = summoner
						console.log("tier" + json['tier']);
						//티어 이미지 집어넣기 ...수정 필요
						$("#summoner").css(
								"background-image",
								"url('${pageContext.request.contextPath}/resources/img/tier/"
										+ json['tier'] + ".png')");
						$("#summoner").css("display", "block");
						$("#nameId").val(json['nameId']);
						$("#eId").val(json['eId']);
						$("#tier").val(json['tier']);
						$("#nickname").val(json['name']);
						//for UI
						$(".nicknameWrong").css("display", "none");
						$(".nicknameOverlap").css("display", "none");
						$(".nicknamePass").css("display", "inline");
						$(".notifyCheck").css("display", "none");

						nicknameFlag = true;
					}

				}, "json").fail(function() {
			alert("연결오류");
			location.reload();
		}).done(function() {
			$("#searchNickname").css("display", "block");

		});
	}

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

	function submit() {
		if (nicknameFlag == true && pwFlag == true && emailFlag == true) {
			$("#signupForm").css("cursor", "wait");
			$("#signupForm").attr("action", "signupAccess");
			$("#signupForm").submit();
		} else {
			alert("회원가입 정보를 확인하세요.");
		}
	}
</script>
</html>