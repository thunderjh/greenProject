<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 미션인증게시판리스트 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<!-- 브라우저의 호환성 보기 모드를 막고, 해당 브라우저에서 지원하는 가장 최신 버전의 방식으로 HTML 보여주도록 설정.-->
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<!--viewport : 화면에 보이는 영역을 제어하는 기술. width는 device-width로 설정(브라우저 너비를 장치 너비에 맞추어 표시). initial-scale는 초기비율(보이는 영역과 웹 페이지를 맞춤). user-scalable는 사용자가 화면축소를 하지 못하도록 설정.-->

<title>미션인증게시판</title>
<style>
body {
	padding-top: 70px;
	padding-bottom: 30px;
}
</style>
<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="/resources/images/common/icon.png" />
<link rel="apple-touch-icon" href="/resources/images/common/icon.png" />
<!-- 모바일 웹 페이지 설정 끝 -->

<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->

<link rel="stylesheet" type="text/css"
	href="/resources/include/dist/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/include/dist/css/bootstrap-theme.min.css" />

<link rel="stylesheet" type="text/css"
	href="/resources/include/dist/css/default.css" />
<!-- jQuery framework 참조하기 -->
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript"
	src="/resources/include/dist/js/bootstrap.min.js"></script>
</head>
<body>
<article>
		<div class="container">
			<div class="table-responsive">
				<h2>포인트 조회</h2>
				<h4 class="text-right">총 포인트 : ${totalPoint}</h4>
<table class="table table-striped table-sm">
					<colgroup>
						<col style="width: 5%;" />
						<col style="width: auto;" />
						<col style="width: 10%;" />
					</colgroup>
					<thead>
						<tr>
							<th>NO</th>
							<th>글제목</th>
							<th>승인여부</th>
						</tr>
					</thead>
					<tbody id="list">
						<c:choose>
							<c:when test="${not empty pointList}">
								<c:forEach var="list" items="${pointList}" varStatus="status">
									<tr>
										<td>${list.m_no}</td>
										<td>${list.m_title}</td>
										<td>${list.m_p_approval}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="6" align="center">포인트 내역이 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				</div>
				</div>
				</article>
</body>
</html>