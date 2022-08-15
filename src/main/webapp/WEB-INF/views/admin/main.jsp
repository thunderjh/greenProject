<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="/resources/images/common/logo.png">

    <title>greenProject(admin)</title>

  
    <link href="/resources/include/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/include/dist/css/signin.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="/resources/include/dist/assets/js/ie-emulation-modes-warning.js"></script>
    <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="/resources/include/js/common.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script>
    $(function(){
    	let errorMsg="${errorMsg}";
    	if(errorMsg!=""){
    		alert(errorMsg);
    		errorMsg="";
    	}
    	$("#loginBtn").click(function(){
    	if(!chkData("#a_id","아이디를")) return;
    	else if(!chkData("#a_passwd","비밀번호를")) return;
    	else{
    		$("#loginForm").attr({
    			"method" :"post",
    			"action" :"/admin/login"
    		});
    		$("#loginForm").submit();
    	}
    	});
    });
    </script>
  </head>

  <body>
<!-- 관리자로그인페이지 -->
    <div class="container text-center">

      <form class="form-signin" id="loginForm">
        <h2 class="form-signin-heading text-center">greenProject</h2>
        <label for="a_id" class="sr-only">아이디</label>
        <input type="text" id="a_id" name="a_id" class="form-control" placeholder="아이디" required autofocus>
        <label for="a_pwd" class="sr-only">비밀번호</label>
        <input type="password" name="a_passwd" id="a_passwd" class="form-control" placeholder="비밀번호" required>
        
        <button class="btn btn-lg btn-primary btn-block" type="button" id="loginBtn">로그인</button>
      </form>

    </div>


 
    <script src="/resources/include/dist/assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
