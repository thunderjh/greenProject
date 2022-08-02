<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
	<%@ include file="include/menu.jsp" %>
	<P> The time on the server is ${serverTime}. </P>
	<a href="/profile/login">게시판 리스트 이동 port</a>
	 // server타임은 생략해도 됨
	${result}
</body>
</html>
