<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<style type="text/css">
	nav{
		margin:0;
	}
	#navbarCollapse{
		display: flex;
	}
	#nav_ul{
		display: flex;
		justify-content:center;
		text-align: center;
	}
	#nav_li{
		font-size: 16px;
	}
	#nav_li a{
		text-decoration: none;
	}
</style>

	<nav class="navbar navbar-expand-md navbar-light fixed-top bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="/resources/greenProject.html"><img src="/resources/images/common/logo.png" id="logo"></a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<ul class="navbar-nav me-auto mb-2 mb-md-0" id="nav_ul">
					<li class="nav-item" id="nav_li"><a class="nav-link" href="#">소개</a></li>
					<li class="nav-item" id="nav_li"><a class="nav-link" href="#">캠페인</a></li>
					<li class="nav-item" id="nav_li"><a class="nav-link" href="#">미션</a></li>
					<li class="nav-item" id="nav_li"><a class="nav-link" href="/notice/noticeList">고객센터</a></li>
				</ul>
				<form class="d-flex">
					<a href="#"><img src="/resources/images/common/myPage.png"></a> <a href="#"><img src="/resources/images/common/signIn.png"></a> <a href="#"><img src="/resources/images/common/singUp.png"></a>
				</form>
			</div>
		</div>
	</nav>