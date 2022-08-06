<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page trimDirectiveWhitespaces="true"%>
<!-- 관리자페이지 left -->
<c:set var="uri" value='${requestScope["javax.servlet.forward.request_uri"]}' />


<ul class="nav nav-sidebar">
	<li><a href="#">관리자 메뉴</a></li>
	<li <c:if test="${fn:containsIgnoreCase(uri,'/admin/board')}">class="active"</c:if>>
	<a href="/admin/board/pointApproval">포인트 관리</a>
	</li>
	<li <c:if test="${fn:containsIgnoreCase(uri,'/admin/member')}">class="active"</c:if>>
	<a href="#">게시판 관리</a>
	</li>
</ul>