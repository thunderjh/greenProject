<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>   
 <%@ page trimDirectiveWhitespaces="true" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들">
<meta name="generator" content="Hugo 0.88.1">

<link rel="icon" href="image/logo.png">

<!--     <link rel="canonical" href="https://getbootstrap.kr/docs/5.1/examples/carousel/"> -->

<!-- Bootstrap core CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<!-- Favicons -->
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<meta name="theme-color" content="#7952b3">

<link rel="styleSheet" href="/resources/include/css/greenProject.css">
<title><tiles:insertAttribute name="title" /></title>

</head>
<body>
	<!-- 네비게이션(헤더) 바  시작-->
	<header>
		<nav class="navbar navbar-expand-md navbar-light fixed-top bg-light">
			<tiles:insertAttribute name="header" />
		</nav>
	</header>
	<!-- 네비게이션(헤더) 바 끝 -->
	
	<main>
	<tiles:insertAttribute name="main" />
	</main>

	<!-- 풋터 시작 -->
	<footer class="text-muted py-5">
		<tiles:insertAttribute name="footer" />
	</footer>
	<!-- 풋터 종료 -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>