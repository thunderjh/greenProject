<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들">
<meta name="generator" content="Hugo 0.88.1">
<title>greenProject</title>
<link rel="icon" href="images/common/logo.png">

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

<link rel="styleSheet" href="include/css/greenProject.css">
</head>
<body>
	<!-- 네비게이션 바  시작-->
	<header>
		<nav class="navbar navbar-expand-md navbar-light fixed-top bg-light">
			<div class="container-fluid">
				<a class="navbar-brand" href="#"><img src="images/common/logo.png" id="logo">GreenProject</a>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarCollapse">
					<ul class="navbar-nav me-auto mb-2 mb-md-0">
						<li class="nav-item"><a class="nav-link active" aria-current="page" href="#">소개</a></li>
						<li class="nav-item"><a class="nav-link" href="#">캠페인</a></li>
						<li class="nav-item"><a class="nav-link" href="#">미션</a></li>
						<li class="nav-item"><a class="nav-link" href="/notice/noticeList">고객센터</a></li>
					</ul>
					<form class="d-flex">
					<a href="#"><img src="images/common/myPage.png"></a> 
					
					<c:if test="${pvo == null}">
						<a href="/profile/login">로그인<img src="images/common/signIn.png"></a> 
						<a href="/profile/memberJoinForm">가입<img src="images/common/singUp.png"></a>
					</c:if>
					
					<c:if test="${pvo != null}">
						<a href="/profile/logout">로그아웃<img src="images/common/signIn.png"></a> 
						<a href="/profile/mainMypage">마이페이지<img src="images/common/singUp.png"></a>
					</c:if>
					
						
					</form>
				</div>
			</div>
		</nav>
	</header>
	<!-- 네비게이션 바 끝 -->
	
	<main>
	
		<!-- 메인 이미지 섹션 시작 -->
		<div class="position-relative overflow-hidden p-3 p-md-5 m-md-3 text-center bg-light">
			<div class="col-md-5 p-lg-5 mx-auto my-5">
				<h1 class="display-4 fw-normal">Punny headline</h1>
				<p class="lead fw-normal"></p>
				<a class="btn btn-outline-secondary" href="#">Coming soon</a>
			</div>
			<div class="product-device shadow-sm d-none d-md-block"></div>
			<div class="product-device product-device-2 shadow-sm d-none d-md-block"></div>
		</div>
		<!-- 메인 이미지 섹션 끝-->
		
		<!-- 캠페인 섹션 시작 -->
		<div class="album py-5 bg-light">
			<div class="container">
				<h3 class="h3Title"><a href="#">진행 중인 캠페인 ></a></h3>
				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
					<div class="col">
						<div class="card shadow-sm">
							<svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
								<title>Placeholder</title><rect width="100%" height="100%" fill="#55595c" />
								<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
							<div class="card-body">
								<h4>복날, 삼계탕으로 어르신의 기력을 회복시켜요!</h4>
								<p class="card-text">꽃밭정이노인복지관</p>
								<div class="progress">
									<div class="progress-bar bg-success" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
								</div>
								<span>25%</span><span class="right">2,053,800원</span>
							</div>
						</div>
					</div>
					
					<div class="col">
						<div class="card shadow-sm">
							<svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
								<title>Placeholder</title><rect width="100%" height="100%" fill="#55595c" />
								<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
							<div class="card-body">
								<h4>복날, 삼계탕으로 어르신의 기력을 회복시켜요!</h4>
								<p class="card-text">꽃밭정이노인복지관</p>
								<div class="progress">
									<div class="progress-bar bg-success" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
								</div>
								<span>25%</span><span class="right">2,053,800원</span>
							</div>
						</div>
					</div>
					
					<div class="col">
						<div class="card shadow-sm">
							<svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
								<title>Placeholder</title><rect width="100%" height="100%" fill="#55595c" />
								<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
							<div class="card-body">
								<h4>복날, 삼계탕으로 어르신의 기력을 회복시켜요!</h4>
								<p class="card-text">꽃밭정이노인복지관</p>
								<div class="progress">
									<div class="progress-bar bg-success" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
								</div>
								<span>25%</span><span class="right">2,053,800원</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 캠페인 섹션 끝 -->
		
		<!-- 진행 중인 후원 섹션 시작 -->
		<div class="album py-5 bg-light">
			<div class="container">
				<h3 class="h3Title"><a href="#">진행 중인 후원 ></a></h3>
				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
					<div class="col">
						<div class="card shadow-sm">
							<svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
								<title>Placeholder</title><rect width="100%" height="100%" fill="#55595c" />
								<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
							<div class="card-body">
								<h4>복날, 삼계탕으로 어르신의 기력을 회복시켜요!</h4>
								<p class="card-text">꽃밭정이노인복지관</p>
								<div class="progress">
									<div class="progress-bar bg-success" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
								</div>
								<span class="left">25%</span><span class="right">2,053,800원</span>
							</div>
						</div>
					</div>
					
					<div class="col">
						<div class="card shadow-sm">
							<svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
								<title>Placeholder</title><rect width="100%" height="100%" fill="#55595c" />
								<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
							<div class="card-body">
								<h4>복날, 삼계탕으로 어르신의 기력을 회복시켜요!</h4>
								<p class="card-text">꽃밭정이노인복지관</p>
								<div class="progress">
									<div class="progress-bar bg-success" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
								</div>
								<span>25%</span><span class="right">2,053,800원</span>
							</div>
						</div>
					</div>
					
					<div class="col">
						<div class="card shadow-sm">
							<svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
								<title>Placeholder</title><rect width="100%" height="100%" fill="#55595c" />
								<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
							<div class="card-body">
								<h4>복날, 삼계탕으로 어르신의 기력을 회복시켜요!</h4>
								<p class="card-text">꽃밭정이노인복지관</p>
								<div class="progress">
									<div class="progress-bar bg-success" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
								</div>
								<span>25%</span><span class="right">2,053,800원</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 진행 중인 후원 섹션끝 -->	
	</main>

	<footer class="text-muted py-5">
		<div class="container">
			<p class="float-end mb-1">
				<a href="#">Back to top</a>
			</p>
			<p class="mb-1">Album example is &copy; Bootstrap, but please download and customize it for yourself!</p>
			<p class="mb-0">New to Bootstrap?
				<a href="/">Visit the homepage</a> or read our
				<a href="/docs/5.1/getting-started/introduction/">getting started guide</a>.
			</p>
		</div>
	</footer>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>