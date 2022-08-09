<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
	<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="/resources/include/dist/js/bootstrap.min.js"></script>
    <script src="/resources/include/dist/assets/js/docs.min.js"></script>
	<script type="text/javascript">
	</script>
	</head>
	
	<body>
		로그인 성공시 나오는 페이지입니다 ^^
		<hr/>
		<input type="button" value="회원가입" onclick="location.href= '/profile/memberJoinForm'">
		<c:if test="${pvo == null}">
			<input type="button" value="로그인" onclick="location.href='/profile/login'">
		</c:if>
		
		<hr/>
		<c:if test="${pvo != null}">
			<a href="/profile/mainMypage">마이페이지(${pvo.id})</a>
			<input type="button" value="로그아웃" onclick="location.href='/profile/logout'">
		</c:if>
	</body>
</html>