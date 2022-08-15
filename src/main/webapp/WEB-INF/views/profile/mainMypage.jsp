<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/resources/include/dist/js/bootstrap.min.js"></script>
<script src="/resources/include/dist/assets/js/docs.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<style>
html, body, h1, h2, h3, h4, h5 {font-family: "Open Sans", sans-serif}
</style> 
</head>


<body class="bg-light">

<!-- Page Container -->
<div class="w3-container w3-content" style="max-width:1400px;margin-top:80px">    
  <!-- The Grid -->
  <div class="w3-row">
    <!-- Left Column -->
    <div class="w3-col m3">
      <br>    
    <!-- End Left Column -->
    </div>    
    <!-- Middle Column -->
    <div class="w3-col m7">
    
   <header></header>
      <!-- Profile -->
      <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
        <span class="w3-right w3-opacity">1 min</span>
        <h4>마이페이지</h4><br>
        <p class="w3-center"><img src="https://cdn-icons-png.flaticon.com/512/149/149071.png" class="w3-circle" style="height:106px;width:106px" alt="Avatar"></p>
        <!-- 데이터 출력 -->
		<c:if test="${pvo == null}">
			<p class="w3-center">등록되지 않은 회원</p>
		</c:if>
		<c:if test="${pvo != null}">
			<p class="w3-center">${ pvo.id }</p>
		</c:if>       	
        <hr class="w3-clear">
        
        <p><a class="fa fa-pencil fa-fw w3-margin-right w3-text-theme" href="/profile/mypage" ></a><a> 회원정보 수정</a></p>
        <p><i class="fas fa-piggy-bank fa-fw w3-margin-right w3-text-theme"></i><a> 포인트 조회</a></p>
        <p><i class="fa fa-comments fa-fw w3-margin-right w3-text-theme"></i><a> 문의사항 내역 확인</a></p>
        <p><i class="fas fa-hand-holding-usd fa-fw w3-margin-right w3-text-theme"></i><a> 기부내역 확인</a></p>

     
      </div>
           
    <!-- End Middle Column -->
    </div>   
  <!-- End Grid -->
  </div> 
<!-- End Page Container -->
</div>

</body>
</html> 
