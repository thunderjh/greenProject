<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
	<title>Insert title here</title>
	
	<style>
		html, body, h1, h2, h3, h4, h5 {font-family: "Open Sans", sans-serif}
	</style>
	
	<style type="text/css">		
		.form1 {
			background-color: #d9d9d9;		   
		}
		   
		.div00 {
			margin: auto;
			background-color: #d9d9d9;
			width: 600px;
			text-align: center;
		}
			
		.input_group {
			border-bottom: 0px dotted #ccc;
			font: 1em/40px '돋움', 'Helvetica';
		}			
										
	</style>	
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="/resources/include/dist/js/bootstrap.min.js"></script>
    <script src="/resources/include/dist/assets/js/docs.min.js"></script>
	<script type="text/javascript">
	$(function(){
		$("#btnLogin").click(function(){
			id=$("#id").val();
		 var passwd=$("#passwd").val(); if(id == ""){
		  alert("아이디를 입력하세요");
		  $("#id").focus(); //입력포커스 이동

		  return; //함수 종료
		}
		if(passwd==""){
		 alert("비밀번호를 입력하세요"); 
		 $("#passwd").focus();
		  return;
		}
		//폼 내부의 데이터를 전송할 주소
		 document.form1.action= "${path}/profile/loginCheck";
		 document.form1.submit(); //제출
		 });
		});
	</script>
	</head>
	
	<body>
	<div class="div00">
		<h1>로그인</h1>
		<form name="form1" method="post">
			<div class="input_group">
				<div class="input_group">
					<input id="id" name="id" maxlength="12" placeholder="Username" />
				</div>
				<div class="input_group">
					<input type="password" id="passwd" name="passwd" placeholder="Password" />
				</div>
				<div class="input_group">
					<button type="button" id="btnLogin">login</button>
					<c:if test="${message == 'error'}">
						<div style="color:red;"> 아이디 또는 비밀번호가 일치하지 않습니다.</div>
					</c:if>
					<c:if test="${message == 'logout'}">
						<div style="color:red;"> 로그아웃되었습니다.</div>
					</c:if>
				</div>
			</div>
		</form>
	</div>
	</body>
</html>