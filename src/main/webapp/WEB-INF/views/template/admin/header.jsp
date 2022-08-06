<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@page trimDirectiveWhitespaces="true"%>
<!-- 관리자페이지헤더 -->
<div class="container-fluid">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#navbar" aria-expanded="false"
			aria-controls="navbar">
			<span class="sr-only"></span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<div class="inline navbar-brand text-center">GreenProject [관리자 페이지] -
		<c:if test="${not empty adminLogin}">
		${adminLogin.a_name} <small>관리자님</small>
		<a href ="/admin/logout" class="btn btn-primary btn-sm active" role="button">로그아웃</a>
		</c:if>
		<c:if test="${empty adminLogin}">
		<script type="text/javascript">
		loaction.href="/admin/login";
		</script>
		</c:if>
		</div>
	</div>
</div>