<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>

<script>
	$(function(){
		$("#joinForm").submit(function(){								
					
			// pwd
			if($("#passwd").val() !== $("#passwd2").val()){
				alert("비밀번호가 다릅니다.");
				$("#passwd").val("").focus();
				$("#passwd2").val(""); 
				return false;
			}else if ($("#passwd").val().length < 8) {
				alert("비밀번호는 8자 이상으로 설정해야 합니다.");
				$("#passwd").val("");
				$("#passwd").focus();
				return false;
			}else if($.trim($("#passwd").val()) !== $("#passwd").val() || $.trim($("#email").val()) !== $("#email").val() || $.trim($("#id").val()) !== $("#id").val()){
				alert("공백은 입력이 불가능합니다.");
				return false;
			}
			
			// id
			let id = $("input[name='id']").val();
			let idPattern = /(^[a-zA-Z].\w{5,11})/g;
			if(!idPattern.test(id)){
				alert("아이디는 첫글자는 영문자로, 두번째부터 영문자와 숫자로 6글자이상 12글자이하로 입력하십시오.");
				$("#id").val("");
				$("#id").focus();
				return false;
			}
			
			// email 
			let email = $("input[name='email']").val();
			let EMAIL_RULE = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
			if(!EMAIL_RULE.test(email)){
				alert("이메일형식이 올바르지 않습니다.");
				$("#email").val("");
				$("#email").focus();
				return false;
			}
			
			// name
			let name = $("input[name='name']").val();
			let NAME_RULE = /^[가-힣a-zA-Z]+$/;
			if(!NAME_RULE.test(name)){
				alert("잘못된 이름입니다.");
				$("#name").val("");
				$("#name").focus();
				return false;
			}
			

		})
		
		$("#id").keyup(function() {
			$.ajax({
				url : "/profile/check_id",
				type : "POST",
				data : {
					id : $("#id").val()
				},
				success : function(result) {
					if (result == 1) {
						$("#check_id").html("중복된 아이디가 있습니다.");
						$("#joinBtn").attr("disabled", "disabled");
					} else {
						$("#check_id").html("");
						$("#joinBtn").removeAttr("disabled");
					}
				},
			})
		});
		
		$("#email").keyup(function(){
			$.ajax({
				url : "/profile/check_email",
				type : "POST",
				data : {
					email : $("#email").val()
				},
				success : function(result) {
					if (result == 1) {
						$("#check_email").html("중복된 이메일이 있습니다.");
					} else {
						$("#check_email").html("");
					}
				},
			})
		});
	})
</script>

<title>회원가입</title>
</head>
<body>
	<div class="w3-content w3-container w3-margin-top" id="joinForm">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
				<h3>회원가입</h3>
			</div>
			<div>
				<form action="/profile/join_member" method="post">
					<p>
						<label>아이디</label> 
						<input class="w3-input" type="text" id="id" name="id" required placeholder="아이디는 첫글자는 영문, 두번째부터 영문자와 숫자로 6글자이상 12글자이하만 사용 가능" required> 
						<span id="check_id" class="w3-text-red"></span>
					</p>
					<p>
						<label>비밀번호</label> 
						<input class="w3-input" id="passwd" name="passwd" type="password" required placeholder="비밀번호는 8자 이상만 사용가능" required>
					</p>
					<p>
						<label>비밀번호 확인</label> 
						<input class="w3-input" id="passwd2" type="password" required>
					</p>
					<p>
						<label>이름</label> 
						<input class="w3-input" id="name" name="name" type="text" required>
					</p>
					<p>
						<label>핸드폰 번호</label> 
						<input class="w3-input" id="phone" name="phone" type="tel" required placeholder="-없이 입력" required>
					</p>
					<p>
						<label>이메일</label>
						<input type="text" id="email" name="email" class="w3-input" required>
						<span id="check_email" class="w3-text-red"></span>
					</p>
					<p class="w3-center">
						<button type="submit" id="joinBtn" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">Join</button>
						<button type="button" onclick="history.go(-1);" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">Cancel</button>
					</p>
				</form>
			</div>
		</div>
	</div>
</body>
</html>