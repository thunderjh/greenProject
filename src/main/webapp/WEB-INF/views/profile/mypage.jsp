<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/resources/include/dist/js/bootstrap.min.js"></script>
<script src="/resources/include/dist/assets/js/docs.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<script type="text/javascript">
	$(function(){
		if(${msg ne null}){
			alert('${msg}');
		};
		
		if($("#passwdForm").submit(function(){
			if($("#passwd").val() !== $("#passwd2").val()){
				alert("비밀번호가 다릅니다.");
				$("#passwd").val("").focus();
				$("#passwd2").val("");
				return false;
			}else if ($("#passwd").val().length < 8) {
				alert("비밀번호는 8자 이상으로 설정해야 합니다.");
				$("#passwd").val("").focus();
				return false;
			}else if($.trim($("#passwd").val()) !== $("#passwd").val()){
				alert("공백은 입력이 불가능합니다.");
				return false;
			}
		}));
		
		if($("#wdForm").submit(function() {
			if(!confirm("정말 탈퇴하겠습니까?")) {
				return false;
			}
		}));
	})
</script>
</head>


<body>
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
				<h3>My Page</h3>
			</div>
			<div>
				<form id="myForm" action="../profile/update_mypage" method="post">
					<p>
						<label>ID</label> 
						<input class="w3-input" type="text" id="id" name="id" readonly value="${ pvo.id }"> 
					</p>
					<p>
						<label>Email</label> 
						<input class="w3-input" type="text" id="email" name="email" value="${ pvo.email }" required> 
					</p>
					<p class="w3-center">
						<button type="submit" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">회원정보 변경</button>
					</p>
				</form>								
				<br />
				
				
				
				<form id="pwForm" action="../profile/update_pw" method="post">	
					<input type="hidden" name="id" value="${ pvo.id }">
					<p>
						<label>Password</label>
						<input class="w3-input" id="old_pw" name="old_pw" type="password" required>
					</p>
					<p>
						<label>New Password</label> 
						<input class="w3-input" id="passwd" name="passwd" type="password" required>
					</p>
					<p>
						<label>Confirm</label>
						<input class="w3-input" type="password" id="passwd2" type="password" required>
					</p>
					<p class="w3-center">
						<button type="submit" id="joinBtn" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">비밀번호 변경</button>
					</p>
				</form>
				<br />
				
				
				
				<form id="wdForm" action="../profile/withdrawal" method="post">
					<input type="hidden" name="id" readonly value="${ pvo.id }">
					<p>
						<label>Password</label>
						<input class="w3-input" type="password" name="passwd" required>
					</p>
					<p class="w3-center">
						<button type="submit" id="withdrawalBtn" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">회원탈퇴</button>
					</p>
				</form>
			</div>
		</div>
	</div>
</body>
</html> 
